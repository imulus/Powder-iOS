//
//  PowderAPI.m
//  Powder
//
//  Created by Bryce Hammond on 1/2/12.
//  Copyright (c) 2012 Imulus, LLC. All rights reserved.
//

#import "PowderAPI.h"
#import "Resort.h"

@interface PowderAPI (Private)

- (void)tellDelegateAboutError:(NSError *)error;
- (Resort *)resortFromJSONDictionary:(NSDictionary *)dictionary;

@end

@implementation PowderAPI

static NSString *s_apiURL = @"http://powder.herokuapp.com/api/json";

@synthesize resorts = _resorts;
@synthesize delegate;

- (void)retrieveResorts
{
    dispatch_queue_t apiQueue = dispatch_queue_create("PowderAPI", NULL);
    dispatch_async(apiQueue, ^{
        NSError *error = nil;
        NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:s_apiURL] 
                                    options:NSDataReadingUncached
                                    error:&error];
        
        if(nil != error)
        {
            [self tellDelegateAboutError:error];
            return; //errored so get out of here
        }
        
        
        NSArray *resorts = (NSArray *)[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&error];
        
        if(nil == error && [resorts isKindOfClass:[NSArray class]])
        {
            //create the resort objects from the JSON objects
            NSMutableArray *newResorts = [[NSMutableArray alloc] init];
            for(NSDictionary *resortDict in resorts)
            {
                if([resortDict isKindOfClass:[NSDictionary class]])
                {
                    [newResorts addObject:[self resortFromJSONDictionary:resortDict]];
                }
                
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.resorts = newResorts;
                [delegate powderAPI:self didRetrieveResorts:newResorts];
            });
            
        }
        else
        {
            [self tellDelegateAboutError:error];
            
        }
        
    });
    dispatch_release(apiQueue);
    
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
    
    
    
    return resort;    
}

@end
