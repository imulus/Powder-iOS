//
//  StretchingStatusView.h
//  Powder
//
//  Created by Bryce Hammond on 1/15/12.
//  Copyright (c) 2012 Imulus, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StretchingStatusView : UIView
{
    UILabel *_statusLabel;
    UIImageView *_statusBackgroundView;
}

@property (nonatomic, strong) NSString *text;

- (void)setText:(NSString *)text withMaximumWidth:(NSUInteger)width;
- (void)setupView;


@end
