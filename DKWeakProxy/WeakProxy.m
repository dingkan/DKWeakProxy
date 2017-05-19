//
//  WeakProxy.m
//  DKWeakProxy
//
//  Created by 丁侃 on 2017/5/17.
//  Copyright © 2017年 丁侃. All rights reserved.
//

#import "WeakProxy.h"

@implementation WeakProxy
-(instancetype)initWithTarget:(id)target{
    _target = target;
    return self;
}

+(instancetype)proxyWithTarget:(id)target{
    return [[WeakProxy alloc]initWithTarget:target];
}

//将消息的接受者换成target对象,此方法可以将消息的接受者替换成一个可以处理该消息的对象
-(id)forwardingTargetForSelector:(SEL)aSelector{
    return _target;
}

//消息转发失败,抛错前会给对象发送此条消息, anInvocation对象封装了原始的消息和传递的参数
-(void)forwardInvocation:(NSInvocation *)anInvocation{
    void *null = NULL;
    [anInvocation setReturnValue:&null];
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [NSObject instanceMethodSignatureForSelector:@selector(init)];
}

-(BOOL)respondsToSelector:(SEL)aSelector{
    return [_target respondsToSelector:aSelector];
}

-(BOOL)isEqual:(id)object{
    return [_target isEqual:object];
}

- (NSUInteger)hash {
    return [_target hash];
}

- (Class)superclass {
    return [_target superclass];
}

- (Class)class {
    return [_target class];
}

- (BOOL)isKindOfClass:(Class)aClass {
    return [_target isKindOfClass:aClass];
}

- (BOOL)isMemberOfClass:(Class)aClass {
    return [_target isMemberOfClass:aClass];
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol {
    return [_target conformsToProtocol:aProtocol];
}

- (BOOL)isProxy {
    return YES;
}

- (NSString *)description {
    return [_target description];
}

- (NSString *)debugDescription {
    return [_target debugDescription];
}
@end
