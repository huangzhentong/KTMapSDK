//
//  KTViewController.m
//  KTMapSDK
//
//  Created by 181310067@qq.com on 12/18/2019.
//  Copyright (c) 2019 181310067@qq.com. All rights reserved.
//

#import "KTViewController.h"
#import <KTMapSDK/KTDMapManager.h>
#import <KTMapSDK/KTSDK.h>
#import <objc/runtime.h>
#import <objc/message.h>
@interface KTViewController ()

@end

@implementation KTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    [KTSDK presentSDK:self mapAPIKey:@"745dc31cded658ccfedfdc33684a75eb"];
    return;
    
//    Class aMapClass = NSClassFromString(@"KTDMapManager");
//    if (aMapClass == nil) {
//        NSLog(@"未集成DMap");
//        return;
//    }
//    SEL defaultServiceSel = NSSelectorFromString(@"shareInstance");
//    if ([aMapClass respondsToSelector:defaultServiceSel]) {
//        id (*sharedServices)(id,SEL) = (id (*) (id,SEL))objc_msgSend;
//        id aMap =  sharedServices(aMapClass,defaultServiceSel);
//
//
//        void(*initWithDMapWithCode)(id,SEL,NSString *,NSString *) = (id(*)(id,SEL,NSString *code,NSString *url))objc_msgSend;
//        initWithDMapWithCode(aMap,NSSelectorFromString(@"initWithDMapWithCode:url:"),@"hyjg",@"https://test.seeklane.com/test/hyjg/index.html");
//    }
    
    KTDMapManager *manager = [KTDMapManager shareInstance];
    manager.code = @"hyjg";
    manager.url = @"https://test.seeklane.com/test/hyjg/index.html";
    [[NSNotificationCenter defaultCenter] postNotificationName:PushToDMapViewController object:@{@"viewController":self,@"long":@(1),@"lat":@(2)}];
//    KTDMapViewController *viewController =[[KTDMapViewController alloc] initWithCode:@"hyjg" withURL:@"https://test.seeklane.com/test/hyjg/index.html"];
//    [self presentViewController:viewController animated:true completion:nil];

    
}

@end
