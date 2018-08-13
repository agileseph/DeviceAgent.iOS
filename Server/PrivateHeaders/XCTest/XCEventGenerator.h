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

@protocol OS_dispatch_queue, XCUIAccessibilityInterface;


@protocol XCUIAccessibilityInterface;

@interface XCEventGenerator : NSObject
{
    id <XCUIAccessibilityInterface> _accessibilityInterface;
    NSUInteger _generation;
    struct __CFRunLoopObserver *_generationObserver;
    double _implicitConfirmationDelay;
    NSObject<OS_dispatch_queue> *_eventQueue;
}

@property(readonly) id <XCUIAccessibilityInterface> accessibilityInterface;
@property(readonly) NSObject<OS_dispatch_queue> *eventQueue;
@property NSUInteger generation;
@property(readonly) struct __CFRunLoopObserver *generationObserver;
@property double implicitConfirmationDelay;

+ (id)sharedGenerator;
- (void)_scheduleCallback:(CDUnknownBlockType)arg1 afterInterval:(double)arg2;
- (void)_startEventSequenceWithSteppingCallback:(CDUnknownBlockType)arg1;
- (double)forcePressAtPoint:(CGPoint)arg1 orientation:(NSInteger)arg2 handler:(CDUnknownBlockType)arg3;
- (id)initWithAccessibilityInterface:(id)arg1;
- (double)pinchInRect:(CGRect)arg1 withScale:(double)arg2 velocity:(double)arg3 orientation:(NSInteger)arg4 handler:(CDUnknownBlockType)arg5;
- (double)pressAtPoint:(CGPoint)arg1 forDuration:(double)arg2 liftAtPoint:(CGPoint)arg3 velocity:(double)arg4 orientation:(NSInteger)arg5 name:(id)arg6 handler:(CDUnknownBlockType)arg7;
- (double)pressAtPoint:(CGPoint)arg1 forDuration:(double)arg2 orientation:(NSInteger)arg3 handler:(CDUnknownBlockType)arg4;
- (double)rotateInRect:(CGRect)arg1 withRotation:(double)arg2 velocity:(double)arg3 orientation:(NSInteger)arg4 handler:(CDUnknownBlockType)arg5;
- (double)tapAtTouchLocations:(id)arg1 numberOfTaps:(NSUInteger)arg2 orientation:(NSInteger)arg3 handler:(CDUnknownBlockType)arg4;

@end

