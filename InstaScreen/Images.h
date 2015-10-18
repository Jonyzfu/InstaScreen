//
//  Images.h
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "JSONModel.h"
#import "ImageInfo.h"

@interface Images : JSONModel

@property (strong, nonatomic) ImageInfo *low_resolution;
@property (strong, nonatomic) ImageInfo *thumbnail;
@property (strong, nonatomic) ImageInfo *standard_resolution;

@end
