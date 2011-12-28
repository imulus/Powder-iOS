//
//  FavoriteResortTableViewCell.m
//  Powder
//
//  Created by Bryce Hammond on 12/27/11.
//  Copyright (c) 2011 Imulus, LLC. All rights reserved.
//

#import "FavoriteResortTableViewCell.h"

@implementation FavoriteResortTableViewCell

@synthesize resortNameLabel = _resortNameLabel;
@synthesize openCloseLabel = _openCloseLabel;
@synthesize conditionLabel = _conditionLabel;
@synthesize baseLabel = _baseLabel;
@synthesize addedLabel = _addedLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
