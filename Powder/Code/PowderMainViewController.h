//
//  PowderMainViewController.h
//  Powder
//
//  Created by Bryce Hammond on 12/22/11.
//  Copyright (c) 2011 Imulus, LLC. All rights reserved.
//

#import "PowderResortsViewController.h"
#import "PowderAPI.h"

@interface PowderMainViewController : UIViewController
<
    PowderResortsViewControllerDelegate,
    PowderAPIDelegate,
    UITableViewDelegate,
    UITableViewDataSource,
    UIPopoverControllerDelegate
>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;
@property (strong, nonatomic) NSArray *favorites;

@end
