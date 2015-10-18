//
//  DataItem.h
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "JSONModel.h"
#import "User.h"
#import "Images.h"
#import "Caption.h"
#import "Videos.h"

@protocol DataItem

@end

@interface DataItem : JSONModel

@property (assign, nonatomic) int created_time;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) User *user;
@property (strong, nonatomic) Images *images;
@property (strong, nonatomic) Caption *caption;
@property (strong, nonatomic) Videos<Optional> *videos;

@end
