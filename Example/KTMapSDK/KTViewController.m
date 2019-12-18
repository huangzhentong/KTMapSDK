//
//  KTViewController.m
//  KTMapSDK
//
//  Created by 181310067@qq.com on 12/18/2019.
//  Copyright (c) 2019 181310067@qq.com. All rights reserved.
//

#import "KTViewController.h"
#import <KTMapFrameWork/KTMapSDK.h>
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
    [KTMapSDK presentSDK:self mapAPIKey:@""];
}

@end
