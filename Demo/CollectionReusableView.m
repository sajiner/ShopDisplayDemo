//
//  CollectionReusableView.m
//  Demo
//
//  Created by sajiner on 2017/8/2.
//  Copyright © 2017年 sajiner. All rights reserved.
//

#import "CollectionReusableView.h"

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface CollectionReusableView ()

@property(nonatomic, strong) UIView *headerView;
@property(nonatomic, strong) UIView *pageView;


@end

@implementation CollectionReusableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    _headerView = [[UIView alloc] init];
    _headerView.backgroundColor = [UIColor redColor];
    [self addSubview:_headerView];
    
    _pageView = [[UIView alloc] init];
    _pageView.backgroundColor = [UIColor blueColor];
    [self addSubview:_pageView];
    
    [_headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.top.equalTo(0);
        make.right.equalTo(0);
        make.height.equalTo(200);
    }];
    
    [_pageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.top.equalTo(_headerView.bottom).offset(0);
        make.height.equalTo(44);
    }];
}

@end
