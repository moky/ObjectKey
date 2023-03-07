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
//  OKAbstractSet.m
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/7.
//  Copyright © 2023 DIM Group. All rights reserved.
//

#import "OKAbstractSet.h"

@implementation OKAbstractSet

- (NSUInteger)count {
    NSAssert(false, @"override me!");
    return 0;
}

@end

@implementation OKAbstractSet (NSExtendedSet)

- (NSArray<id> *)allObjects {
    NSAssert(false, @"override me!");
    return nil;
}

- (nullable id)anyObject {
    NSAssert(false, @"override me!");
    return nil;
}

- (BOOL)containsObject:(id)anObject {
    NSAssert(false, @"override me!");
    return NO;
}

- (void)enumerateObjectsUsingBlock:(void (^)(id, BOOL *))block {
    NSAssert(false, @"override me!");
}

- (void)enumerateObjectsWithOptions:(NSEnumerationOptions)opts
                         usingBlock:(void (^)(id, BOOL *))block {
    NSAssert(false, @"override me!");
}

@end

@implementation OKAbstractSet (NSMutableSet)

- (void)addObject:(id)object {
    NSAssert(false, @"override me!");
}

- (void)removeObject:(id)object {
    NSAssert(false, @"override me!");
}

@end

@implementation OKAbstractSet (NSExtendedMutableSet)

- (void)removeAllObjects {
    NSAssert(false, @"override me!");
}

@end

@implementation OKAbstractSet (NSCountedSet)

- (NSUInteger)countForObject:(id)object {
    NSAssert(false, @"override me!");
    return 0;
}

@end
