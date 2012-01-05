//
//  PowderAPI.m
//  Powder
//
//  Created by Bryce Hammond on 1/2/12.
//  Copyright (c) 2012 Imulus, LLC. All rights reserved.
//

#import "PowderAPI.h"

//This is a class extension, which is kind of like a category, but it can add instance
//variables
@interface PowderAPI ()
{
    NSMutableDictionary *_resortsByID;   
}

- (void)tellDelegateAboutError:(NSError *)error;
- (Resort *)resortFromJSONDictionary:(NSDictionary *)dictionary;

@end

@implementation PowderAPI

@synthesize resorts = _resorts;
@synthesize delegate;

- (id)init
{
    if(self = [super init])
    {
        _resortsByID = [[NSMutableDictionary alloc] init];
    }
    
    return self;    
}


//get all the resorts from the API
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
        [_resortsByID setObject:resort forKey:resort.snowReportID];
        
    }
    
    self.resorts = newResorts;
    [delegate powderAPI:self didRetrieveResorts:newResorts];
}

- (Resort *)resortWithSnowReportID:(NSString *)snowReportID
{
    return [_resortsByID objectForKey:snowReportID];
}

- (BOOL)hasUpdatedResorts
{
    return self.resorts.count > 0;
}

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

//create a resort from the dictonary parsed from the JSON object
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
