//
//  Media.h
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "JSONModel.h"
#import "Data.h"
#import "Meta.h"

@interface Media : JSONModel

@property (strong, nonatomic) Data *data;
@property (strong, nonatomic) Meta *meta;

@end
