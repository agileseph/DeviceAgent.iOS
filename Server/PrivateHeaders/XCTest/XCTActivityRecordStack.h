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

#import <objc/NSObject.h>

@class NSDictionary, NSMutableArray, NSMutableDictionary;

@interface XCTActivityRecordStack : NSObject
{
    NSMutableArray *_storage;
    NSMutableDictionary *_mutableAggregationRecords;
}

@property(readonly) NSDictionary *aggregationRecords;
@property(readonly) NSMutableDictionary *mutableAggregationRecords;
@property(readonly) NSMutableArray *storage;

- (NSInteger)depth;
- (void)didFinishActivity:(id)arg1 testCase:(id)arg2 observationCenter:(id)arg3;
- (id)topActivity;
- (void)unwindRemainingActivitiesWithTestCase:(id)arg1 observationCenter:(id)arg2;
- (id)willStartActivityWithTitle:(id)arg1 type:(id)arg2 testCase:(id)arg3 observationCenter:(id)arg4;

@end

