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
//  OKTuples.m
//  ObjectKey
//
//  Created by Albert Moky on 2023/3/8.
//

#import "OKTuples.h"

@interface OKPair ()

@property(nonatomic, retain, nullable) id first;
@property(nonatomic, retain, nullable) id second;

@end

@implementation OKPair

- (instancetype)initWithFirst:(id)a second:(id)b {
    if (self = [super init]) {
        self.first = a;
        self.second = b;
    }
    return self;
}

+ (instancetype)pairWithFirst:(id)a second:(id)b {
    OKPair *tuple = [[OKPair alloc] initWithFirst:a second:b];
    return [tuple autorelease];
}

@end

#pragma mark -

@interface OKTriplet ()

@property(nonatomic, retain, nullable) id first;
@property(nonatomic, retain, nullable) id second;
@property(nonatomic, retain, nullable) id third;

@end

@implementation OKTriplet

- (instancetype)initWithFirst:(id)a second:(id)b third:(id)c {
    if (self = [super init]) {
        self.first = a;
        self.second = b;
        self.third = c;
    }
    return self;
}

+ (instancetype)tripletWithFirst:(id)a second:(id)b third:(id)c {
    OKTriplet *tuple = [[OKTriplet alloc] initWithFirst:a second:b third:c];
    return [tuple autorelease];
}

@end
