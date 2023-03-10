// license: https://mit-license.org
//
//  ObjectKey : Object & Key kits
//
//                               Written in 2023 by Moky <albert.moky@gmail.com>
//
// =============================================================================
// The MIT License (MIT)
//
// Copyright (c) 2023 Albert Moky
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
// =============================================================================
//
//  OKWeakReference.m
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/7.
//  Copyright © 2023 DIM Group. All rights reserved.
//

#import "OKWeakReference.h"

@interface OKWeakReference () {
    
    /*__weak */id _target;
}

@end

@implementation OKWeakReference

- (instancetype)init {
    NSAssert(false, @"don't call me!");
    id target = nil;
    return [self initWithTarget:target];
}

/* designated initializer */
- (instancetype)initWithTarget:(id)referent {
    if (self = [super init]) {
        _target = referent;
    }
    return self;
}

- (nullable id)target {
    id target = [_target retain];
    return [target autorelease];
}

- (void)clear {
    _target = nil;
}

#pragma mark Object

- (NSUInteger)hash {
    return [self.target hash];
}

- (BOOL)isEqual:(id)object {
    if ([object isKindOfClass:[OKWeakReference class]]) {
        // compare with references
        if (object == self) {
            return YES;
        }
        object = [object target];
    }
    // compare with target object
    return !object ? !self.target : [object isEqual:self.target];
}

#pragma mark Copy

- (id)copyWithZone:(nullable NSZone *)zone {
    id clone = [[self class] copyWithZone:zone];
    clone = [clone initWithTarget:self.target];
    return [clone autorelease];
}

@end

@implementation OKWeakReference (Creation)

+ (instancetype)referenceWithTarget:(id)target {
    OKWeakReference *ref = [[OKWeakReference alloc] initWithTarget:target];
    return [ref autorelease];
}

@end
