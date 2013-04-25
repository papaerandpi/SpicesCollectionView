//
//  SpiceLayout.h
//  SpicesCollectionView
//
//  Created by Bobbette on 4/21/13.
//  Copyright (c) 2013 Bobbette Vance-Cochran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpiceLayout : UICollectionViewLayout

@property (nonatomic) UIEdgeInsets itemInsets;
@property (nonatomic) CGSize itemSize;
@property (nonatomic) CGFloat interItemSpacingY;
@property (nonatomic) NSInteger numberOfColumns;

@end

