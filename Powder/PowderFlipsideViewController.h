//
//  PowderFlipsideViewController.h
//  Powder
//
//  Created by Bryce Hammond on 12/22/11.
//  Copyright (c) 2011 Imulus, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PowderFlipsideViewController;

@protocol PowderFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(PowderFlipsideViewController *)controller;
@end

@interface PowderFlipsideViewController : UIViewController

@property (weak, nonatomic) IBOutlet id <PowderFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
