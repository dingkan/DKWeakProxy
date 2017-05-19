//
//  WeakProxy.h
//  DKWeakProxy
//
//  Created by 丁侃 on 2017/5/17.
//  Copyright © 2017年 丁侃. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeakProxy : NSObject\
/**
 The proxy Target
 */
@property (nonatomic, weak, readonly) id target;


-(instancetype)initWithTarget:(id)target;

+(instancetype)proxyWithTarget:(id)target;

@end
