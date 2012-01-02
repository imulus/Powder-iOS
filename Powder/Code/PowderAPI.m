//
//  PowderAPI.m
//  Powder
//
//  Created by Bryce Hammond on 1/2/12.
//  Copyright (c) 2012 Imulus, LLC. All rights reserved.
//

#import "PowderAPI.h"

@interface PowderAPI (Private)

- (void)tellDelegateAboutError:(NSError *)error;
- (Resort *)resortFromJSONDictionary:(NSDictionary *)dictionary;

@end

@implementation PowderAPI

@synthesize resorts = _resorts;
@synthesize delegate;

- (void)retrieveResorts
{
    NSMutableArray *newResorts = [[NSMutableArray alloc] init];
    //create some temporary objects to show in our display
    for(int resortIdx = 0; resortIdx < 15; ++resortIdx)
    {
        NSMutableArray *newResorts = [[NSMutableArray alloc] init];
        Resort *resort = [self resortFromJSONDictionary:nil];
        resort.name = [NSString stringWithFormat:@"%@ %i", resort.name, resortIdx + 1];
        resort.snowReportID = resort.name;
        [newResorts addObject:resort];
        
    }
    
    [delegate powderAPI:self didRetrieveResorts:newResorts];
}

@end

@implementation PowderAPI (Private)

- (void)tellDelegateAboutError:(NSError *)error
{
    //tell them we had an error and make sure it's on the main thread
    dispatch_async(dispatch_get_main_queue(), ^{
        if([delegate respondsToSelector:@selector(powderAPI:resortRetrievalFailedWithError:)])
        {
            [delegate powderAPI:self resortRetrievalFailedWithError:error];
            
        }
    });
}

- (Resort *)resortFromJSONDictionary:(NSDictionary *)dictionary
{
    Resort *resort = [[Resort alloc] init];
    
    resort.name = @"Vail";
    resort.totalSnowAmount = 30;
    resort.totalSnowMetric = @"inches";
    resort.totalSnowMetricSymbol = @"\"";
    resort.todaysSnowAmount = 2;
    resort.todaysSnowMetric = @"inches";
    resort.todaysSnowMetricSymbol = @"\"";
    resort.currentConditions = @"Lot's of crashing skiers";
    resort.isOpen = YES;
    
    return resort;    
}

@end
