//
//  HomeHelp.h
//  BanTanText
//
//  Created by chenq@kensence.com on 16/3/9.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HomeHelp.h"
#import "HomeModel.h"

@interface HomeHelp : NSObject
//数组保存所有数据
@property (nonatomic ,strong)NSArray *AllArray;

//单例方法
+(HomeHelp *)sharedHomeHelp;

//数据解析
- (void)requestAllHomeDataWith:(NSInteger)page Finish:(void(^)())result;


//根据一个index返回一个mode
- (HomeModel *)itemWithIndex:(NSInteger)index;







@end
