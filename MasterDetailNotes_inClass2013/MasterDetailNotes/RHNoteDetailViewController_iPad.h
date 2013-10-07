//
//  RHNoteDetailViewController_iPad.h
//  MasterDetailNotes
//
//  Created by David Fisher on 10/3/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHNoteDetailViewController_iPad : UIViewController <UISplitViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (nonatomic, strong) NSString* noteText;

@end
