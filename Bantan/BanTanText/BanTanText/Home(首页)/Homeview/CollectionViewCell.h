//
//  CollectionViewCell.h
//  BanTanText
//
//  Created by chenq@kensence.com on 16/3/8.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeModel.h"
@interface CollectionViewCell : UICollectionViewCell
@property(nonatomic,strong)UIImageView *ImageView;
@property(nonatomic,strong)UILabel *DescLabel;
@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *hortImage;
@property (nonatomic ,strong)UILabel *likeLabel;

@property(nonatomic,strong)HomeModel *data;


@end
