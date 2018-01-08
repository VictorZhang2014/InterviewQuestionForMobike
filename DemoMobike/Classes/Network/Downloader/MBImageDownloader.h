//
//  MBImageDownloader.h
//  DemoMobike
//
//  Created by VictorZhang on 2018/1/8.
//  Copyright © 2018年 VictorZhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MBImageModel;

@interface MBImageDownloader : NSObject

+ (void)downloadImage:(NSString * _Nullable)urlStr completion:(void(^ _Nullable)(MBImageModel * _Nullable imageModel, NSError * _Nullable err))completion;

@end
