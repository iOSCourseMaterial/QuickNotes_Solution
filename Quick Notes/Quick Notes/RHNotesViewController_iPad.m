//
//  RHNotesViewController_iPad.m
//  Quick Notes
//
//  Created by David Fisher on 9/12/13.
//  Copyright (c) 2013 Rose-Hulman. All rights reserved.
//

#import "RHNotesViewController_iPad.h"
#import "RHNoteDetailViewController_iPad.h"

@interface RHNotesViewController_iPad ()

@end

@implementation RHNotesViewController_iPad

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.detailViewController = [self.splitViewController.viewControllers lastObject];
}

- (NSMutableArray*) notesArray {
    if (_notesArray == nil) {
        _notesArray = [@[@"Do homework", @"Get more sleep", @"Learn iOS"] mutableCopy];
    }
    return _notesArray;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.notesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NoteCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
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
    self.detailViewController.detailText = self.notesArray[indexPath.row];
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
