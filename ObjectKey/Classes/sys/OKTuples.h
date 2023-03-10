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
//  OKTuples.h
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//@interface OKUnit<__covariant A> : NSObject
//
//@property(nonatomic, readonly, nullable) A first;
//
//- (instancetype)initWithFirst:(A)a;
//
//+ (instancetype)unitWithFirst:(A)a;
//
//@end

@interface OKPair<__covariant A, __covariant B> : NSObject

@property(nonatomic, readonly, nullable) A first;
@property(nonatomic, readonly, nullable) B second;

- (instancetype)initWithFirst:(A)a second:(B)b;

+ (instancetype)pairWithFirst:(A)a second:(B)b;

@end

@interface OKTriplet<__covariant A, __covariant B, __covariant C> : NSObject

@property(nonatomic, readonly, nullable) A first;
@property(nonatomic, readonly, nullable) B second;
@property(nonatomic, readonly, nullable) C third;

- (instancetype)initWithFirst:(A)a second:(B)b third:(C)c;

+ (instancetype)tripletWithFirst:(A)a second:(B)b third:(C)c;

@end

//@interface OKQuartet<__covariant A, __covariant B, __covariant C, __covariant D> : NSObject
//
//@property(nonatomic, readonly, nullable) A first;
//@property(nonatomic, readonly, nullable) B second;
//@property(nonatomic, readonly, nullable) C third;
//@property(nonatomic, readonly, nullable) D fourth;
//
//- (instancetype)initWithFirst:(A)a second:(B)b third:(C)c fourth:(D)d;
//
//+ (instancetype)quartetWithFirst:(A)a second:(B)b third:(C)c fourth:(D)d;
//
//@end
//
//@interface OKQuintet<__covariant A, __covariant B, __covariant C, __covariant D, __covariant E> : NSObject
//
//@property(nonatomic, readonly, nullable) A first;
//@property(nonatomic, readonly, nullable) B second;
//@property(nonatomic, readonly, nullable) C third;
//@property(nonatomic, readonly, nullable) D fourth;
//@property(nonatomic, readonly, nullable) E fifth;
//
//- (instancetype)initWithFirst:(A)a second:(B)b third:(C)c fourth:(D)d fifth:(E)e;
//
//+ (instancetype)quintetWithFirst:(A)a second:(B)b third:(C)c fourth:(D)d fifth:(E)e;
//
//@end

// TODO: Sextet
// TODO: Septet
// TODO: Octet
// TODO: Ennead
// TODO: Decade

NS_ASSUME_NONNULL_END
