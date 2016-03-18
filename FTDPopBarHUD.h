//
//  FTDPopBarHUD.h
//  FTDPopBarHUD
//
//  Created by FTD on 16/3/17.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface FTDPopBarHUD : NSObject

/**
 *  显示信息
 *
 *  @param msg   文字内容
 *  @param image 图片对象
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;
/**
 *  显示信息
 *
 *  @param msg       文字内容
 *  @param imageName 图片名称 (图片高度最好在 20 以内, 仅限于本地图片)
 */
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName;
/**
 *  显示成功信息
 *
 *  @param msg 文字信息
 */
+ (void)showSuccess:(NSString *)msg;

/**
 *  显示失败信息
 *
 *  @param msg 文字信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示登录 (显示任务完成后要调用隐藏窗口的方法 + (void)hideLoading)
 *
 *  @param msg 文字信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 *  隐藏窗口
 */
+ (void)hideLoading;

@end
