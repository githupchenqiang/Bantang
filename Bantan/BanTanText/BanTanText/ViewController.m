//
//  ViewController.m
//  BanTanText
//
//  Created by chenq@kensence.com on 16/3/8.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "HomeController.h"
#import "HomecollectionController.h"
#import "CollectionViewCell.h"
#import "HomeHelp.h"
#import "HomeModel.h"

#define Width4Bottom self.view.frame.size.width
#define Height4Bottom self.view.frame.size.height

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSLog(@"%f %f",Width4Bottom,Height4Bottom);
    
    
//    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc]initWithTitle:@"半塘" style:UIBarButtonItemStylePlain target:self action:nil];
//    buttonItem.tintColor = [UIColor redColor];
//    
//    self.navigationItem.leftBarButtonItem = buttonItem;
//
    
    
    self.view.backgroundColor = [UIColor colorWithRed:227/255.0 green:230/255.0 blue:232/255.0 alpha:1];
//    [self setTable];
    
    

    [self Setupcollection];
    

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(27, 2, 70, 40)];
    label.text = @"半塘";
//    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:27];
    label.textColor = [UIColor redColor];
    [self.navigationController.navigationBar addSubview:label];
    
    
    UIImage *UserImage = [UIImage imageNamed:@"User"];
//    [UserImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *UserButton = [[UIBarButtonItem alloc]initWithImage:UserImage style:(UIBarButtonItemStylePlain) target:self action:@selector(UserMessage:)];
    
    
    UIImage *setting = [UIImage imageNamed:@"Setting"];
//    [setting imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *SettionButton = [[UIBarButtonItem alloc]initWithImage:setting style:(UIBarButtonItemStylePlain) target:self action:@selector(SettingAction:)];
    
    UIImage *SelectImage = [UIImage imageNamed:@"Select"];
//    [SelectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *SelectButton = [[UIBarButtonItem alloc]initWithImage:SelectImage style:(UIBarButtonItemStylePlain) target:self action:@selector(selectAction:)];
    
    UIImage *HomeImage = [UIImage imageNamed:@"Home"];
//    [HomeImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *Homebutton = [[UIBarButtonItem alloc]initWithImage:HomeImage style:(UIBarButtonItemStylePlain) target:self action:@selector(HomeAction)];
    
    
    self.navigationItem.rightBarButtonItems = @[UserButton,SettionButton,SelectButton,Homebutton];

}


- (void)setTable
{
    UITableView *table = [[UITableView alloc]init];
    table.backgroundColor = [UIColor cyanColor];
    table.delegate = self;
    table.dataSource = self;
    
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
    [self.view addSubview:table];
    
    [table mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
  
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10000;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"测试";
    return cell;
    
    
}

#pragma mark ==创建集合视图====
- (void)Setupcollection
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumInteritemSpacing = 20;
    flowLayout.minimumLineSpacing = 20;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0,0,Width4Bottom,Height4Bottom) collectionViewLayout:flowLayout];
 
    collectionView.collectionViewLayout = flowLayout;

    collectionView.backgroundColor = [UIColor colorWithRed:227/255.0 green:230/255.0 blue:232/255.0 alpha:1];
    //设置数据源代理
    collectionView.dataSource = self;
    collectionView.delegate = self;
    //注册cell
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    
    
    [collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"header"];
    
    
    [[HomeHelp sharedHomeHelp]requestAllHomeDataWith:0 Finish:^{
        [collectionView reloadData];
        
    }];
    //注册头
//    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.view addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
     }];
 
}


//用户事件
- (void)UserMessage:(UIBarButtonItem *)sender
{
  
 
}

//设置事件
- (void)SettingAction:(UIBarButtonItem *)Set
{
    
}
//检索事件
- (void)selectAction:(UIBarButtonItem *)Select
{
    
}

//主页点击事件
- (void)HomeAction
{

    
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%lu",(unsigned long)[HomeHelp sharedHomeHelp].AllArray.count);
    return [HomeHelp sharedHomeHelp].AllArray.count;
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    HomeModel *mode = [[HomeHelp sharedHomeHelp]itemWithIndex:indexPath.item];
    static NSString *cellIdentifier = @"UICollectionViewCell";
    
    HomeModel *mode = [[HomeHelp sharedHomeHelp]itemWithIndex:indexPath.item];
    
    CollectionViewCell *Cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    Cell.data = mode;

  
    Cell.backgroundColor = [UIColor whiteColor];
    
    return Cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
   
    return CGSizeMake(Width4Bottom*0.46, 300);
    
}


//
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 20,20,20);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger integer = indexPath.item;
    
    NSLog(@"%ld",(long)integer);
    
}



-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
