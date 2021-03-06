// class-dump results processed by bin/class-dump/dump.rb
//
//     Generated by class-dump 3.5 (64 bit) (Debug version compiled Apr 12 2019 07:16:25).
//
//  Copyright (C) 1997-2019 Steve Nygard.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <XCTest/XCUIElementTypes.h>
#import "CDStructures.h"
@protocol OS_dispatch_queue;
@protocol OS_xpc_object;

#import "XCTestRun.h"

@class NSArray, NSMutableArray;

@interface XCTestSuiteRun : XCTestRun
{
    NSMutableArray *_mutableTestRuns;
}

@property(readonly) NSMutableArray *mutableTestRuns;
@property(readonly, copy) NSArray *testRuns;

- (void)addTestRun:(id)arg1;
- (NSUInteger)executionCount;
- (NSUInteger)failureCount;
- (id)initWithTest:(id)arg1;
- (void)recordFailureWithDescription:(id)arg1 inFile:(id)arg2 atLine:(NSUInteger)arg3 expected:(BOOL)arg4;
- (NSUInteger)skipCount;
- (void)start;
- (void)stop;
- (double)testDuration;
- (NSUInteger)unexpectedExceptionCount;

@end

