//
//  PhotoItemCell.h
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoItemCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIView *infoView;
@property (strong, nonatomic) UIImageView *profileImageView;
@property (strong, nonatomic) UILabel *usernameLabel;

+ (CGSize)photoItemCellSize;

@end
