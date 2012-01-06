//
//  FavoriteResortTableViewCell.h
//  Powder
//
//  Created by Bryce Hammond on 12/27/11.
//  Copyright (c) 2011 Imulus, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Resort.h"
#import "Favorite.h"

@interface FavoriteResortTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *resortNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *openCloseLabel;
@property (weak, nonatomic) IBOutlet UILabel *conditionLabel;
@property (weak, nonatomic) IBOutlet UILabel *baseLabel;
@property (weak, nonatomic) IBOutlet UILabel *addedLabel;
@property (strong, nonatomic) Favorite *favorite;
@property (strong, nonatomic) Resort *resort;

@end
