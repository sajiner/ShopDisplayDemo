//
//  Layout.m
//  Demo
//
//  Created by sajiner on 2017/8/2.
//  Copyright © 2017年 sajiner. All rights reserved.
//

#import "Layout.h"

@implementation Layout

- (void)prepareLayout {
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = NO;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.minimumInteritemSpacing = 0;
    self.minimumLineSpacing = 0;
}

@end
