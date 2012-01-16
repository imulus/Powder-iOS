//
//  StretchingStatusView.m
//  Powder
//
//  Created by Bryce Hammond on 1/15/12.
//  Copyright (c) 2012 Imulus, LLC. All rights reserved.
//

#import "StretchingStatusView.h"

@implementation StretchingStatusView

@synthesize text = _text;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setupView];
}

- (void)setText:(NSString *)text
{
    _text = text;
    [_statusLabel setText:text];
}

- (void)setupView
{
    [self setBackgroundColor:[UIColor clearColor]];
    
    //create the label that will either show "Open" or "Closed"
    _statusBackgroundView = [[UIImageView alloc] initWithFrame:[self bounds]];
    [self addSubview:_statusBackgroundView];
    
    CGRect labelFrame = [self bounds];
    labelFrame.origin.x = 5;
    labelFrame.size.width = labelFrame.size.width - 10;
    labelFrame.origin.y = labelFrame.origin.y - 2;
    _statusLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [_statusLabel setBackgroundColor:[UIColor clearColor]];
    [_statusLabel setTextAlignment:UITextAlignmentCenter];
    [_statusLabel setTextColor:[UIColor whiteColor]];
    [_statusLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Bold"
                                          size:15]];
    [_statusLabel setAdjustsFontSizeToFitWidth:YES];
    [_statusBackgroundView addSubview:_statusLabel];
}


@end
