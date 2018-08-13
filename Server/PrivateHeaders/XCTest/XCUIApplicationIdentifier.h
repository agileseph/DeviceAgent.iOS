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



@interface XCUIApplicationIdentifier : NSObject <NSCopying>
{
    NSString *_bundleIdentifier;
    NSString *_path;
}

@property(readonly) NSString *bundleIdentifier;
@property(readonly) NSString *path;

- (id)initWithBundleIdentifier:(id)arg1 path:(id)arg2;

@end

