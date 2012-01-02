//
//  PowderSettingsViewController.h
//  Powder
//
//  Created by Bryce Hammond on 12/22/11.
//  Copyright (c) 2011 Imulus, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PowderResortsViewController;

@protocol PowderResortsViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(PowderResortsViewController *)controller;
@end

@interface PowderResortsViewController : UIViewController

@property (weak, nonatomic) IBOutlet id <PowderResortsViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIButton *addRemoveButton;
@property (weak, nonatomic) IBOutlet UILabel *resortNameLabel;

- (IBAction)done:(id)sender;

@end
