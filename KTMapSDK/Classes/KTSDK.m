//
//  KTSDK.m
//  KTMapSDK
//
//  Created by KT--stc08 on 2019/12/20.
//

#import "KTSDK.h"
#import <KTMapFrameWork/KTMapFrameManager.h>
@implementation KTSDK
+(void)presentSDK:(UIViewController*)viewController mapAPIKey:(NSString*)apiKey
{
    [KTMapFrameManager presentSDK:viewController mapAPIKey:apiKey];
}
@end
