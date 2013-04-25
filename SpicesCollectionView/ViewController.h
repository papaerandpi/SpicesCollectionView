//
//  ViewController.h
//  SpicesCollectionView
//
//  Created by Bobbette on 4/21/13.
//  Copyright (c) 2013 Bobbette Vance-Cochran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UICollectionViewController <UICollectionViewDataSource,
UICollectionViewDelegate>

@property (strong, nonatomic) NSMutableArray *spiceImages;
//@property (nonatomic, strong) NSMutableArray *albums;
//@property (nonatomic, weak) IBOutlet SpiceLayout *photoAlbumLayout;

@end
