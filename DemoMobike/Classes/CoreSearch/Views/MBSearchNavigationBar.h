//
//  MBSearchNavigationBar.h
//  DemoMobike
//
//  Created by VictorZhang on 2018/1/8.
//  Copyright © 2018年 VictorZhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MBSearchNavigationBar;
@protocol MBSearchNavigationBarDelegate <NSObject>

- (void)searchBar:(MBSearchNavigationBar *)searchBar didSearchText:(NSString *)text;

@end


@interface MBSearchNavigationBar : UIView

@property (nonatomic, weak) id<MBSearchNavigationBarDelegate> delegate;

@end
