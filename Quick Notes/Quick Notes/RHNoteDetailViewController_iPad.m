//
//  RHNoteDetailViewController_iPad.m
//  Quick Notes
//
//  Created by David Fisher on 9/12/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import "RHNoteDetailViewController_iPad.h"

@interface RHNoteDetailViewController_iPad ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
@end

@implementation RHNoteDetailViewController_iPad

- (void) setDetailText:(NSString*) detailText {
    self.noteTextView.text = detailText;
    _detailText = detailText;
    
    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }
}


#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    // View just went Portrait.  Be ready with the bar button item.
    barButtonItem.title = @"Notes";
    [self.navBar.topItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // View just went Landscape.  Remove the bar button item.
    [self.navBar.topItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}


@end
