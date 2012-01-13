//
//  PowderAPI.m
//  Powder
//
//  Created by Bryce Hammond on 1/2/12.
//  Copyright (c) 2012 Imulus, LLC. All rights reserved.
//

#import "PowderAPI.h"
#import "Favorite.h"
#import "SBJson.h"

//This is a class extension, which is kind of like a category, but it can add instance
//variables
@interface PowderAPI ()
{
    NSMutableDictionary *_resortsByID;
    NSArray *_favorites;
}

- (void)tellDelegateAboutError:(NSError *)error;
- (Resort *)resortFromJSONDictionary:(NSDictionary *)dictionary;
- (NSURL *)resortsUrl;

@end

@implementation PowderAPI

@synthesize resorts = _resorts;
@synthesize delegate;

- (id)init
{
    if(self = [super init])
    {
        _resortsByID = [[NSMutableDictionary alloc] init];
        _favorites = [[NSArray alloc] init];
    }
    
    return self;    
}

- (NSArray *)favorites
{
    if([_favorites count] == 0)
    {
        //populate the favorites from our temp file for now
        
        NSData *favoritesData = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"favorites" ofType:@"json"]];
        NSString *favoritesJson = [[NSString alloc] initWithData:favoritesData encoding:NSUTF8StringEncoding];
        
        NSArray *favoritesDataArray = [favoritesJson JSONValue];
        
        NSMutableArray *favorites = [[NSMutableArray alloc] init];
        
        for(NSDictionary *favoriteDict in favoritesDataArray)
        {
            Favorite *favorite = [[Favorite alloc] init];
            favorite.resortID = [favoriteDict objectForKey:@"id"];
            favorite.resortName = [favoriteDict objectForKey:@"name"];
            [favorites addObject:favorite];
        }
        
        _favorites = favorites;
        
    }
    
    return [_favorites copy];
}


//get all the resorts from the API
- (void)retrieveResorts
{
    
    NSData *resortData = [[NSData alloc] initWithContentsOfURL:[self resortsUrl]];

    NSArray *resorts =  [NSJSONSerialization JSONObjectWithData:resortData options:NSJSONReadingAllowFragments error:nil];
    
    NSMutableArray *newResorts = [[NSMutableArray alloc] init];
    //create some temporary objects to show in our display
    for(NSDictionary *resortDict in resorts)
    {
        Resort *resort = [self resortFromJSONDictionary:resortDict];
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
    
    resort.snowReportID = [[dictionary objectForKey:@"id"] stringValue];
    resort.name = [[dictionary objectForKey:@"name"] stringValue];
    resort.isOpen = [[[dictionary objectForKey:@"status"] stringValue] isEqualToString:@"Open"];
    resort.currentConditions = [[dictionary objectForKey:@"conditions"] stringValue];
    NSDictionary *currentTotal = [dictionary objectForKey:@"base"];
    if(nil != currentTotal)
    {
        resort.totalSnowAmount = [[currentTotal objectForKey:@"depth"] intValue];
        resort.totalSnowMetric = [[currentTotal objectForKey:@"metric"] stringValue];
        resort.totalSnowMetricSymbol = [[currentTotal objectForKey:@"metric_shorthand"] stringValue];        
    }
    
    NSDictionary *todayTotal = [dictionary objectForKey:@"snowfall"];
    if(nil != todayTotal)
    {
        resort.todaysSnowAmount = [[todayTotal objectForKey:@"amount"] intValue];
        resort.todaysSnowMetric = [[todayTotal objectForKey:@"metric"] stringValue];
        resort.todaysSnowMetricSymbol = [[todayTotal objectForKey:@"metric_shorthand"] stringValue];
    }
    
    return resort;    
}
     
- (NSURL *)resortsUrl
{
        return [NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"resorts" ofType:@"json"]];
}

@end
