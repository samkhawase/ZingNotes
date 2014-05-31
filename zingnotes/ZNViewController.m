//
//  ZNViewController.m
//  zingnotes
//
//  Created by Sam Khawase on 31/05/14.
//  Copyright (c) 2014 zingnotes Inc. All rights reserved.
//

#import "ZNViewController.h"

@interface ZNViewController ()

@property (weak, nonatomic) IBOutlet UITableView *notesTableView;

@end

@implementation ZNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma TableViewDelegate and TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;   // Placeholder, will be replaced by real count later
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* currentCell = [tableView dequeueReusableCellWithIdentifier:@"CellForNote" forIndexPath:indexPath];
    
    [currentCell.textLabel setText:[NSString stringWithFormat:@"Cell# %d",indexPath.row]];
    
    return currentCell;
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    // nothing at this moment
    [self performSegueWithIdentifier:@"pushSegueToNoteDetails" sender:self];
}

@end
