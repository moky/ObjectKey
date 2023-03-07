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
//  OKAbstractMap.h
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/7.
//  Copyright © 2023 DIM Group. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OKAbstractMap<__covariant KeyType, __covariant ObjectType> : NSObject/* <NSFastEnumeration>*/

@property (readonly) NSUInteger count;

- (nullable ObjectType)objectForKey:(KeyType)aKey;

@end

@interface OKAbstractMap<KeyType, ObjectType> (NSExtendedDictionary)

@property (readonly, copy) NSArray<KeyType> *allKeys;
@property (readonly, copy) NSArray<ObjectType> *allValues;

- (NSArray<KeyType> *)allKeysForObject:(ObjectType)anObject;

- (void)enumerateKeysAndObjectsUsingBlock:(void (^)(KeyType key, ObjectType obj, BOOL *stop))block;

- (void)enumerateKeysAndObjectsWithOptions:(NSEnumerationOptions)opts
                                usingBlock:(void (^)(KeyType key, ObjectType obj, BOOL *stop))block;

@end

@interface OKAbstractMap<KeyType, ObjectType> (NSMutableDictionary)

- (void)removeObjectForKey:(KeyType)aKey;

- (void)setObject:(ObjectType)anObject forKey:(KeyType)aKey;

@end

@interface OKAbstractMap (NSExtendedMutableDictionary)

- (void)removeAllObjects;

@end

NS_ASSUME_NONNULL_END
