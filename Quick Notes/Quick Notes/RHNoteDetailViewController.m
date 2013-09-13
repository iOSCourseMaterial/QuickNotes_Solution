//
//  RHNoteDetailViewController.m
//  Quick Notes
//
//  Created by David Fisher on 9/12/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import "RHNoteDetailViewController.h"

@interface RHNoteDetailViewController ()

@end

@implementation RHNoteDetailViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
    self.noteTextView.text = self.displayText;
}

@end
