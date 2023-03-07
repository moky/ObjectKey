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
//  OKCachePair.m
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/3.
//  Copyright © 2023 DIM Group. All rights reserved.
//

#import "OKCachePair.h"

@interface OKCachePair ()

@property(nonatomic, retain) id value;

@property(nonatomic, retain) OKCacheHolder<id> *holder;

@end

@implementation OKCachePair

- (void)dealloc {
    [_value release];
    _value = nil;
    [_holder release];
    _holder = nil;
    
    [super dealloc];
}

- (instancetype)init {
    NSAssert(false, @"DON'T call me");
    id value = nil;
    id holder = nil;
    return [self initWithValue:value holder:holder];
}

/* designated initializer */
- (instancetype)initWithValue:(id)value
                       holder:(OKCacheHolder<id> *)holder {
    if (self = [super init]) {
        self.value = value;
        self.holder = holder;
    }
    return self;
}

@end
