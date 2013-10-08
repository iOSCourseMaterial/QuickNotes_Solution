//
//  RHNoteListViewController_iPad.m
//  MasterDetailNotes
//
//  Created by David Fisher on 10/3/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import "RHNoteListViewController_iPad.h"
#import "RHNoteDetailViewController_iPad.h"

#define kNoteCellIdentifier @"NoteCell"

@interface RHNoteListViewController_iPad ()

@end

@implementation RHNoteListViewController_iPad

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.detailViewController = [[self.splitViewController viewControllers] lastObject];
}

- (NSMutableArray*) notes {
    if (_notes == nil) {
        _notes = [[NSMutableArray alloc] init];
        
        // Hardcode some data for initial testing.
        //_notes = [ @[@"Bob", @"Dave", @"Steve"] mutableCopy];
    }
    return _notes;
}

- (IBAction)pressedAdd:(id)sender {

    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Add a new note"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Add note", nil];

    alert.alertViewStyle = UIAlertViewStylePlainTextInput;

//    [alert setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
//    UITextField* topTextField = [alert textFieldAtIndex:0];
//    UITextField* bottomTextField = [alert textFieldAtIndex:1];
//    topTextField.placeholder = @"Top text goes here";
//    bottomTextField.placeholder = @"Bottom text goes here";
//    [bottomTextField setSecureTextEntry:NO];
    
    [alert show];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.notes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNoteCellIdentifier
                                                            forIndexPath:indexPath];
    
    // Configure the cell...
//    cell.detailTextLabel.text = self.notes[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"%d. ", indexPath.row];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.notes[indexPath.row];
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.notes removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}




// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    // Save a temp variable of the one moving
    NSString* temp = self.notes[fromIndexPath.row];
    // Delete it
    [self.notes removeObjectAtIndex:fromIndexPath.row];
    // Reinsert it
    [self.notes insertObject:temp atIndex:toIndexPath.row];
    
}




- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    self.detailViewController.noteText = self.notes[indexPath.row];

}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


#pragma mark - UIAlertViewDelegate methods

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//    NSLog(@"You clicked the button with index %d", buttonIndex);
    
    NSString* newNoteText = [[alertView textFieldAtIndex:0] text];

    [self.notes addObject:newNoteText];
//    [self.tableView reloadData];

    NSIndexPath* newIndexPath = [NSIndexPath indexPathForRow:(self.notes.count - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}

@end



