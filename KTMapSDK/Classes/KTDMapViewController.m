//
//  KTDMapViewController.m
//  MapText
//
//  Created by KT--stc08 on 2019/12/17.
//  Copyright © 2019 KT--stc08. All rights reserved.
//

#import "KTDMapViewController.h"
#import <WebKit/WebKit.h>
#import <objc/runtime.h>
#import <objc/message.h>
@interface KTDMapViewController ()
@property(nonatomic,strong)id map;
@property(nonatomic,copy)NSString *code;
@property(nonatomic,copy)NSString *url;
@end

@implementation KTDMapViewController

-(instancetype)initWithCode:(NSString *)code withURL:(NSString *)url
{
    if (self = [super initWithNibName:nil bundle:nil]) {
        
        NSAssert(code, @"code 不能为空");
        NSAssert(url, @"url 不能为空");
        self.code = code;
        self.url = url;
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    Class mapClass = NSClassFromString(@"DMap.DMap");
    if (mapClass) {
        
        id (*allocAction)(id,SEL) = (id (*) (id,SEL))objc_msgSend;
        id allocMap = allocAction(mapClass, NSSelectorFromString(@"alloc"));
        
        id (*initAction)(id,SEL,UIView*) = (id (*) (id,SEL,UIView*))objc_msgSend;
        id mapObject = initAction(allocMap, NSSelectorFromString(@"initWithView:"),self.view);
        
        NSLog(@"mapObject=%@",mapObject);
        
        void (*setSourceAction)(id,SEL,int,NSString*,NSString*) = (void(*)(id,SEL,int,NSString*,NSString*))objc_msgSend;
        setSourceAction(mapObject,@selector(setSourceWithType:source:url:),0,self.code,self.url);
        self.map = mapObject;
        
    }
    
    //    self.map.delegate = self;
    self.navigationController.navigationBarHidden  = false;
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (self.map) {
          if( [self.map respondsToSelector:@selector(dispose)])
          {
              void (*dispose)(id,SEL) = (void(*)(id,SEL))objc_msgSend;
              dispose(self.map,@selector(dispose));
          
           self.map = nil;
          }
       }
}
-(void)centralManagerDidUpdateStateWithState:(NSInteger)state
{
    //    switch (state) {
    //        case BluetoothStateUnauthorized:
    //            NSLog(@"无权使用蓝牙");
    //            break;
    //            case BluetoothStatePoweredOff:
    //            NSLog(@"蓝牙关闭");
    //            break;
    //            case BluetoothStatePoweredOn:
    //            NSLog(@"蓝牙启动");
    //            break;
    //        default:
    //            NSLog(@"蓝牙故障");
    //            break;
    //    }
}
-(void)didMapReady {
    NSLog(@"map ready");
}


@end
