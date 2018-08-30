
#import "Application.h"
#import "CBX-XCTest-Umbrella.h"
#import "XCTest+CBXAdditions.h"
#import "Testmanagerd.h"
#import "ThreadUtils.h"
#import "CBXWaiter.h"
#import "CBXMachClock.h"
#import "CBXConstants.h"
#import "CBXException.h"
#import "JSONUtils.h"
#import "CBXDevice.h"

@interface Application ()
@property (nonatomic, strong) XCUIApplication *app;
@end

@implementation Application
static Application *currentApplication;

+ (void)load {
    static dispatch_once_t oncet;
    dispatch_once(&oncet, ^{
        currentApplication = [self new];
    });
}

+ (XCUIApplication *)currentApplication {
    return currentApplication.app;
}

- (void)startSession {
    DDLogDebug(@"Launching application '%@'", self.app.bundleID);

    __block NSError *outerError = nil;
    [ThreadUtils runSync:^(BOOL *setToTrueWhenDone) {
        [[Testmanagerd get] _XCT_launchApplicationWithBundleID:self.app.bundleID
                                                     arguments:self.app.launchArguments
                                                   environment:self.app.launchEnvironment
                                                    completion:^(NSError *innerError) {
                                                        outerError = innerError;
                                                        *setToTrueWhenDone = YES;
                                                    }];
    }];

    if (outerError) {
        NSString *errorMessage;
        errorMessage = [NSString stringWithFormat:@"Could not launch application with bundle identifier: %@\n%@",
                        self.app.bundleID, outerError.localizedDescription];
        @throw [CBXException withMessage:errorMessage userInfo:nil];
    }
}

+ (XCUIApplicationState)terminateCurrentApplication {
    XCUIApplication *app = currentApplication.app;
    if (!app) {
        DDLogDebug(@"There is no current application");
        return XCUIApplicationStateNotRunning;
    } else {
        return [Application terminateApplication:app];
    }
}

+ (XCUIApplicationState)terminateApplication:(XCUIApplication *)application {
    NSTimeInterval startTime = [[CBXMachClock sharedClock] absoluteTime];
    if (application.state == XCUIApplicationStateNotRunning) {
        DDLogDebug(@"Application %@ is not running", application.identifier);
        return XCUIApplicationStateNotRunning;
    }

    [application terminate];

    [CBXWaiter waitWithTimeout:10
                     untilTrue:^BOOL{
                         return application.state == XCUIApplicationStateNotRunning;
                     }];
    NSTimeInterval elapsed = [[CBXMachClock sharedClock] absoluteTime] - startTime;

    if (application.state != XCUIApplicationStateNotRunning) {
        DDLogDebug(@"Application did not terminate after %@ seconds", @(elapsed));
    } else {
        DDLogDebug(@"Application did terminate after %@ seconds", @(elapsed));
    }

    return application.state;
}

+ (XCUIApplicationState)terminateApplicationWithIdentifier:(NSString *)bundleIdentifier {
    XCUIApplication *application;
    application = [[XCUIApplication alloc] initWithBundleIdentifier:bundleIdentifier];
    return [Application terminateApplication:application];
}

+ (BOOL)iOSVersionIsAtLeast103 {
    NSString *version = [[CBXDevice sharedDevice] iOSVersion];
    NSDecimalNumber *iOSVersion = [NSDecimalNumber decimalNumberWithString:version];
    NSDecimalNumber *tenDotThree = [NSDecimalNumber decimalNumberWithString:@"10.3"];
    return [iOSVersion compare:tenDotThree] != NSOrderedAscending;
}

+ (NSDictionary *)launchEnvironmentWithEnvArg:(NSDictionary *)environmentArg {
    static NSString *bootstrapDylib = @"/Developer/usr/lib/libXCTTargetBootstrapInject.dylib";
    static NSString *key = @"DYLD_INSERT_LIBRARIES";

    if ([Application iOSVersionIsAtLeast103]) {
        if (!environmentArg || environmentArg.count == 0) {
            return @{key : bootstrapDylib};
        } else {
            if (!environmentArg[key]) {
                NSMutableDictionary *mutable;
                mutable = [NSMutableDictionary dictionaryWithDictionary:environmentArg];
                mutable[key] = bootstrapDylib;
                return [NSDictionary dictionaryWithDictionary:mutable];
            } else {
                NSString *value = environmentArg[key];
                if ([value containsString:bootstrapDylib]) {
                    return environmentArg;
                } else {
                    NSMutableDictionary *mutable;
                    mutable = [NSMutableDictionary dictionaryWithDictionary:environmentArg];
                    mutable[key] = [value stringByAppendingFormat:@":%@", bootstrapDylib];
                    return [NSDictionary dictionaryWithDictionary:mutable];
                }
            }
        }
    } else {
        return environmentArg ?: @{};
    }
}

+ (void)launchAppWithBundleId:(NSString *_Nullable)bundleId
                   launchArgs:(NSArray *_Nullable)launchArgs
                    launchEnv:(NSDictionary *_Nullable)environment
           terminateIfRunning:(BOOL)terminateIfRunning {

    XCUIApplication *application = [[XCUIApplication alloc]
                                    initWithBundleIdentifier:bundleId];

    if (terminateIfRunning) {
        [Application terminateApplication:application];
    }

    application.launchArguments = launchArgs ?: @[];
    application.launchEnvironment = [Application launchEnvironmentWithEnvArg:environment];
    currentApplication.app = application;
    [currentApplication startSession];
}

+ (NSDictionary *)tree {
    XCUIApplication *application = [Application currentApplication];
    XCElementSnapshot *snapshot = [application cbxXCElementSnapshot];
    return [Application snapshotTree:snapshot];
}

+ (NSDictionary *)snapshotTree:(XCElementSnapshot *)snapshot {
    NSMutableDictionary *json = [JSONUtils snapshotOrElementToJSON:snapshot];

    if (snapshot.children.count) {
        NSMutableArray *children = [NSMutableArray array];
        for (XCElementSnapshot *child in snapshot.children) {
            [children addObject:[self snapshotTree:child]];
        }
        json[@"children"] = children;
    }
    return json;
}

@end
