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



@interface XCTSpindumpRequestSpecification : NSObject <NSSecureCoding>
{
    NSInteger _processID;
    NSUInteger _durationMilliseconds;
    NSUInteger _intervalMicroseconds;
    NSUInteger _spindumpFlags;
    NSString *_reason;
    NSString *_signature;
    NSString *_filename;
}

@property(readonly) NSUInteger durationMilliseconds;
@property(readonly) NSString *filename;
@property(readonly) NSUInteger intervalMicroseconds;
@property(readonly) NSInteger processID;
@property(readonly) NSString *reason;
@property(readonly) NSString *signature;
@property(readonly) NSUInteger spindumpFlags;

- (id)initWithProcessID:(NSInteger)arg1 durationMilliseconds:(NSUInteger)arg2 intervalMicroseconds:(NSUInteger)arg3 spindumpFlags:(NSUInteger)arg4 reason:(id)arg5 signature:(id)arg6 filename:(id)arg7;

@end

