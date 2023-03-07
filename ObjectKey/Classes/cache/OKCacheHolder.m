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
//  OKCacheHolder.m
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/3.
//  Copyright © 2023 DIM Group. All rights reserved.
//

#import "OKCacheHolder.h"

@interface OKCacheHolder<__covariant ObjectType> () {
    
    NSTimeInterval _lifeSpan;
    NSTimeInterval _expired;     // time to expired
    NSTimeInterval _deprecated;  // time to deprecated
}

@property(nonatomic, retain) ObjectType value;

@end

@implementation OKCacheHolder

- (void)dealloc {
    [_value release];
    _value = nil;
    
    [super dealloc];
}

- (instancetype)init {
    NSAssert(false, @"DON'T call me");
    id value = nil;
    return [self initWithValue:value lifeSpan:0 time:0];
}

/* designated initializer */
- (instancetype)initWithValue:(id)value
                     lifeSpan:(NSTimeInterval)cacheLifeSpan
                         time:(NSTimeInterval)now {
    if (self = [super init]) {
        self.value = value;
        _lifeSpan = cacheLifeSpan;
        if (now < 1) {
            now = OKGetCurrentTimeInterval();
        }
        _expired = now + _lifeSpan;
        _deprecated = now + _lifeSpan * 2;
    }
    return self;
}

- (void)updateValue:(id)value time:(NSTimeInterval)now {
    self.value = value;
    if (now < 1) {
        now = OKGetCurrentTimeInterval();
    }
    _expired = now + _lifeSpan;
    _deprecated = now + _lifeSpan * 2;
}

- (void)renewalWithDuration:(NSTimeInterval)duration time:(NSTimeInterval)now {
    if (duration < 1) {
        duration = 128.0;
    }
    if (now < 1) {
        now = OKGetCurrentTimeInterval();
    }
    _expired = now + duration;
    _deprecated = now + _lifeSpan * 2;
}

- (BOOL)isAlive:(NSTimeInterval)now {
    if (now < 1) {
        now = OKGetCurrentTimeInterval();
    }
    return now < _expired;
}

- (BOOL)isDeprecated:(NSTimeInterval)now {
    if (now < 1) {
        now = OKGetCurrentTimeInterval();
    }
    return now > _deprecated;
}

@end

NSTimeInterval OKGetCurrentTimeInterval(void) {
    NSDate *now = [[NSDate alloc] init];
    NSTimeInterval ts = [now timeIntervalSince1970];
    [now release];
    return ts;
}
