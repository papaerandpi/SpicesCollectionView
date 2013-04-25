//
//  ViewController.m
//  SpicesCollectionView
//
//  Created by Bobbette on 4/21/13.
//  Copyright (c) 2013 Bobbette Vance-Cochran. All rights reserved.
//


#import "ViewController.h"
#import "SpiceLayout.h"
#import "SpiceCell.h"
//#import "BHAlbum.h"
//#import "BHPhoto.h"


static NSString * const PhotoCellIdentifier = @"PhotoCell";

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *albums;
@property (nonatomic, weak) IBOutlet SpiceLayout *photoAlbumLayout;




@end

@implementation ViewController

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    

    
    _spiceImages = [@[@"allspice_spice.jpeg",
                    @"basil_spice.jpeg",
                    @"cardamom_spice.jpeg",
                    @"thyme_spice.jpeg",
                    @"bayleaves_spice.jpeg",
                    @"cinnamon_spice.jpeg",
                    @"cumin_spice.jpeg",
                    @"wholecloves_spice.jpeg",
                    ]mutableCopy];

    
    
    
  //    [self.collectionView registerClass:[SpiceCell class] forCellWithReuseIdentifier:@"MY_CELL"];
    
    
    self.collectionView.backgroundColor = [UIColor colorWithWhite:0.25f alpha:1.0f];
   
    [self.collectionView registerClass:[SpiceCell class]
            forCellWithReuseIdentifier:PhotoCellIdentifier];
    
    
    
   //self.albums = [NSMutableArray array];
    

    
   /*
    
    NSURL *urlPrefix = [NSURL URLWithString:@"https://raw.github.com/papaerandpi/PhotoCollectionView/master/Photos/"];
    
    
    NSInteger photoIndex = 0;
    
    for (NSInteger a = 0; a < 12; a++) {
        BHAlbum *album = [[BHAlbum alloc] init];
        album.name = [NSString stringWithFormat:@"Photo Album %d",a + 1];
        
        NSUInteger photoCount = 1;
        for (NSInteger p = 0; p < photoCount; p++) {
            // there are up to 25 photos available to load from the code repository
            NSString *photoFilename = [NSString stringWithFormat:@"thumbnail%d.jpg",photoIndex % 25];
            NSURL *photoURL = [urlPrefix URLByAppendingPathComponent:photoFilename];
            BHPhoto *photo = [BHPhoto photoWithImageURL:photoURL];
            [album addPhoto:photo];
            
            photoIndex++;
        }
        
        
        [self.albums addObject:album];
        
    } */
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    
    return 1;
    //return 4;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // NSMutableArray *sectionArray = [_data objectAtIndex:section];
    // return [sectionArray count];
    
    return _spiceImages.count;
}

//- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
//{
    
    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
    cellForItemAtIndexPath:(NSIndexPath *)indexPath
    {
        SpiceCell *photoCell =
        [collectionView dequeueReusableCellWithReuseIdentifier:PhotoCellIdentifier
                                                 forIndexPath:indexPath];
  
 //   SpiceCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MY_CELL" forIndexPath:indexPath];
    
    UIImage *image;
    int row = [indexPath row];
    
    image = [UIImage imageNamed:_spiceImages[row]];
    
    photoCell.imageView.image = image;
    
    
    
    photoCell.label.text = [NSString stringWithFormat:@"%d",indexPath.item];
    return photoCell;
}

/*

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.albums.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
   // BHAlbum *album = self.albums[section];
    
    //return album.photos.count;
    

}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BHAlbumPhotoCell *photoCell =
    [collectionView dequeueReusableCellWithReuseIdentifier:PhotoCellIdentifier
                                              forIndexPath:indexPath];
    
    BHAlbum *album = self.albums[indexPath.section];
    BHPhoto *photo = album.photos[indexPath.item];
    
    photoCell.imageView.image = [photo image];
    
    return photoCell;
} */

#pragma mark - View Rotation

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration
{
    if (UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) {
        self.photoAlbumLayout.numberOfColumns = 3;
        
        // handle insets for iPhone 4 or 5
        CGFloat sideInset = [UIScreen mainScreen].preferredMode.size.width == 1136.0f ?
        45.0f : 25.0f;
        
        self.photoAlbumLayout.itemInsets = UIEdgeInsetsMake(22.0f, sideInset, 13.0f, sideInset);
        
    } else {
        self.photoAlbumLayout.numberOfColumns = 2;
        self.photoAlbumLayout.itemInsets = UIEdgeInsetsMake(22.0f, 22.0f, 13.0f, 22.0f);
    }
}
 
 
@end


