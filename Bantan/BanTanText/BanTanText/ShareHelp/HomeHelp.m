//
//  HomeHelp.m
//  BanTanText
//
//  Created by chenq@kensence.com on 16/3/9.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "HomeHelp.h"
#import "AFNetworking.h"

#import "WebUrl.h"
@interface HomeHelp()
@property (nonatomic ,strong)NSMutableArray *mutArray;

@end
@implementation HomeHelp

+(HomeHelp *)sharedHomeHelp
{
    static HomeHelp *homeHelp = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        homeHelp = [HomeHelp new];
        
    });
    return homeHelp;
    
}


//数据解析
-(void)requestAllHomeDataWith:(NSInteger)page Finish:(void (^)())result
{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager manager]initWithSessionConfiguration:configuration];
//
    NSString *UrlStr = HomeUrl((long)page);
//
//    [manager GET:UrlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
//        NSDictionary *dic = [responseObject valueForKey:@"data"];
//        
//        for (NSDictionary *Dict in dic[@"topic"]) {
//           
//             HomeModel *model = [HomeModel new];
//            for (HomeModel *model in self.mutArray) {
//                if ([Dict[@"title"] isEqualToString:model.title]) {
//                    return ;
//                    
//                }
//            }
//            [model setValuesForKeysWithDictionary:dic];
//            [self.mutArray addObject:model];
//          
//            result();
//            
//        }
  
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

//    }];
    
    [manager GET:UrlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    
        NSDictionary *dic = [responseObject valueForKey:@"data"];
       
        for (NSDictionary *Dict in dic[@"topic"]) {
             HomeModel *model = [HomeModel new];
            for (HomeModel *model in self.mutArray) {
                if ([Dict[@"title"] isEqualToString:model.title]) {
                    return ;
                    
                }
         
            }
            
            [model setValuesForKeysWithDictionary:Dict];
            [self.mutArray addObject:model];
            
            
            result();
            
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];

}


-(HomeModel *)itemWithIndex:(NSInteger)index
{
    return self.mutArray[index];

}

-(NSMutableArray *)mutArray
{
    if (_mutArray == nil) {
        _mutArray = [NSMutableArray array];
        
    }
    
    return _mutArray;
}

- (NSArray *)AllArray
{
    return [_mutArray mutableCopy];
    
}



@end
