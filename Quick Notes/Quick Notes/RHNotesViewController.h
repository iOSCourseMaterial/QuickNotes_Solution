//
//  RHNotesViewController.h
//  Quick Notes
//
//  Created by David Fisher on 9/12/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHNotesViewController : UITableViewController <UIAlertViewDelegate>

@property (nonatomic, strong) NSMutableArray* notesArray;
- (IBAction)pressedAdd:(id)sender;

@end
