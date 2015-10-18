//
//  Data.h
//  InstaScreen
//
//  Created by Jony Fu on 10/16/15.
//  Copyright © 2015 Jony Fu. All rights reserved.
//

#import "JSONModel.h"
#import "DataItem.h"

@interface Data : JSONModel

@property (strong, nonatomic) NSArray<DataItem> *data;

// - (void)addDataObject:(DataItem *)dataItem;

@end
