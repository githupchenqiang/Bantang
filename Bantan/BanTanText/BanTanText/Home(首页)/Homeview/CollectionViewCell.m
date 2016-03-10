//
//  CollectionViewCell.m
//  BanTanText
//
//  Created by chenq@kensence.com on 16/3/8.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "CollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#define ContenView4Height self.contentView.frame.size.height
#define ContenView4Width self.contentView.frame.size.width
@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self SetupView];
     
    }
    return self;
    
}



- (void)SetupView
{
    //图片位置
    _ImageView = [[UIImageView alloc]init];
//    _ImageView.backgroundColor = [UIColor brownColor];
    [self.contentView addSubview:_ImageView];
    [_ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).with.offset(2);
        make.left.equalTo(self.contentView.mas_left).with.offset(2);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(- self.contentView.frame.size.height/2.5);
        make.right.equalTo(self.contentView.mas_right).with.offset(-2);
    }];
    
    
    //标题位置
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.numberOfLines = 1;
//     _titleLabel.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_ImageView.mas_bottom).with.offset(2);
        make.left.equalTo(self.contentView.mas_left).with.offset(9);
        make.right.equalTo(self.contentView.mas_right).with.offset(-2);
        make.height.mas_equalTo(27);
        
        
    }];
    
    
    //商品描述
    _DescLabel = [[UILabel alloc]init];
    _DescLabel.numberOfLines = 2;
//    _DescLabel.backgroundColor = [UIColor lightGrayColor];
    _DescLabel.alpha = 0.8;
    _DescLabel.alpha = 0.4;
    
    [self.contentView addSubview:_DescLabel];
    
    [_DescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(3);
        make.left.equalTo(self.contentView.mas_left).with.offset(9);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-30);
        make.right.equalTo(self.contentView.mas_right).with.offset(-9);
        
    }];
    
    
    //红心的位置
    _hortImage = [[UIImageView alloc]init];
    UIImage *img = [UIImage imageNamed:@"heart"];
//    _hortImage.backgroundColor = [UIColor yellowColor];
    _hortImage.image = img;
    [self.contentView addSubview:_hortImage];
    [_hortImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_DescLabel.mas_bottom).with.offset(13);
        make.left.equalTo(self.contentView.mas_right).with.offset(-107);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-5);
        make.width.mas_equalTo(17);
        
    }];
   
    //喜欢人数位置
    _likeLabel = [[UILabel alloc]init];
//     _likeLabel.backgroundColor = [UIColor orangeColor];
    [self.contentView addSubview:_likeLabel];
    [_likeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_DescLabel.mas_bottom).with.offset(10);
        make.left.equalTo(_hortImage.mas_left).with.offset(30);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-3);
        make.right.equalTo(self.contentView.mas_right).with.offset(-9);
      
    }];
    
 
    
}


- (void)setData:(HomeModel *)data
{
    [self.ImageView sd_setImageWithURL:[NSURL URLWithString:data.pic]];
    
    self.titleLabel.text = data.title;
    
    self.DescLabel.text = data.desc;
    
    self.likeLabel.text = data.likes;
}


@end
