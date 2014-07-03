//
//  ZNNoteDetailsViewController.m
//  zingnotes
//
//  Created by Sam Khawase on 31/05/14.
//  Copyright (c) 2014 zingnotes Inc. All rights reserved.
//

#import "ZNNoteDetailsViewController.h"

@interface ZNNoteDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *NoteIdLabel;

//@property (weak, nonatomic) IBOutlet UILabel *noteDataLabel;

@property (weak, nonatomic) IBOutlet UITextView *noteDataTextView;

@end

@implementation ZNNoteDetailsViewController

- (ZNNote *)noteForThisPage{
    if (nil == _noteForThisPage) {
        _noteForThisPage = [[ZNNote alloc] init];
    }
    return _noteForThisPage;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated{
    
    [self.NoteIdLabel setText:[self.noteForThisPage.noteId stringValue]];;
    [self.noteDataTextView sizeToFit];
    self.noteDataTextView.textAlignment = NSTextAlignmentLeft;
    [self.noteDataTextView setText:self.noteForThisPage.noteText];
    self.noteDataTextView.editable = NO;
    self.noteDataTextView.dataDetectorTypes = UIDataDetectorTypeLink;
    
    UITapGestureRecognizer *listener = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.noteDataTextView addGestureRecognizer:listener];
   
}

- (void)tapAction:(UITapGestureRecognizer *)sender{
    NSLog(@"tapped at %@", [sender class]);
}

- (IBAction)navigateBack:(id)sender {
    NSLog(@"Navigating back to master page");
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)saveNoteAction:(id)sender {
    
    // TODO: save notes to data store
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
