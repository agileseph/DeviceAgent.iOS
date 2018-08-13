// class-dump results processed by bin/class-dump/dump.rb
//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Jul 30 2018 09:07:48).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2015 by Steve Nygard.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <XCTest/XCUIElementTypes.h>
#import "CDStructures.h"
@protocol OS_dispatch_queue;
@protocol OS_xpc_object;

#import <objc/NSObject.h>

@class NSDictionary;

@interface XCUIApplicationRegistry : NSObject
{
    NSDictionary *_testDependencies;
    NSDictionary *_userOverrides;
}

@property(copy) NSDictionary *testDependencies;
@property(copy) NSDictionary *userOverrides;

- (id)_constructRecordMapFromRawMap:(id)arg1 isTestDependencyMap:(BOOL)arg2;
- (id)initWithTestDependencies:(id)arg1 userOverrides:(id)arg2;
- (id)recordForApplicationWithBundleIdentifier:(id)arg1 error:(id *)arg2;
- (BOOL)testDependencyExistsForApplicationAtURL:(id)arg1;

@end

