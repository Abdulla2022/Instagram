//
//  feedViewController.m
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import "feedViewController.h"
#import "Parse/Parse.h"
#import "PostCell.h"
@interface feedViewController ()
@property (strong, nonatomic) NSMutableArray *myArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation feedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
}

- (IBAction)LogOut:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
      
    }];
}

- (IBAction)Post:(id)sender {

//    [self performSegueWithIdentifier:@"composeSegue" sender:nil];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.myArray.count;
}

@end
