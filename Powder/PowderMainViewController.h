//
//  PowderMainViewController.h
//  Powder
//
//  Created by Bryce Hammond on 12/22/11.
//  Copyright (c) 2011 Imulus, LLC. All rights reserved.
//

#import "PowderResortsViewController.h"

@interface PowderMainViewController : UIViewController <PowderResortsViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
