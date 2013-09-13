//
//  RHNotesViewController.m
//  Quick Notes
//
//  Created by David Fisher on 9/12/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import "RHNotesViewController.h"
#import "RHNoteDetailViewController.h"

#define kNoteDetailSeque @"NoteDetailSeque"

@interface RHNotesViewController ()

@end

@implementation RHNotesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (NSMutableArray*) notesArray {
    if (_notesArray == nil) {
        _notesArray = [@[@"Do homework", @"Get more sleep", @"Have Fun"] mutableCopy];
    }
    return _notesArray;
}

- (IBAction)pressedAdd:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Add a note"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Add", nil];
    [alert setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alert show];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.notesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *NotesCellIdentifier = @"NoteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NotesCellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = self.notesArray[indexPath.row];
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.notesArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{   
    NSString *stringToMove = [self.notesArray objectAtIndex:fromIndexPath.row];
    [self.notesArray removeObjectAtIndex:fromIndexPath.row];
    [self.notesArray insertObject:stringToMove atIndex:toIndexPath.row];
    
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:kNoteDetailSeque sender:self.notesArray[indexPath.row]];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kNoteDetailSeque]) {
        RHNoteDetailViewController* destination = segue.destinationViewController;
        destination.displayText = sender;
    }
}

#pragma mark - Alert view delegate

- (void) alertView:(UIAlertView*) alertView didDismissWithButtonIndex:(NSInteger) buttonIndex {
    if (buttonIndex != alertView.cancelButtonIndex) {
        NSString* noteText = [[alertView textFieldAtIndex:0] text];
        [self.notesArray addObject:noteText];
        NSIndexPath* newRow = [NSIndexPath indexPathForRow:(self.notesArray.count-1) inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[newRow] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

@end
