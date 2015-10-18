//
//  PhotoItemCell.m
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "PhotoItemCell.h"
#import <PureLayout.h>


@implementation PhotoItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat cellHeight = frame.size.height - (double)50;
        
        _infoView = [[UIView alloc] initForAutoLayout];
        [self.contentView addSubview:_infoView];
        [_infoView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeBottom];
        [_infoView autoSetDimension:ALDimensionHeight toSize:50];
        
        _profileImageView = [[UIImageView alloc] initForAutoLayout];
        [_profileImageView setClipsToBounds:NO];
        [_infoView addSubview:_profileImageView];
        [_profileImageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, 5, 5, 0) excludingEdge:ALEdgeRight];
        [_profileImageView autoSetDimensionsToSize:CGSizeMake(40, 40)];
        
        _usernameLabel = [[UILabel alloc] initForAutoLayout];
        [_usernameLabel setTextAlignment:NSTextAlignmentLeft];
        [_infoView addSubview:_usernameLabel];
        [_usernameLabel autoSetDimension:ALDimensionHeight toSize:22];
        [_usernameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:_profileImageView withOffset:5];
        [_usernameLabel autoCenterInSuperviewMargins];
        
        _imageView = [[UIImageView alloc] initForAutoLayout];
        [self.contentView addSubview:_imageView];
        [_imageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) excludingEdge:ALEdgeTop];
        [_imageView autoSetDimension:ALDimensionHeight toSize:cellHeight];
    }
    return self;
}

+ (CGSize)photoItemCellSize {
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat headerViewHeight = 50;
    CGFloat screenHeight = screenWidth + headerViewHeight;
    return CGSizeMake(screenWidth, screenHeight);
}

@end
