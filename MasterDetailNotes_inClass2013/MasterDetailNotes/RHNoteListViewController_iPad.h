//
//  RHNoteListViewController_iPad.h
//  MasterDetailNotes
//
//  Created by David Fisher on 10/3/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RHNoteDetailViewController_iPad;

@interface RHNoteListViewController_iPad : UITableViewController

@property (nonatomic, strong) NSMutableArray* notes;

@property (nonatomic, weak) RHNoteDetailViewController_iPad* detailViewController;

@end
