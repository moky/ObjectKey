// license: https://mit-license.org
//
//  ObjectKey : Object & Key kits
//
//                               Written in 2018 by Moky <albert.moky@gmail.com>
//
// =============================================================================
// The MIT License (MIT)
//
// Copyright (c) 2018 Albert Moky
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
//  OKSingleton.h
//  ObjectKey
//
//  Created by Albert Moky on 2018/11/1.
//  Copyright © 2018 DIM Group. All rights reserved.
//

#ifndef OKSingleton_h
#define OKSingleton_h

#define OKSingletonDispatchOnce(block)                         \
            static dispatch_once_t onceToken;                  \
            dispatch_once(&onceToken, block)                   \
                      /* EOF 'OKSingletonDispatchOnce(block)' */

#define OKSingletonImplementations_Main(Class, factory)        \
        static Class *s_shared##Class = nil;                   \
        + (instancetype)allocWithZone:(struct _NSZone *)zone { \
            OKSingletonDispatchOnce(^{                         \
                s_shared##Class = [super allocWithZone:zone];  \
            });                                                \
            return s_shared##Class;                            \
        }                                                      \
        + (instancetype)factory {                              \
            OKSingletonDispatchOnce(^{                         \
                s_shared##Class = [[self alloc] init];         \
            });                                                \
            return s_shared##Class;                            \
        }                                                      \
     /* EOF 'OKSingletonImplementations_Main(Class, factory)' */

#define OKSingletonImplementations_Copy(Class)                 \
        - (id)copy {                                           \
            return s_shared##Class;                            \
        }                                                      \
        - (id)mutableCopy {                                    \
            return s_shared##Class;                            \
        }                                                      \
                   /* EOF 'OKSingletonImplementations_Copy()' */

#if __has_feature(objc_arc) // ARC

#define OKSingletonImplementations(Class, factory)             \
        OKSingletonImplementations_Main(Class, factory)        \
        OKSingletonImplementations_Copy(Class)                 \
          /* EOF 'OKSingletonImplementations(Class, factory)' */

#else // MRC

#define OKSingletonImplementations_MRC(Class)                  \
        - (instancetype)retain {                               \
            return s_shared##Class;                            \
        }                                                      \
        - (oneway void)release {                               \
        }                                                      \
        - (instancetype)autorelease {                          \
            return s_shared##Class;                            \
        }                                                      \
        - (NSUInteger)retainCount {                            \
            return MAXFLOAT;                                   \
        }                                                      \
                    /* EOF 'OKSingletonImplementations_MRC()' */

#define OKSingletonImplementations(Class, factory)             \
        OKSingletonImplementations_Main(Class, factory)        \
        OKSingletonImplementations_Copy(Class)                 \
        OKSingletonImplementations_MRC(Class)                  \
          /* EOF 'OKSingletonImplementations(Class, factory)' */

#endif /* __has_feature(objc_arc) */

#endif /* OKSingleton_h */
