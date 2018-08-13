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

@class NSArray, XCUITestContextScope;

@interface XCUITestContext : NSObject
{
    BOOL _didHandleUIInterruption;
    XCUITestContextScope *_currentScope;
}

@property(retain, nonatomic) XCUITestContextScope *currentScope;
@property BOOL didHandleUIInterruption;
@property(readonly, copy) NSArray *handlers;

+ (CDUnknownBlockType)defaultAsynchronousUIElementHandler;
- (id)addUIInterruptionMonitorWithDescription:(id)arg1 handler:(CDUnknownBlockType)arg2;
- (BOOL)handleAsynchronousUIElement:(id)arg1;
- (void)performInScope:(CDUnknownBlockType)arg1;
- (void)removeUIInterruptionMonitor:(id)arg1;

@end

