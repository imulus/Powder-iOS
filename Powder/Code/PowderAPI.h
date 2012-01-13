//
//  PowderAPI.h
//  Powder
//
//  Created by Bryce Hammond on 1/2/12.
//  Copyright (c) 2012 Imulus, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Resort.h"

@class PowderAPI;

@protocol PowderAPIDelegate <NSObject>

- (void)powderAPI:(PowderAPI *)api didRetrieveResorts:(NSArray *)resorts;

@optional

- (void)powderAPI:(PowderAPI *)api resortRetrievalFailedWithError:(NSError *)error;

@end

@interface PowderAPI : NSObject

@property (nonatomic, strong) NSArray *resorts;
@property (nonatomic, weak) id<PowderAPIDelegate> delegate;
@property (nonatomic, readonly) NSArray *favorites;

- (void)retrieveResorts;
- (Resort *)resortWithSnowReportID:(NSString *)snowReportID;
- (BOOL)hasUpdatedResorts;

@end
