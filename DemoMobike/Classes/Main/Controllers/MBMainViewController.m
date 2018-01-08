//
//  ViewController.m
//  DemoMobike
//
//  Created by VictorZhang on 2018/1/8.
//  Copyright © 2018年 VictorZhang. All rights reserved.
//

#import "MBMainViewController.h"
#import "MBImagePreviewerController.h"
#import "MBSearchNavigationBar.h"
#import <Masonry/Masonry.h>
#import "MBImageDownloader.h"


@interface MBMainViewController ()<MBSearchNavigationBarDelegate>

@property (nonatomic, strong) MBImagePreviewerController *imagePreviwer;

@end

@implementation MBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //搜索导航栏
    MBSearchNavigationBar *searchBar = [[MBSearchNavigationBar alloc] init];
    searchBar.delegate = self;
    [self.view addSubview:searchBar];
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.width.mas_equalTo(self.view.mas_width);
        make.height.mas_equalTo(80);
    }];
    
    //图片瀑布流
    self.imagePreviwer = [[MBImagePreviewerController alloc] init];
    [self addChildViewController:self.imagePreviwer];
    [self.view addSubview:self.imagePreviwer.view];
    [self.imagePreviwer.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(searchBar.mas_bottom).offset = 2.5;
        make.left.equalTo(self.view.mas_left).offset = 2.5;
        make.right.equalTo(self.view.mas_right).offset = -2.5;
        make.bottom.equalTo(self.view.mas_bottom).offset = -2.5;
    }];
    
    [self loadData:@"mobike"];
}

- (void)loadData:(NSString *)text {
    [MBImageDownloader downloadImage:[NSString stringWithFormat:@"http://image.so.com/j?q=%@", text] completion:^(MBImageModel * _Nullable imageModel, NSError * _Nullable err) {
        if (err) {
            [self alert:err.localizedDescription];
            return;
        }
        [self.imagePreviwer updateDataList:imageModel];
    }];
}


# pragma mark - MBSearchNavigationBarDelegate
- (void)searchBar:(MBSearchNavigationBar *)searchBar didSearchText:(NSString *)text {
    if (text.length) {
        [self loadData:text];
    }
}

- (void)alert:(NSString *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
        [alertVC addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alertVC animated:YES completion:nil];
    });
}

@end
