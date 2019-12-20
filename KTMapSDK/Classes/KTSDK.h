//
//  KTSDK.h
//  KTMapSDK
//
//  Created by KT--stc08 on 2019/12/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface KTSDK : NSObject
+(void)presentSDK:(UIViewController*)viewController mapAPIKey:(NSString*)apiKey;
@end

NS_ASSUME_NONNULL_END
