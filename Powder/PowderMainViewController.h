//
//  PowderMainViewController.h
//  Powder
//
//  Created by Bryce Hammond on 12/22/11.
//  Copyright (c) 2011 Imulus, LLC. All rights reserved.
//

#import "PowderFlipsideViewController.h"

@interface PowderMainViewController : UIViewController <PowderFlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
