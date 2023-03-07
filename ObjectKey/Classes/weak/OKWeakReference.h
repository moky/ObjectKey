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
//  OKWeakReference.h
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/7.
//  Copyright © 2023 DIM Group. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface OKWeakReference<__covariant ObjectType> : NSObject <NSCopying>

/**
 * Returns this reference object's referent.  If this reference object has
 * been cleared, either by the program or by the garbage collector, then
 * this method returns <code>null</code>.
 *
 * @return   The object to which this reference refers, or
 *           <code>null</code> if this reference object has been cleared
 */
@property (atomic, readonly, nullable) ObjectType target;

/**
 * Creates a new weak reference that refers to the given object.
 *
 * @param referent object the new weak reference will refer to
 */
- (instancetype)initWithTarget:(ObjectType)referent NS_DESIGNATED_INITIALIZER;

/**
 * Clears this reference object.  Invoking this method will not cause this
 * object to be enqueued.
 */
- (void)clear;

@end

NS_ASSUME_NONNULL_END
