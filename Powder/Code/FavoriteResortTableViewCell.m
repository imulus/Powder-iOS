//
//  FavoriteResortTableViewCell.m
//  Powder
//
//  Created by Bryce Hammond on 12/27/11.
//  Copyright (c) 2011 Imulus, LLC. All rights reserved.
//

#import "FavoriteResortTableViewCell.h"

@interface FavoriteResortTableViewCell()

- (void)setupCell;

@end

@implementation FavoriteResortTableViewCell

@synthesize resortNameLabel = _resortNameLabel;
@synthesize openCloseLabel = _openCloseLabel;
@synthesize conditionLabel = _conditionLabel;
@synthesize baseLabel = _baseLabel;
@synthesize addedLabel = _addedLabel;
@synthesize resort = _resort;
@synthesize favorite = _favorite;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setupCell];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupCell];
}

- (void)setupCell
{
    self.conditionLabel.text = @"";
    self.baseLabel.text = @"";
    self.addedLabel.text = @"";
    UIImageView *gradientBackgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
    [gradientBackgroundView setImage:[UIImage imageNamed:@"subtle-gradient.png"]];
    self.backgroundView = gradientBackgroundView;
}

- (void)setFavorite:(Favorite *)favorite
{
    _favorite = favorite;
    
    self.resortNameLabel.text = favorite.resortName;

}

- (void)setResort:(Resort *)resort
{
    _resort = resort;
    
    if(nil != resort)
    {
    
        //update all of our labels
        self.resortNameLabel.text = resort.name;
        
        if(YES == resort.isOpen)
        {
            self.openCloseLabel.text = @"OPEN";
            self.openCloseLabel.backgroundColor = [UIColor greenColor];
        }
        else
        {
            self.openCloseLabel.text = @"CLOSED";
            self.openCloseLabel.backgroundColor = [UIColor redColor];
        }
        
        self.conditionLabel.text = resort.currentConditions;
        self.baseLabel.text =  [NSString stringWithFormat:@"%i%@", resort.totalSnowAmount, resort.totalSnowMetricSymbol];
        
        self.addedLabel.text = [NSString stringWithFormat:@"%i%@", resort.todaysSnowAmount, resort.todaysSnowMetricSymbol];
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
