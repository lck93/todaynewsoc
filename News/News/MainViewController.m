//
//  MainViewController.m
//  News
//
//  Created by tupservice on 2018/11/30.
//  Copyright © 2018年 huawei. All rights reserved.
//

#import "MainViewController.h"
#import "HomeViewController.h"
#import "SmallVideoController.h"
#import "WeiTouTiaoController.h"
#import "XiGuaController.h"
#import "BaseViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpChild];
    
    
    
    // Do any additional setup after loading the view.
}

- (void)setUpChild
{
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor grayColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    UIColor *titleHighlightedColor = [UIColor darkGrayColor];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, UITextAttributeTextColor,
                                                       nil] forState:UIControlStateSelected];
  
    HomeViewController *home = [[HomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    
    SmallVideoController *small = [[SmallVideoController alloc] init];
    UINavigationController *samllNav = [[UINavigationController alloc] initWithRootViewController:small];
    
    WeiTouTiaoController *weitoutiao = [[WeiTouTiaoController alloc] init];
    UINavigationController *weitoutiaoNav = [[UINavigationController alloc] initWithRootViewController:weitoutiao];
    
    XiGuaController *xigua = [[XiGuaController alloc] init];
    UINavigationController *xiguaNav = [[UINavigationController alloc] initWithRootViewController:xigua];
   
    [self setUpUIWithControlerr:home title:@"首页" image:[UIImage imageNamed:@"home_tabbar_night_32x32_"] selectedImage: [UIImage imageNamed:@"home_tabbar_press_32x32_"]];
    [self setUpUIWithControlerr:small title:@"小视频" image: [UIImage imageNamed:@"huoshan_tabbar_night_32x32_"] selectedImage: [UIImage imageNamed:@"huoshan_tabbar_press_32x32_"]];
    [self setUpUIWithControlerr:weitoutiao title:@"微头条" image: [UIImage imageNamed:@"weitoutiao_tabbar_night_32x32_"] selectedImage: [UIImage imageNamed:@"weitoutiao_tabbar_press_32x32_"]];
    [self setUpUIWithControlerr:xigua title:@"西瓜视频" image: [UIImage imageNamed:@"video_tabbar_night_32x32_"] selectedImage: [UIImage imageNamed:@"video_tabbar_press_32x32_"]];
    
    [self addChildViewController:homeNav];
    [self addChildViewController:samllNav];
    [self addChildViewController:weitoutiaoNav];
    [self addChildViewController:xiguaNav];
    self.viewControllers = @[homeNav,samllNav,weitoutiaoNav,xiguaNav];
    
}

- (void)setUpUIWithControlerr:(UIViewController *)vc title:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    vc.title = title;
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
