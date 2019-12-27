//
//  NSNotificationCenter+Test.m
//  KTMapSDK_Example
//
//  Created by KT--stc08 on 2019/12/26.
//  Copyright © 2019 181310067@qq.com. All rights reserved.
//

#import "NSNotificationCenter+Test.h"


#import <objc/runtime.h>

@implementation NSNotificationCenter (Test)
+(void)load
{
//    [self hft_hookOrigMenthod:@selector(postNotificationName:object:) NewMethod:@selector(KT_postNotificationName:object:)];
}

+ (BOOL)hft_hookOrigMenthod:(SEL)origSel NewMethod:(SEL)altSel {
     Class class = [self class];
    Method origMethod = class_getInstanceMethod(class, origSel);
    Method altMethod = class_getInstanceMethod(class, altSel);
    if (!origMethod || !altMethod) {
        return NO;
    }
    BOOL didAddMethod = class_addMethod(class,origSel,
                                        method_getImplementation(altMethod),
                                        method_getTypeEncoding(altMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,altSel,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    } else {
        method_exchangeImplementations(origMethod, altMethod);
    }
    
    return YES;
}

-(void)KT_postNotificationName:(NSNotificationName)aName object:(id)anObject
{
    NSLog(@"NSNotificationName=%@",aName);
    [self KT_postNotificationName:aName object:anObject];
}

@end
