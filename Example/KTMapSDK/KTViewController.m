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
    
    
    KTDMapManager *manager = [KTDMapManager shareInstance];
    manager.code = @"hyjg";
    manager.url = @"https://test.seeklane.com/test/hyjg/index.html";
    [[NSNotificationCenter defaultCenter] postNotificationName:PushToDMapViewController object:@{@"viewController":self,@"long":@(1),@"lat":@(2)}];

    
}

@end
