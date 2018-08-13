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


@protocol OS_xpc_object;

@interface XCTSerializedTransportWrapper : NSObject <NSSecureCoding>
{
    NSObject<OS_xpc_object> *_serializedTransport;
}

@property(readonly) NSObject<OS_xpc_object> *serializedTransport;

- (id)initWithSerializedTransport:(id)arg1;

@end

