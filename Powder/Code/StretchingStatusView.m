//
//  StretchingStatusView.m
//  Powder
//
//  Created by Bryce Hammond on 1/15/12.
//  Copyright (c) 2012 Imulus, LLC. All rights reserved.
//

#import "StretchingStatusView.h"

@implementation StretchingStatusView

#define kHorizontalPadding 10

@synthesize text = _text;

static UIFont *s_statusLabelFont;

+ (void)initialize
{
    s_statusLabelFont = [UIFont fontWithName:@"HelveticaNeue-Bold"
                                        size:15];
}

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
    [self setText:text withMaximumWidth:INT_MAX];
}

- (void)setText:(NSString *)text withMaximumWidth:(NSUInteger)width
{
    _text = text;
    
    NSUInteger maxLabelWidth = width - (2 * kHorizontalPadding);
    
    //get the size of the string with our font
    CGFloat calculatedWidth = [text sizeWithFont:s_statusLabelFont].width;
    
    //set the frame to the appropriate width based on
    //what they want as the max width
    CGRect labelFrame = _statusLabel.frame;
    labelFrame.size.width = MIN(maxLabelWidth, calculatedWidth);
    
    [_statusLabel setFrame:labelFrame];
    
    //adjust our own bounds to fix the label
    CGRect frame = [self frame];
    frame.size.width = _statusLabel.frame.size.width + (2 * kHorizontalPadding);
    self.frame = frame;
    _statusBackgroundView.frame = self.bounds;
    
    //now set the text in the label
    [_statusLabel setText:text];
}

- (void)setupView
{
    [self setBackgroundColor:[UIColor clearColor]];
    
    //create the label that will either show "Open" or "Closed"
    _statusBackgroundView = [[UIImageView alloc] initWithFrame:[self bounds]];
    [self addSubview:_statusBackgroundView];
    
    CGRect labelFrame = [self bounds];
    labelFrame.origin.x = kHorizontalPadding;
    labelFrame.size.width = labelFrame.size.width - (kHorizontalPadding * 2);
    labelFrame.origin.y = labelFrame.origin.y - 2;
    _statusLabel = [[UILabel alloc] initWithFrame:labelFrame];
    [_statusLabel setBackgroundColor:[UIColor clearColor]];
    [_statusLabel setTextAlignment:UITextAlignmentCenter];
    [_statusLabel setTextColor:[UIColor whiteColor]];
    [_statusLabel setFont:s_statusLabelFont];
    [_statusLabel setAdjustsFontSizeToFitWidth:YES];
    [_statusBackgroundView addSubview:_statusLabel];
}


@end
