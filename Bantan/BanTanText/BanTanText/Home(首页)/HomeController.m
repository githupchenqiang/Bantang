//
//  HomeController.m
//  BanTanText
//
//  Created by chenq@kensence.com on 16/3/8.
//  Copyright © 2016年 chenq@kensence.com. All rights reserved.
//

#import "HomeController.h"
#import "CollectionViewCell.h"
#import "HomeHelp.h"
#import "HomeModel.h"
#define With4View self.view.frame.size.width
#define Height4View self.view.frame.size.height

@interface HomeController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation HomeController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    

//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
//    
//    flowLayout.itemSize = CGSizeMake(With4View/2-30, Height4View/2.5);
//    
//    //设置行间距
//    flowLayout.minimumInteritemSpacing = 20;
//    
//    //设置每一个item的间距
//    flowLayout.minimumLineSpacing = 20;
//    
//    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
//    
//    flowLayout.headerReferenceSize = CGSizeMake(With4View, 150);
//    
//    
//    
//    self.collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:flowLayout];
    
    
    //注册cell
    [self.collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    __weak typeof(self)weakself = self;
    
    [[HomeHelp sharedHomeHelp]requestAllHomeDataWith:0 Finish:^{
    
        [self.collectionView reloadData];
        
    }];
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    NSLog(@"%lu",(unsigned long)[HomeHelp sharedHomeHelp].AllArray.count);
    
    return [HomeHelp sharedHomeHelp].AllArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeModel  *itm = [[HomeHelp sharedHomeHelp]itemWithIndex:indexPath.item];

    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.data = itm;
    
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(With4View/2-30, Height4View/2.5);
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 20, 20, 20);
    
}







#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
