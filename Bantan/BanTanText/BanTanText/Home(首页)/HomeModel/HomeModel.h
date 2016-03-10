//
//  Model.h
//  BanTanText
//
//  Created by chenq@kensence.com on 16/3/8.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeModel : NSObject
@property (nonatomic ,strong)NSString *ID; //详情页Id
@property (nonatomic ,strong)NSString *title; //标题
@property (nonatomic ,strong)NSString *pic; //图片地址
@property (nonatomic ,strong)NSString *tags; //标记
@property(nonatomic,strong)NSString *likes; //喜欢的人数
@property(nonatomic,strong)NSString *update_time;// 跟新时间
@property(nonatomic,strong)NSString *type; //类型
@property(nonatomic,strong)NSString *desc; //描述



@end
