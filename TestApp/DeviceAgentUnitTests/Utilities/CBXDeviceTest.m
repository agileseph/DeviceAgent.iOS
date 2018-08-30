
#import "CBXServerUnitTestUmbrellaHeader.h"
#import "CBXDevice.h"
#import "JSONUtils.h"

static NSString *const LPiPhone6SimVersionInfo = @"Device: iPhone 6 - Runtime: iOS 8.1 (12B411) - DeviceType: iPhone 6";

static NSString *const LPiPhone6PlusSimVersionInfo = @"CoreSimulator 110.4 - Device: iPhone 6 Plus - Runtime: iOS 8.1 (12B411) - DeviceType: iPhone 6 Plus";

static NSString *const LPiPhone5sSimVersionInfo = @"CoreSimulator 110.4 - Device: iPhone 5s - Runtime: iOS 8.1 (12B411) - DeviceType: iPhone 5s";

@interface CBXDevice (LPXCTEST)

- (id) init_private;

- (UIScreenMode *)currentScreenMode;
- (CGSize)sizeForCurrentScreenMode;
- (CGFloat)scaleForMainScreen;
- (CGFloat)heightForMainScreenBounds;
- (NSString *)physicalDeviceModelIdentifier;
- (NSPredicate *)iPhone6SimPredicate;
- (NSPredicate *)iPhone6PlusSimPredicate;
- (NSDictionary *)processEnvironment;
- (NSString *)simulatorModelIdentifier;
- (NSString *)simulatorVersionInfo;
- (NSDictionary *)formFactorMap;
- (NSDictionary *)instructionSetMap;
- (BOOL)isLetterBox;

@end

@interface CBXDeviceTest : XCTestCase

@property(nonatomic, strong) CBXDevice *device;

@end

@implementation CBXDeviceTest

- (void)setUp {
    [super setUp];
    self.device = [[CBXDevice alloc] init_private];
}

- (void)tearDown {
    [super tearDown];
    self.device = nil;
}

#if TARGET_IPHONE_SIMULATOR

- (void)testSimulatorModelIdentiferReturnsSomething {
    expect([self.device simulatorModelIdentifier]).notTo.equal(nil);
}

- (void)testSimulatorVersionReturnsSomething {
    expect([self.device simulatorVersionInfo]).notTo.equal(nil);
}

- (void)testSimulator {
    expect([self.device isSimulator]).to.equal(YES);
}

- (void)testPhysicalDevice {
    expect([self.device isPhysicalDevice]).to.equal(NO);
}

#else

- (void)testSimulatorModelIdentifierReturnsNothing {
    expect([self.device simulatorModelIdentifier]).to.equal(nil);
}

- (void)testSimulatorVersionReturnsNothing {
    expect([self.device simulatorVersionInfo]).to.equal(nil);
}

- (void)testSimulator {
    expect([self.device isSimulator]).to.equal(NO);
}

- (void)testPhysicalDevice {
    expect([self.device isPhysicalDevice]).to.equal(YES);
}

- (void)testPhysicalDeviceModelIdentifierReturnsSomething {
    NSString *actual = [self.device physicalDeviceModelIdentifier];
    expect(actual).notTo.equal(nil);
    expect(actual).notTo.equal(@"");
}

#endif

- (void)testiOSVersionReturnsSomething {
    NSString *actual = [self.device iOSVersion];
    expect(actual).notTo.equal(nil);
    expect(actual).notTo.equal(@"");
}

- (void)testProcessEnvironment {
    NSDictionary *dictionary = [self.device processEnvironment];
    expect([dictionary count]).notTo.equal(0);
    NSDictionary *memomized = [self.device processEnvironment];
    XCTAssertEqual(dictionary, memomized);
}

- (void)testSimulatorModelIdentifierKeyFound {
    NSDictionary *env = @{CBXDeviceSimKeyModelIdentifier : @"apples"};
    id mock = OCMPartialMock(self.device);
    [[[mock expect] andReturn:env] processEnvironment];

    expect([self.device simulatorModelIdentifier]).to.equal(@"apples");

    [mock verify];
}

- (void)testSimulatorModelIdentifierKeyNotFound {
    NSDictionary *env = @{};
    id mock = OCMPartialMock(self.device);
    [[[mock expect] andReturn:env] processEnvironment];

    expect([self.device simulatorModelIdentifier]).to.equal(nil);

    [mock verify];
}

