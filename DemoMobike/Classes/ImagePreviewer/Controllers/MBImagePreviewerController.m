//
//  MBImagePreviewerController.m
//  DemoMobike
//
//  Created by VictorZhang on 2018/1/8.
//  Copyright © 2018年 VictorZhang. All rights reserved.
//

#import "MBImagePreviewerController.h"
#import "MBImagePreviewerCollectionViewCell.h"
#import "MBImageModel.h"
#import <Masonry/Masonry.h>


static NSString *kMBImagePreviewerCollectionViewCellReuseCellIdentifier = @"MBImagePreviewerCollectionViewCell_ReuseCell_Identifier";

@interface MBImagePreviewerController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSArray *dataModels;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation MBImagePreviewerController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupCollectionView];
}

- (void)updateDataList:(MBImageModel *)model {
    self.dataModels = model.list;
    dispatch_async(dispatch_get_main_queue(), ^{
       [self.collectionView reloadData];
    });
}

- (void)setupCollectionView {
    CGFloat width = self.view.frame.size.width - 5;
    CGFloat itemWidth = width / 3;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth * 1.1);
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    [self.collectionView registerClass:[MBImagePreviewerCollectionViewCell class] forCellWithReuseIdentifier:kMBImagePreviewerCollectionViewCellReuseCellIdentifier];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MBImagePreviewerCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMBImagePreviewerCollectionViewCellReuseCellIdentifier forIndexPath:indexPath];
    
    NSDictionary *model = [self.dataModels objectAtIndex:indexPath.row];
    [cell updateImage:model[@"thumb"]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}



@end








