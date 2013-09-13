//
//  RHNotesViewController_iPad.h
//  Quick Notes
//
//  Created by David Fisher on 9/12/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RHNoteDetailViewController_iPad;

@interface RHNotesViewController_iPad : UITableViewController <UIAlertViewDelegate>

@property (nonatomic, strong) NSMutableArray* notesArray;
@property (nonatomic, strong) RHNoteDetailViewController_iPad* detailViewController;
- (IBAction)pressedAdd:(id)sender;

@end
