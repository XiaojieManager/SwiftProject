//
//  MBProgressHUD+XZ.m
//  HuPin
//
//  Created by 小赵  on 2017/7/21.
//  Copyright © 2017年 小赵 . All rights reserved.
//

#import "MBProgressHUD+XZ.h"
#import "WBRoundHUD.h"
@implementation MBProgressHUD (XZ)

+ (WBRoundHUD *)animationHUD{
    static WBRoundHUD *roundHUD = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        roundHUD = [[WBRoundHUD alloc] initWithFrame:CGRectMake(0, 0, 45, 45) type:WBRoundHUDTypeUniform roundColor: nil];
        roundHUD.backgroundColor = [UIColor colorWithRed:242/255.f green:242/255.f blue:242/255.f alpha:1];
        roundHUD.duration = 1.5;
        roundHUD.roundColor = [UIColor lightGrayColor];
        [roundHUD start];
    });
    return roundHUD;
}
///1.5s后自动消失
+ (void)showMessage:(NSString *)message{
    [self showMessage:message inView:nil];
}
+ (void)showMessage:(NSString *)message inView:(UIView *)view{
    [self showMessage:message duration:1.5f inView:view];
}

///自定义消失时间
+ (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration{
    [self showMessage:message duration:duration inView:nil];
}
+ (void)showMessage:(NSString *)message duration:(NSTimeInterval)duration inView:(UIView *)view{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    if ([MBProgressHUD HUDForView:view]) {
        return;
    }
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabel.text = message;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor blackColor];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
    hud.margin= 10;
    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:duration];

}

+ (void)showLoading{
    [self showLoadingInView:nil];
}
+ (void)showLoadingInView:(UIView *)view{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    [hud showAnimated:YES];
}

+ (void)showBoutiqueLoading{
    [self showBoutiqueLoadingInView:nil];
}
+ (void)showBoutiqueLoadingInView:(UIView *)view{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mb_loading_base"]];
    [imageV addSubview:[self animationHUD]];
    
    hud.customView = imageV;
    
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor clearColor];
    hud.userInteractionEnabled = NO;

    [hud showAnimated:YES];

}

+ (void)showSuccessWithMessage:(NSString *)message{
    [self showSuccessWithMessage:message inView:nil];
}
+ (void)showSuccessWithMessage:(NSString *)message inView:(UIView *)view{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    // Set an image view with a checkmark.
    UIImage *image = [UIImage imageNamed:@"alert_message_success"];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    
    // Looks a bit nicer if we make it square.
    hud.square = YES;
    // Optional label text.
    hud.detailsLabel.text = message;
    hud.detailsLabel.textColor = [UIColor whiteColor];
    hud.detailsLabel.font = [UIFont systemFontOfSize:15];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor blackColor];
    hud.margin = 10;
    hud.userInteractionEnabled = NO;
    [hud hideAnimated:YES afterDelay:3.f];

}

+ (void)dismiss{
    [self dismissFor:nil];
}
+ (void)dismissFor:(UIView *)view{
    if (view == nil) view = (UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:view animated:NO];
}


@end
