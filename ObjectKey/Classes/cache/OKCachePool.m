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
//  OKCachePool.m
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/3.
//  Copyright © 2023 DIM Group. All rights reserved.
//

#import "OKTime.h"

#import "OKCachePool.h"

@interface OKCachePool () {
    
    NSMutableDictionary<id, OKCacheHolder<id> *> *_holderMap;
}

@end

@implementation OKCachePool

- (void)dealloc {
    [_holderMap release];
    _holderMap = nil;
    
    [super dealloc];
}

- (instancetype)init {
    if (self = [super init]) {
        _holderMap = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (NSArray<id> *)allKeys {
    return [_holderMap allKeys];
}

- (OKCacheHolder<id> *)updateValue:(id)value
                             forKey:(id)key
                           lifeSpan:(NSTimeInterval)cacheLifeSpan
                               time:(NSTimeInterval)now {
    OKCacheHolder<id> *holder;
    holder = [[OKCacheHolder alloc] initWithValue:value
                                          lifeSpan:cacheLifeSpan
                                              time:now];
    [self updateHolder:holder forKey:key];
    return [holder autorelease];
}

- (OKCacheHolder<id> *)updateHolder:(OKCacheHolder<id> *)holder
                              forKey:(id)key {
    [_holderMap setObject:holder forKey:key];
    return holder;
}

// erase
- (OKCachePair<id> *)removeHolderForKey:(id)key
                                    time:(NSTimeInterval)now {
    OKCachePair<id> *old = nil;
    if (now > 1) {
        // get exists value before erasing
        old = [self fetchWithKey:key time:now];
    }
    [_holderMap removeObjectForKey:key];
    return old;
}

// fetch
- (OKCachePair<id> *)fetchWithKey:(id)key
                              time:(NSTimeInterval)now {
    OKCacheHolder<id> *holder = [_holderMap objectForKey:key];
    if (!holder) {
        // holder not found
        return nil;
    }
    OKCachePair<id> *pair;
    if ([holder isAlive:now]) {
        pair = [[OKCachePair alloc] initWithValue:holder.value holder:holder];
    } else {
        // holder expired
        pair = [[OKCachePair alloc] initWithValue:nil holder:holder];
    }
    return [pair autorelease];
}

- (NSUInteger)purge:(NSTimeInterval)now {
    if (now < 1) {
        now = OKGetCurrentTimeInterval();
    }
    NSUInteger count = 0;
    NSArray<id> *allKeys = [self allKeys];
    OKCacheHolder<id> *holder;
    for (id key in allKeys) {
        holder = [_holderMap objectForKey:key];
        if (!holder || [holder isDeprecated:now]) {
            // remove expired holders
            [_holderMap removeObjectForKey:key];
            count += 1;
        }
    }
    return count;
}

@end
