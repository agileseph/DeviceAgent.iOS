
#import "QuerySpecifierByProperty.h"
#import "XCTest+CBXAdditions.h"
#import "CBX-XCTest-Umbrella.h"
#import "InvalidArgumentException.h"
#import "CBXConstants.h"

@implementation QuerySpecifierByProperty
+ (NSDictionary <NSString *, id> *)parseValue:(id)value {
    NSMutableDictionary *ret = [NSMutableDictionary dictionary];
    if ([value isKindOfClass:[NSString class]]) {
        NSArray *components = [value componentsSeparatedByString:@"="];
        if (components.count < 2) {
            @throw [InvalidArgumentException withFormat:@"Malformed property selector. Expected 'key=val', got '%@'", value];
        }
        if ([components[0] isEqualToString:@""]) {
            @throw [InvalidArgumentException withMessage:@"Invalid property selector (can not use empty string as 'key')."];
        }
        ret[CBX_KEY_KEY] = components[0];
        ret[CBX_VALUE_KEY] = components[1];
    } else if ([value isKindOfClass:[NSDictionary class]]) {
        ret[CBX_KEY_KEY] = value[CBX_KEY_KEY] ?: value[@"property"] ?: value[@"using"] ?: CBX_EMPTY_STRING;
        ret[CBX_VALUE_KEY] = value[CBX_VALUE_KEY] ?: CBX_EMPTY_STRING;
    }
    return ret;
}

+ (NSString *)name { return @"property"; }

- (XCUIElementQuery *)applyInternal:(XCUIElementQuery *)query {
    NSDictionary *val = [QuerySpecifierByProperty parseValue:self.value];
    id key = val[@"key"];
    id value = val[@"value"];
    NSString *pred = [NSString stringWithFormat:@"SELF.%@ = %@", key, value];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:pred];
    return [query matchingPredicate:predicate];
}
@end
