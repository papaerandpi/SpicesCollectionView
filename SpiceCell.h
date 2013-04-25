//
//  SpiceCell.h
//  SpicesCollectionView
//
//  Created by Bobbette on 4/24/13.
//  Copyright (c) 2013 Bobbette Vance-Cochran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpiceCell : UICollectionViewCell

@property (retain, nonatomic) UILabel* label;

@property (nonatomic, strong, readonly) UIImageView *imageView;

//@property (nonatomic, retain, readwrite) IBOutlet UIImageView *imageView;

@end
