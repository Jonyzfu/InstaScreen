//
//  PhotosViewController.m
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "PhotosViewController.h"
#import "LoginViewController.h"
#import "PhotoItemCell.h"
#import "Data.h"
#import <JSONHTTPClient.h>
#import <SDWebImage/UIImageView+WebCache.h>


NSString const *baseURL = @"https://api.instagram.com/v1/";
NSString const *popularEndPoint = @"media/popular?access_token=";
NSString const *recentEndPoint = @"media/recent?access_token=";
static NSString * const cellIdentifier = @"photoItemCell";

@interface PhotosViewController ()

@property (strong, nonatomic) Data *mediaData;
@property (strong, nonatomic) UICollectionView *collectionView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;


@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.navigationItem setTitle:@"InstaScreen"];
    [self fetchData];
    
    // Logout bar button
    UIBarButtonItem *logoutBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleDone target:self action:@selector(logout:)];
    [self.navigationItem setRightBarButtonItem:logoutBarButton];
    [self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStyleDone];
    
    // Refresh bar button
    UIBarButtonItem *refreshBarButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(fetchData)];
    [self.navigationItem setLeftBarButtonItem:refreshBarButton];
    [self.navigationItem.rightBarButtonItem setStyle:UIBarButtonItemStyleDone];
    
    // CollectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    [layout setSectionInset: UIEdgeInsetsMake(5, 0, 5, 0)];
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView registerClass:[PhotoItemCell class] forCellWithReuseIdentifier:cellIdentifier];
    [_collectionView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_collectionView];
    
    // Refresh Control
    _refreshControl = [[UIRefreshControl alloc] init];
    [_refreshControl setTintColor:[UIColor colorWithRed:0.867 green:0.902 blue:0.929 alpha:1.000]];
    [_refreshControl setBackgroundColor:[UIColor colorWithRed:0.196 green:0.357 blue:0.510 alpha:1.000]];
    [_refreshControl addTarget:self action:@selector(fetchData) forControlEvents:UIControlEventValueChanged];
    [_collectionView addSubview:_refreshControl];
    _collectionView.alwaysBounceVertical = YES;
    

}

#pragma mark Fetch Data
- (void) fetchData {
    NSString *url = [[baseURL stringByAppendingString:(NSString *)popularEndPoint] stringByAppendingString:(NSString *)[[NSUserDefaults standardUserDefaults] objectForKey:@"token"]];
    
    [JSONHTTPClient getJSONFromURLWithString:url completion:^(id json, JSONModelError *err) {
        NSString *jsonString = json;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonString options:NSJSONWritingPrettyPrinted error:&err];
        NSString *jsonStringEncode = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        _mediaData = [[Data alloc] initWithString:jsonStringEncode error:nil];
        
        NSLog(@"data:%lu",(unsigned long)_mediaData.data.count);
        [_refreshControl endRefreshing];
        [_collectionView reloadData];
    }];
    [_refreshControl endRefreshing];
    
}

#pragma mark Logout the Instagram
- (void)logout: (UIBarButtonItem *) barButton {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
    
    LoginViewController *loginVC = [[LoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}


//- (void)loadMoreData:(int)startingSection {
//    int endingSection = _mediaData.data.count;
//    NSMutableArray *indexPaths = [NSMutableArray array];
//    for (; startingSection < endingSection; startingSection++) {
//        [indexPaths addObject:[NSIndexPath indexPathForRow:0 inSection:startingSection]];
//    }
//    [_collectionView insertItemsAtIndexPaths:indexPaths];
//}

#pragma mark UICollectionView Methods
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _mediaData.data.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == _mediaData.data.count - 1) {
        [self refreshControl];
    }
    
    PhotoItemCell *cell = (PhotoItemCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    DataItem * dataItem = _mediaData.data[indexPath.section];
    
    [cell.usernameLabel setText:dataItem.user.username];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:dataItem.images.low_resolution.url]];
    
    [cell.profileImageView sd_setImageWithURL:[NSURL URLWithString:dataItem.user.profile_picture]];
    [cell.profileImageView.layer setMasksToBounds:YES];
    [cell.profileImageView.layer setCornerRadius:20];
    [cell.profileImageView.layer setBorderWidth:1];
    [cell.profileImageView.layer setBorderColor:[UIColor grayColor].CGColor];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [PhotoItemCell photoItemCellSize];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
     NSLog(@"%li selected", (long)indexPath.section + 1);

}

@end
