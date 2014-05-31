//
//  ZNViewController.m
//  zingnotes
//
//  Created by Sam Khawase on 31/05/14.
//  Copyright (c) 2014 zingnotes Inc. All rights reserved.
//

#import "ZNViewController.h"
#import "ZNDataService.h"
#import "ZNNote.h"
#import "ZNNoteDetailsViewController.h"

@interface ZNViewController ()

@property (weak, nonatomic) IBOutlet UITableView *notesTableView;
@property (strong, nonatomic) NSMutableArray* notesOnThisPage;
@property (strong, nonatomic) ZNNote* selectedNote;
@end

@implementation ZNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.notesOnThisPage = [[[ZNDataService sharedInstance] retriveAllNotes] mutableCopy];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"pushSegueToNoteDetails"]) {
        ZNNoteDetailsViewController* destinationVC = (ZNNoteDetailsViewController*)segue.destinationViewController;
        destinationVC.noteForThisPage = self.selectedNote;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableViewDelegate and TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.notesOnThisPage count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* currentCell = [tableView dequeueReusableCellWithIdentifier:@"CellForNote" forIndexPath:indexPath];
    
    ZNNote* thisNote = [self.notesOnThisPage objectAtIndex:indexPath.row];
    
    [currentCell.textLabel setText:[NSString stringWithFormat:@"Note# %@",[thisNote.noteId stringValue]]];
    
    return currentCell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    self.selectedNote = [self.notesOnThisPage objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"pushSegueToNoteDetails" sender:self];
}

@end
