//
//  RHNoteDetailViewController.h
//  Quick Notes
//
//  Created by David Fisher on 9/12/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RHNoteDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *noteTextView;
@property (nonatomic, copy) NSString* displayText;
@end
