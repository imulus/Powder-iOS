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
@property (nonatomic, strong) NSString *todaysSnowMetricSymbol;
@property (nonatomic, strong) NSString *totalSnowMetric;
@property (nonatomic, strong) NSString *totalSnowMetricSymbol;
@property (nonatomic, assign) bool isOpen;
@property (nonatomic, strong) NSString *currentConditions;
@property (nonatomic, strong) NSString *snowReportID;

@end
