//
//  User.h
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "JSONModel.h"

@interface User : JSONModel

@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *profile_picture;
@property (strong, nonatomic) NSString *full_name;

@end
