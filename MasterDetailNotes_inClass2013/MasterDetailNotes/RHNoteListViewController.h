//
//  RHNoteListViewController.h
//  MasterDetailNotes
//
//  Created by David Fisher on 9/30/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHNoteListViewController : UITableViewController <UIAlertViewDelegate>


@property (nonatomic, strong) NSMutableArray* notes;

- (IBAction)pressedAdd:(id)sender;


@end
