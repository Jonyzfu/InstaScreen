//
//  Videos.h
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "JSONModel.h"
#import "VideoInfo.h"

@interface Videos : JSONModel

@property (strong, nonatomic) VideoInfo *low_bandwidth;
@property (strong, nonatomic) VideoInfo *standard_resolution;
@property (strong, nonatomic) VideoInfo *low_resolution;

@end