- (void)testSimulatorVersionInfoKeyFound {
    NSDictionary *env = @{CBXDeviceSimKeyVersionInfo : @"oranges"};
    id mock = OCMPartialMock(self.device);
    [[[mock expect] andReturn:env] processEnvironment];

    expect([self.device simulatorVersionInfo]).to.equal(@"oranges");

    [mock verify];
}

- (void)testSimulatorVersionInfoKeyNotFound {
    NSDictionary *env = @{};
    id mock = OCMPartialMock(self.device);
    [[[mock expect] andReturn:env] processEnvironment];

    expect([self.device simulatorVersionInfo]).to.equal(nil);

    [mock verify];
}

- (void)testSimulatorYES {
    id mock = OCMPartialMock(self.device);
    OCMStub([mock simulatorModelIdentifier]).andReturn(@"anything");

    expect([self.device isSimulator]).to.equal(YES);

    OCMVerify([mock simulatorModelIdentifier]);
}

- (void)testSimulatorNO {
    id mock = OCMPartialMock(self.device);
    OCMStub([mock simulatorModelIdentifier]).andReturn(nil);

    expect([self.device isSimulator]).to.equal(NO);

    OCMVerify([mock simulatorModelIdentifier]);
}

- (void)testIPadYES {
    id mock = OCMPartialMock([UIDevice currentDevice]);
    BOOL ipadIdiom = UIUserInterfaceIdiomPad;
    [[[mock stub] andReturnValue:OCMOCK_VALUE(ipadIdiom)] userInterfaceIdiom];

    expect([self.device isIPad]).to.equal(YES);
}

- (void)testIPadNO {
    id mock = OCMPartialMock([UIDevice currentDevice]);
    BOOL ipadIdiom = UIUserInterfaceIdiomPhone;
    [[[mock stub] andReturnValue:OCMOCK_VALUE(ipadIdiom)] userInterfaceIdiom];

    expect([self.device isIPad]).to.equal(NO);
}

- (void)testSystemSimulator {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock isSimulator]).andReturn(YES);
    OCMExpect([mock simulatorModelIdentifier]).andReturn(@"simulator");

    expect([mock modelIdentifier]).to.equal(@"simulator");

    OCMVerifyAll(mock);
}

- (void)testSystemPhysicalDevice {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock isSimulator]).andReturn(NO);
    OCMExpect([mock physicalDeviceModelIdentifier]).andReturn(@"physical device");

    expect([mock modelIdentifier]).to.equal(@"physical device");

    OCMVerifyAll(mock);
}

- (void)testFormFactorIpad {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock isIPad]).andReturn(YES);
    OCMExpect([mock formFactorMap]).andReturn(@{});

    expect([mock formFactor]).to.equal(@"ipad");

    OCMVerifyAll(mock);
}

- (void)testFormFactorIpadPro13in {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock modelIdentifier]).andReturn(@"iPad6,7");

    expect([mock formFactor]).to.equal(@"ipad pro");

    OCMVerifyAll(mock);
}

- (void)testFormFactorIpadPro13inCellular {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock modelIdentifier]).andReturn(@"iPad6,8");

    expect([mock formFactor]).to.equal(@"ipad pro");
    OCMVerifyAll(mock);
}

- (void)testFormFactoryIpadPro9in {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock modelIdentifier]).andReturn(@"iPad6,3");

    expect([mock formFactor]).to.equal(@"ipad pro");

    OCMVerifyAll(mock);
}

- (void)testFormFactoryIpadPro9inCellular {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock modelIdentifier]).andReturn(@"iPad6,4");

    expect([mock formFactor]).to.equal(@"ipad pro");

    OCMVerifyAll(mock);
}

- (void)testFormFactorIphone6se {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock modelIdentifier]).andReturn(@"iPhone8,4");

    expect([mock formFactor]).to.equal(@"iphone 4in");
    OCMVerifyAll(mock);
}

- (void)testFormFactorUnknown {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock modelIdentifier]).andReturn(@"iPhone30,30");
    OCMExpect([mock isIPad]).andReturn(NO);
    OCMExpect([mock formFactorMap]).andReturn(@{});

    expect([mock formFactor]).to.equal(@"iPhone30,30");

    OCMVerifyAll(mock);
}

