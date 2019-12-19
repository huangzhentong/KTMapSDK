//
//  KTDMapManager.m
//  KTMapSDK
//
//  Created by KT--stc08 on 2019/12/19.
//

#import "KTDMapManager.h"
#import <WebKit/WebKit.h>
#import "KTDMapViewController.h"
#import "KTNaviWalkController.h"
#import "KTNotifiction.h"
@interface KTDMapManager ()<DMapDelegate>
@property(nonatomic,strong)DMap *map;
@end

@implementation KTDMapManager
+(instancetype)shareInstance
{
    static KTDMapManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[KTDMapManager alloc] init];
    });
    return manager;
}


-(void)initWithDMapWithCode:(NSString *)code url:(NSString *)url
{
    self.code = code;
    self.url = url;
    if (!self.map) {
        
        UIViewController *viewController = [UIApplication sharedApplication].delegate.window.rootViewController;
        
        self.map = [[DMap alloc] initWithView:viewController.view];
        __weak typeof(self) weakSelf = self;
        [self.map setSourceWithType:0 source:code url:url];
        [_map registerLocationStatusEventWithCb:^(NSDictionary<NSString *,id> * _Nullable dic) {
            if (dic == nil) {
                weakSelf.locateState = -1;
            }
            else
            {
               NSDictionary *data = dic[@"data"];
                if (data) {
                    weakSelf.locateState = [data[@"value"] integerValue];
                }
                
                [[NSNotificationCenter defaultCenter] postNotificationName:DMapLocationStatusChange object:@(weakSelf.locateState)];
            }
            NSLog(@"registerLocationStatusEventWithCb=%@",dic);
        }];
        self.map.delegate = self;
        [[self.map getMapView] setHidden:true];
       
    }
    else{
        [self.map setSourceWithType:0 source:code url:url];
    }
    
    
}

-(instancetype)init
{
    self  = [super init];
    if (self) {
        self.locateState = -1;
        [self addListen];
    }
    return self;
}

-(void)addListen{
    //SDK关闭
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(stopDMapEvent) name:@"KTSDKClose" object:nil];
    //进入室内
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToDMapViewController:) name:PushToDMapViewController object:nil];
    //进入室外
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pushToWalkViewController:) name:PushToWalkViewController object:nil];
}
//进入室入定位
-(void)pushToDMapViewController:(NSNotification*)notification
{
    NSDictionary *dic = notification.object;
    if (dic[@"viewController"])
    {
        KTDMapViewController *dMap = [[KTDMapViewController alloc] initWithCode:self.code withURL:self.url];
        UIViewController *vc = dic[@"viewController"];
        [vc presentViewController:dMap animated:true completion:nil];
//        [vc.navigationController pushViewController:dMap animated:true];
    }
    
    
    
}
//进入步行导航
-(void)pushToWalkViewController:(NSNotification*)notification
{
    NSDictionary *dic = notification.object;
    if (dic[@"viewController"] && dic[@"lat"] && dic[@"long"]) {
        CGFloat latitude = [dic[@"lat"] doubleValue];
        CGFloat longitude = [dic[@"long"] doubleValue];
           
        KTNaviWalkController *walkVC = [[KTNaviWalkController alloc] initWithEndLatitude:latitude longitude:longitude];
        UIViewController *vc = dic[@"viewController"];
        [vc presentViewController:walkVC animated:true completion:nil];
//        [vc.navigationController pushViewController:walkVC animated:true];
    }
    NSLog(@"notification.object=%@",notification.object);
   
    
}



-(void)stopDMapEvent
{
    if (self.map) {
        [self.map dispose];
        self.map = nil;
    }
}

-(void)centralManagerDidUpdateStateWithState:(enum BluetoothState)state
{
    switch (state) {
        case BluetoothStateUnauthorized:
            NSLog(@"无权使用蓝牙");
            break;
            case BluetoothStatePoweredOff:
            NSLog(@"蓝牙关闭");
            break;
            case BluetoothStatePoweredOn:
            NSLog(@"蓝牙启动");
            break;
        default:
            NSLog(@"蓝牙故障");
            break;
    }
}
-(void)didMapReady {
    NSLog(@"map ready");
}



@end
