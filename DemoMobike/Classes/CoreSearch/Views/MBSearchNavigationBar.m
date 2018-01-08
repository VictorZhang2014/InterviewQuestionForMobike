//
//  MBSearchNavigationBar.m
//  DemoMobike
//
//  Created by VictorZhang on 2018/1/8.
//  Copyright © 2018年 VictorZhang. All rights reserved.
//

#import "MBSearchNavigationBar.h"
#import <Masonry/Masonry.h>


@implementation MBSearchNavigationBar

- (instancetype)init {
    self = [super init];
    if (self) {
        
        UIView *view = [[UIView alloc] init];
        view.layer.borderColor = [UIColor grayColor].CGColor;
        view.layer.borderWidth = 1.0;
        view.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        view.layer.cornerRadius = 3;
        [self addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(25);
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.right.mas_equalTo(-10);
        }];
        
        UITextField *textField = [[UITextField alloc] init];
        textField.text = @"mobike";
        [view addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(10);
            make.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-10);
        }];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:textField];
        
    }
    return self;
}


# pragma mark - UITextFieldDelegate
- (void)textFieldDidChange:(NSNotification *)notification {
    UITextField *textField = notification.object;
    if ([self.delegate respondsToSelector:@selector(searchBar:didSearchText:)]) {
        [self.delegate searchBar:self didSearchText:textField.text];
    }
}

@end

