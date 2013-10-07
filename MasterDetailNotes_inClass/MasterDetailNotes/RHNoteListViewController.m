//
//  RHNoteListViewController.m
//  MasterDetailNotes
//
//  Created by David Fisher on 9/30/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import "RHNoteListViewController.h"
#import "RHNoteDetailViewController.h"

#define kNoteCellIdentifier @"NoteCell"
#define kNoteDetailSegue @"NoteDetailSegue"

@interface RHNoteListViewController ()

@end

@implementation RHNoteListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (IBAction)pressedAdd:(id)sender {
    // Launch a UI element to let the user add their note
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Add a note"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Add note", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

- (NSMutableArray*) notes {
    if (_notes == nil) {
        // Setup a NEW notes mutable array.
        _notes = [[NSMutableArray alloc] init];
        
        // For testing only let's put in some data
//        _notes = [@[ @"Bob", @"Dave", @"Steve", @"Bob", @"Dave", @"Steve"] mutableCopy];
    }
    return _notes;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return self.notes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNoteCellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.notes[indexPath.row];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.notes removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    // Save a temporary copy of the data
    NSString* tempString = self.notes[fromIndexPath.row];
    
    // Delete the data from the array
    [self.notes removeObjectAtIndex:fromIndexPath.row];
    
    // Insert the temporary copy back into the array (at the new spot)
    [self.notes insertObject:tempString atIndex:toIndexPath.row];
    
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self performSegueWithIdentifier:kNoteDetailSegue sender:self.notes[indexPath.row]];
    
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:kNoteDetailSegue]) {
        NSString* stringWeWantToPass = (NSString*) sender;
        RHNoteDetailViewController* destination = segue.destinationViewController;
        destination.noteText = stringWeWantToPass;
    }
}



#pragma mark - UIAlertViewDelegate methods

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex != alertView.cancelButtonIndex) {
        NSString* textInTextField = [[alertView textFieldAtIndex:0] text];
        [self.notes addObject:textInTextField];
        NSIndexPath* newIndexPath = [NSIndexPath indexPathForRow:(self.notes.count - 1) inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    } else {
        NSLog(@"You pressed cancel. Do nothing");
    }
}


@end









