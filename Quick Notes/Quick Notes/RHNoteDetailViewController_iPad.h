//
//  RHNoteDetailViewController_iPad.h
//  Quick Notes
//
//  Created by David Fisher on 9/12/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHNoteDetailViewController_iPad : UIViewController <UISplitViewControllerDelegate>

@property (nonatomic, copy) NSString* detailText;
@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navBar;

@end
