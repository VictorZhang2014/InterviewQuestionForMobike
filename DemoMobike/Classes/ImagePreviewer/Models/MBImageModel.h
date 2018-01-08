//
//  MBImageModel.h
//  DemoMobike
//
//  Created by VictorZhang on 2018/1/8.
//  Copyright © 2018年 VictorZhang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MBImagePropertiesListModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) int width;
@property (nonatomic, assign) int height;
@property (nonatomic, strong) NSString *imgsize;
@property (nonatomic, strong) NSString *imgtype;

@property (nonatomic, strong) NSString *key;

@property (nonatomic, strong) NSString *link;


@property (nonatomic, strong) NSString *img;
@property (nonatomic, strong) NSString *thumb_bak;
@property (nonatomic, strong) NSString *thumb;

@property (nonatomic, assign) int thumbWidth;
@property (nonatomic, assign) int thumbHeight;

@property (nonatomic, assign) BOOL fixedSize;

@end



@interface MBImageModel : NSObject

@property (nonatomic, strong) NSString *total;
@property (nonatomic, strong) NSString *sid;
@property (nonatomic, strong) NSArray *list;

@end



