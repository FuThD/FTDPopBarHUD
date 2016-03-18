# FTDPopBarHUD
### 说明
一个关于顶部弹窗的小框架

###使用步骤
a. 拖入主类及bundle文件夹
b. 导入头文件 #import "FTDPopBarHUD"
c. 根据需要使用方法

###提供方法
1. 成功提示 
```
+ (void)showSuccess:(NSString *)msg;
```
2. 失败提示
```
+ (void)showError:(NSString *)msg;
```
3. 加载提示
```
+ (void)showLoading:(NSString *)msg;
```
4. 跟换提示图片
```
//直接传入UIImage
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;
//传入imageName
+ (void)showMessage:(NSString *)msg imageName:(NSString *)imageName;
```
