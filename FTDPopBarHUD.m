//
//  FTDPopBarHUD.m
//  FTDPopBarHUD
//
//  Created by FTD on 16/3/17.
//
//

#import "FTDPopBarHUD.h"

UIWindow *_window;
// 窗口的高度
static const CGFloat FTDWindowHeight = 20;
// 动画的执行时间
static const CGFloat FTDDuration = 0.5;
// 窗口的停留时间
static const CGFloat FTDDelay = 1.5;
// 字体大小
#define FTDFont [UIFont systemFontOfSize:12]


@implementation FTDPopBarHUD

/**
 *  显示信息
 *
 *  @param msg   文字内容
 *  @param image 图片对象
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    
    if (_window) return;
    
    // 创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 设置按钮文字大小
    btn.titleLabel.font = FTDFont;
    
    // 设置文字内边距
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    // 设置数据
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    
    // 创建窗口
    _window = [[UIWindow alloc] init];
    // 窗口背景
    _window.backgroundColor = [UIColor blackColor];
    _window.windowLevel = UIWindowLevelAlert;
    _window.frame = CGRectMake(0, -FTDWindowHeight, [UIScreen mainScreen].bounds.size.width, FTDWindowHeight);
    btn.frame = _window.bounds;
    [_window addSubview:btn];
    _window.hidden = NO;
    
    // 动画
    [UIView animateWithDuration:FTDDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:FTDDuration delay:FTDDelay options:kNilOptions animations:^{
            CGRect frame = _window.frame;
            frame.origin.y = -FTDWindowHeight;
            _window.frame = frame;
        } completion:^(BOOL finished) {
            _window = nil;
        }];
    }];
}
/**
 *  显示信息
 *
 *  @param msg       文字内容
 *  @param imageName 图片名称
 */
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName
{
    [self showMessage:msg image:[UIImage imageNamed:imageName]];
}
/**
 *  显示成功信息
 *
 *  @param msg 文字信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg imageName:@"FTDPopBarHUD.bundle/success"];
}

/**
 *  显示失败信息
 *
 *  @param msg 文字信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg imageName:@"FTDPopBarHUD.bundle/error"];
}

/**
 *  隐藏窗口
 */
+ (void)hideLoading
{
    // 动画
    [UIView animateWithDuration:FTDDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y = -FTDWindowHeight;
        _window.frame = frame;
    }completion:^(BOOL finished) {
        _window = nil;
    }];
}


/**
 *  显示登录
 *
 *  @param msg 文字信息
 */
+ (void)showLoading:(NSString *)msg
{
    
    if (_window) return;
    
    // 创建窗口
    _window = [[UIWindow alloc] init];
    // 窗口背景
    _window.backgroundColor = [UIColor blackColor];
    _window.windowLevel = UIWindowLevelAlert;
    _window.frame = CGRectMake(0, -FTDWindowHeight, [UIScreen mainScreen].bounds.size.width, FTDWindowHeight);
    _window.hidden = NO;
    
    // 文字
    UILabel *label = [[UILabel alloc] init];
    label.frame = _window.bounds;
    label.font = FTDFont;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    [_window addSubview:label];
    
    // 圈圈
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [indicatorView startAnimating];
    indicatorView.frame = CGRectMake(0, 0, FTDWindowHeight, FTDWindowHeight);
    [_window addSubview:indicatorView];
    
    // 动画
    [UIView animateWithDuration:FTDDuration animations:^{
        CGRect frame = _window.frame;
        frame.origin.y = 0;
        _window.frame = frame;
    }];
    
}


@end
