//
//  MBImagePreviewerController.h
//  DemoMobike
//
//  Created by VictorZhang on 2018/1/8.
//  Copyright © 2018年 VictorZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBImageModel;

@interface MBImagePreviewerController : UIViewController

- (void)updateDataList:(MBImageModel *)model;

@end
