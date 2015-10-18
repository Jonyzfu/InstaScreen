//
//  ImageInfo.h
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "JSONModel.h"

@interface ImageInfo : JSONModel

@property (strong, nonatomic) NSString *url;
@property (assign, nonatomic) int width;
@property (assign, nonatomic) int height;

@end
