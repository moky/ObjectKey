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
//  OKWeakSet.m
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/6.
//  Copyright © 2023 DIM Group. All rights reserved.
//

#import "OKWeakSet.h"

@interface __WeakSet : OKWeakSet

@property(nonatomic, retain) NSHashTable *table;

@end

@implementation __WeakSet

- (void)dealloc {
    [_table release];
    _table = nil;
    
    [super dealloc];
}

/* designated initializer */
- (instancetype)init {
    if (self = [super init]) {
        _table = [[NSHashTable alloc] initWithOptions:NSHashTableWeakMemory
                                             capacity:8];
    }
    return self;
}

/* designated initializer */
- (instancetype)initWithCapacity:(NSUInteger)numItems {
    if (self = [super init]) {
        _table = [[NSHashTable alloc] initWithOptions:NSHashTableWeakMemory
                                             capacity:numItems];
    }
    return self;
}

- (NSUInteger)count {
    return [_table count];
}

@end

@implementation __WeakSet (NSExtendedSet)

- (NSArray<id> *)allObjects {
    //return NSAllHashTableObjects(_table);
    return [_table allObjects];
}

- (nullable id)anyObject {
    return [_table anyObject];
}

- (BOOL)containsObject:(id)anObject {
    return [_table containsObject:anObject];
}

- (void)enumerateObjectsUsingBlock:(void (^)(id, BOOL *))block {
    NSEnumerator *enumerator = [_table objectEnumerator];
    id object;
    BOOL stop = NO;
    while (object = [enumerator nextObject]) {
        object = [object retain];
        if (object) {
            block(object, &stop);
            [object release];
        }
        if (stop) {
            break;
        }
    }
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts
                         usingBlock:(void (^)(id, BOOL *))block {
    NSAssert(opts == NSEnumerationConcurrent, @"NSEnumerationConcurrent only");
    [self enumerateObjectsUsingBlock:block];
}

@end

@implementation __WeakSet (NSMutableSet)

- (void)addObject:(id)object {
    [_table addObject:object];
}

- (void)removeObject:(id)object {
    [_table removeObject:object];
}

@end

@implementation __WeakSet (NSExtendedMutableSet)

- (void)removeAllObjects {
    [_table removeAllObjects];
}

@end

#pragma mark -

@implementation OKWeakSet

+ (instancetype)alloc {
    if (self == [OKWeakSet class]) {
        return [__WeakSet alloc];
    } else {
        return [super alloc];
    }
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (self == [OKWeakSet class]) {
        return [__WeakSet allocWithZone:zone];
    } else {
        return [super allocWithZone:zone];
    }
}

/* designated initializer */
- (instancetype)init {
    if (self = [super init]) {
    }
    return self;
}

/* designated initializer */
- (instancetype)initWithCapacity:(NSUInteger)numItems {
    if (self = [super init]) {
    }
    return self;
}

@end

@implementation OKWeakSet (NSSetCreation)

+ (instancetype)set {
    OKWeakSet *set = [[OKWeakSet alloc] init];
    return [set autorelease];
}

@end

@implementation OKWeakSet (NSMutableSetCreation)

+ (instancetype)setWithCapacity:(NSUInteger)numItems {
    OKWeakSet *set = [[OKWeakSet alloc] initWithCapacity:numItems];
    return [set autorelease];
}

@end