- (void)testFormFactorHasValueInMap {
    NSString *modelIdentifier = [self.device modelIdentifier];
    NSString *actual = [self.device formFactor];

    expect(actual).notTo.equal(modelIdentifier);
}

- (void)testIsIPhone4LikeYES {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"iphone 3.5in");

    expect([mock isIPhone4Like]).to.equal(YES);

    OCMVerifyAll(mock);
}

- (void)testIsIphone4LikeNO {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"garbage");

    expect([mock isIPhone4Like]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsIPhone5LikeYES {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"iphone 4in");

    expect([mock isIPhone5Like]).to.equal(YES);

    OCMVerifyAll(mock);
}

- (void)testIsIphone5LikeNO {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"garbage");

    expect([mock isIPhone5Like]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsIPadProYES {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"ipad pro");

    expect([mock isIPadPro]).to.equal(YES);

    OCMVerifyAll(mock);
}

- (void)testIsIPadProNO {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"garbage");

    expect([mock isIPadPro]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsIPhone6LikeYES {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"iphone 6");

    expect([mock isIPhone6Like]).to.equal(YES);

    OCMVerifyAll(mock);
}

- (void)testIsIPhone6LikeNO {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"garbage");

    expect([mock isIPhone6Like]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsIPhone6PlusLikeYES {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"iphone 6+");

    expect([mock isIPhone6PlusLike]).to.equal(YES);

    OCMVerifyAll(mock);
}

- (void)testIsIPhone6PlusLikeNO {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"garbage");

    expect([mock isIPhone6PlusLike]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsIPhone10LikeNO {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"garbage");

    expect([mock isIPhone10Like]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsIPhone10LikeYES {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock formFactor]).andReturn(@"iphone 10");

    expect([mock isIPhone10Like]).to.equal(YES);

    OCMVerifyAll(mock);
}

- (void)testIsLetterBoxNoBecauseIpad {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock isIPad]).andReturn(YES);

    expect([mock isLetterBox]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsLetterBoxNoBecauseIPhone4Like {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock isIPad]).andReturn(NO);
    OCMExpect([mock isIPhone4Like]).andReturn(YES);

    expect([mock isLetterBox]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsLetterBoxNoScaleIsWrong {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock isIPad]).andReturn(NO);
    OCMExpect([mock isIPhone4Like]).andReturn(NO);
    OCMExpect([mock scaleForMainScreen]).andReturn(2.0);

    expect([mock isLetterBox]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsLetterBoxNoHeightIsWrong {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock isIPad]).andReturn(NO);
    OCMExpect([mock isIPhone4Like]).andReturn(NO);
    OCMExpect([mock scaleForMainScreen]).andReturn(2.0);
    OCMExpect([mock heightForMainScreenBounds]).andReturn(10);

    expect([mock isLetterBox]).to.equal(NO);

    OCMVerifyAll(mock);
}

- (void)testIsLetterBoxYES {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock isIPad]).andReturn(NO);
    OCMExpect([mock isIPhone4Like]).andReturn(NO);
    OCMExpect([mock scaleForMainScreen]).andReturn(2.0);
    OCMExpect([mock heightForMainScreenBounds]).andReturn(480);

    expect([mock isLetterBox]).to.equal(YES);

    OCMVerifyAll(mock);
}

- (void)testDictionaryRepresentation {
    NSDictionary *dictionary = [self.device dictionaryRepresentation];
    expect(dictionary.count).to.equal(20);
}

- (void)testInstructionSetMap {
    NSDictionary *map = [self.device instructionSetMap];
    expect(map.count).to.equal(2);

    expect([map[@"armv7"] count]).to.equal(15);
    expect([map[@"armv7s"] count]).to.equal(7);
}

- (void)testArmVersion {
    NSString *version = [self.device armVersion];
    expect(version).notTo.equal(@"unknown");
}

- (void)testIsArm64YES {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock armVersion]).andReturn(@"arm64");

    expect([mock isArm64]).to.equal(YES);

    OCMVerifyAll(mock);
}

- (void)testIsArm64NO {
    id mock = OCMPartialMock(self.device);
    OCMExpect([mock armVersion]).andReturn(@"armv7");

    expect([mock isArm64]).to.equal(NO);

    OCMVerifyAll(mock);
}

@end
