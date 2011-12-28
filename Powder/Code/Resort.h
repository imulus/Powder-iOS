//
//  Resort.h
//  Powder
//
//  Created by Bryce Hammond on 12/28/11.
//  Copyright (c) 2011 Imulus, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Resort : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) int todaysSnowAmount;
@property (nonatomic, assign) int totalSnowAmount;
@property (nonatomic, strong) NSString *todaysSnowMetric;
@property (nonatomic, assign) NSString *todaysSnowMetricSymbol;
@property (nonatomic, assign) NSString *totalSnowMetric;
@property (nonatomic, assign) NSString *totalSnowMetricSymbol;

@end
