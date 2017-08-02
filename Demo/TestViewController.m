//
//  TestViewController.m
//  Demo
//
//  Created by sajiner on 2017/8/2.
//  Copyright © 2017年 sajiner. All rights reserved.
//

#import "TestViewController.h"
#import "Layout.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

#import "CollectionReusableView.h"

#import "UIImage+Extension.h"

@interface TestViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property(nonatomic, strong) UICollectionView *collectionView;
@property(nonatomic, strong) Layout *layout;

@property(nonatomic, strong) UIView *headerView;
@property(nonatomic, strong) UIView *pageView;

@property(nonatomic, assign, getter=isUnfold) BOOL unfold;

@property (nonatomic, weak) UILabel *nameLabel;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _unfold = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.pageView];
    
    self.layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.5, 100);
    
    // 给导航条的背景图片传递一个空图片的UIImage对象
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    // 隐藏底部阴影条，传递一个空图片的UIImage对象
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.text = @"hello ";
    [nameLabel sizeToFit];
    self.navigationItem.titleView = nameLabel;
    nameLabel.alpha = 0;
    nameLabel.hidden = YES;
    _nameLabel = nameLabel;
}


- (void)tap {
    if (self.isUnfold) {
        self.layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.5, 100);
        [self.collectionView reloadData];
        _unfold = NO;
    } else {
        self.layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 100);
        [self.collectionView reloadData];
        _unfold = YES;
    }
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:self.layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}


- (Layout *)layout {
    if (!_layout) {
        _layout = [[Layout alloc] init];
    }
    return _layout;
}

#pragma mark - UICollectionViewDataSource  UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:(arc4random_uniform(256) / 255.0) green:(arc4random_uniform(256) / 255.0) blue:(arc4random_uniform(256) / 255.0) alpha:1];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    CollectionReusableView *view = (CollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    return view;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 244);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    _nameLabel.hidden = NO;
    if (offsetY >= 200 - 64) {
        self.pageView.hidden = NO;
    } else {
        self.pageView.hidden = YES;
    }
    // 设置导航条的背景图片
    CGFloat alpha = offsetY / (200 - 64);
    
    // 当alpha大于1，导航条半透明，因此做处理，大于1，就直接=0.99
    if (alpha >= 1) {
        alpha = 0.99;
    }
    NSLog(@"%f ---- %f", alpha, offsetY);
    
    _nameLabel.alpha = alpha;
    // 设置导航条的背景图片
    UIImage *image = [UIImage imageWithColor:[UIColor colorWithWhite:1 alpha:alpha]];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}

- (UIView *)pageView {
    if (!_pageView) {
        _pageView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 44)];
        _pageView.backgroundColor = [UIColor blueColor];
        _pageView.hidden = YES;
    }
    
    return _pageView;
}

@end
