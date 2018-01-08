//
//  MBImageDownloader.m
//  DemoMobike
//
//  Created by VictorZhang on 2018/1/8.
//  Copyright © 2018年 VictorZhang. All rights reserved.
//

#import "MBImageDownloader.h"
#import <AFNetworking/AFNetworking.h>
#import "MBImageModel.h"
#import <YYModel/YYModel.h>



@implementation MBImageDownloader

+ (void)downloadImage:(NSString *)urlStr completion:(void(^)(MBImageModel * _Nullable imageModel, NSError * _Nullable err))completion {

    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }
        NSError *_error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&_error];
        MBImageModel *model = [MBImageModel yy_modelWithJSON:dict];
        completion(model, nil);
    }];
    [dataTask resume];
}

@end
