//
//  ZipCodeItem.h
//  Weather
//
//  Created by Travis Hughes on 2/15/15.
//  Copyright (c) 2015 Travis Hughes. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZipCodeItem : NSObject

@property NSString *itemZipCode;
@property BOOL *selected;
@property (readonly) NSDate *creationDate;

@end
