//
//  ResortOpenClosedView.m
//  Powder
//
//  Created by Bryce Hammond on 1/14/12.
//  Copyright (c) 2012 Imulus, LLC. All rights reserved.
//

#import "ResortOpenClosedView.h"

@interface ResortOpenClosedView ()


@end

@implementation ResortOpenClosedView

@synthesize open = _open;

- (void)setupView
{
    [super setupView];
    [self setOpen:NO];
}

- (void)setOpen:(BOOL)open
{
    _open = open;
    
    UIImage *backgroundImage = nil;
    if(YES == open)
    {
        backgroundImage = [UIImage imageNamed:@"green-bubble.png"];
        [self setText:@"Open"];
    }
    else
    {
        backgroundImage = [UIImage imageNamed:@"green-bubble.png"];
        [self setText:@"Closed"];
    }
    
    [_statusBackgroundView setImage:[backgroundImage stretchableImageWithLeftCapWidth:10 topCapHeight:0]];
}

@end
