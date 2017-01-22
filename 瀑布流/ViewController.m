//
//  ViewController.m
//  瀑布流
//
//  Created by mac on 2016/12/15.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"
#import "WaterfallLayout.h"
#define HMColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define HMRandomColor HMColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WaterfallLayoutDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    WaterfallLayout *flowLayout = [[WaterfallLayout alloc] init];
    // 高度
    flowLayout.delegate = self;
    
    
    CGFloat w = ([UIScreen mainScreen].bounds.size.width - 40) / 3;
    
    flowLayout.wf_itemSize = CGSizeMake(w, w);
    // 间隙
    flowLayout.insertItemSpacing = 10;
    // 内边距
    flowLayout.sectionInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    // 列数
    flowLayout.numberOfColumn = 3;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    
    collectionView.backgroundColor = [UIColor whiteColor];

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 4;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = HMRandomColor;
    return cell;
}
-(CGFloat)heightForItemIndexPath:(NSIndexPath *)indexPath{
    return 100 +  (arc4random() % 101);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
