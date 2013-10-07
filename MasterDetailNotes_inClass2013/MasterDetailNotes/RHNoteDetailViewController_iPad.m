//
//  RHNoteDetailViewController_iPad.m
//  MasterDetailNotes
//
//  Created by David Fisher on 10/3/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import "RHNoteDetailViewController_iPad.h"

@interface RHNoteDetailViewController_iPad ()
@property (nonatomic, strong) UIPopoverController* popoverControllerOfList;
@end

@implementation RHNoteDetailViewController_iPad

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) setNoteText:(NSString *)noteText {
    _noteText = noteText;
    self.noteTextView.text = noteText;
    
    if (self.popoverControllerOfList != nil) {
        [self.popoverControllerOfList dismissPopoverAnimated:YES];
    }
    
}


#pragma mark - UISplitViewControllerDelegate methods 

// Called when a button should be added to a toolbar for a hidden view controller.
// Implementing this method allows the hidden view controller to be presented via a swipe gesture if 'presentsWithGesture' is 'YES' (the default).
- (void)splitViewController:(UISplitViewController *)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)pc {
    
    //NSLog(@"TODO: We just went into portrait add the button for the popover");
    
    barButtonItem.title = @"Notes";
    [self.navBar.topItem setLeftBarButtonItem:barButtonItem];
    
    self.popoverControllerOfList = pc;
}

// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController:(UISplitViewController *)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    
    //NSLog(@"TODO: We just went into landscape remove the button for the popover");

    [self.navBar.topItem setLeftBarButtonItem:nil];
    
    self.popoverControllerOfList = nil;
}

@end






