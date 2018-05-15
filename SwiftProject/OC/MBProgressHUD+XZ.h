//
//  MBProgressHUD+XZ.h
//  HuPin
//
//  Created by 小赵  on 2017/7/21.
//  Copyright © 2017年 小赵 . All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (XZ)
///1.5s后自动消失
+ (void)showMessage:(NSString *)message;
+ (void)showMessage:(NSString *)message inView:(UIView *)view;

///自定义消失时间
+ (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration;
+ (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration inView:(UIView *)view;

+ (void)showLoading;
+ (void)showLoadingInView:(UIView *)view;

+ (void)showBoutiqueLoading;
+ (void)showBoutiqueLoadingInView:(UIView *)view;

+ (void)showSuccessWithMessage:(NSString *)message;
+ (void)showSuccessWithMessage:(NSString *)message inView:(UIView *)view;


+ (void)dismiss;
+ (void)dismissFor:(UIView *)view;
@end
