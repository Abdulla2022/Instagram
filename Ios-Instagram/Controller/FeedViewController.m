//
//  feedViewController.m
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import "FeedViewController.h"
#import "Parse/Parse.h"
#import "PostCell.h"
#import "Post.h"
//#import "Datetool.h"
@interface FeedViewController ()
@property (strong, nonatomic) NSMutableArray *myArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.tableView insertSubview:refreshControl atIndex:0];
    [self getPosts];
}

- (IBAction)LogOut:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
    }];
}

-(void) getPosts {
    PFQuery *postQuery = [PFQuery queryWithClassName:@"Post"];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = 20;
    
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            self.myArray = (NSMutableArray *)posts;
            [self.tableView reloadData];
        }
        NSLog(@"😫😫😫 Error getting Feed: %@", error.localizedDescription);
    }];
}

- (IBAction)Post:(id)sender {
    [self performSegueWithIdentifier:@"composeSegue" sender:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myArray.count;
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    [self getPosts];
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    Post *post = self.myArray[indexPath.row];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:post.image.url]];
    cell.authorImage.image = [UIImage imageWithData:imageData];
    cell.captionField.text = post.caption;
    return cell;
}

@end
