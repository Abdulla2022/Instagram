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
#import "DetailsViewController.h"

@interface FeedViewController ()
@property (strong, nonatomic) NSMutableArray *listOfPost;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation FeedViewController

NSInteger *maxNumberOfPosts = 20;

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
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:@"LoginHome"];
    self.view.window.rootViewController = tabBarController;
}

-(void) getPosts {
    PFQuery *postQuery = [PFQuery queryWithClassName:@"Post"];
    [postQuery orderByDescending:@"createdAt"];
    [postQuery includeKey:@"author"];
    postQuery.limit = maxNumberOfPosts;
    
    [postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> * _Nullable posts, NSError * _Nullable error) {
        if (posts) {
            self.listOfPost = (NSMutableArray *)posts;
            [self.tableView reloadData];
            return;
        }
        NSLog(@"😫😫😫 Error getting Feed: %@", error.localizedDescription);
    }];
}

- (IBAction)Post:(id)sender {
    [self performSegueWithIdentifier:@"composeSegue" sender:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.listOfPost.count;
}

- (void)beginRefresh:(UIRefreshControl *)refreshControl {
    [self getPosts];
    [self.tableView reloadData];
    [refreshControl endRefreshing];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PostCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PostCell"];
    Post *post = self.listOfPost[indexPath.row];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:post.image.url]];
    cell.authorImage.image = [UIImage imageWithData:imageData];
    cell.captionField.text = post.caption;
    
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = NSDateFormatterShortStyle;
    NSString *dateString = [formatter stringFromDate:post.createdAt];
    cell.postedDate.text = dateString;
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"detailsSegue"]) {
        PostCell *cell = sender;
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        Post *post = self.listOfPost[indexPath.row];
        
        UINavigationController *navVC = segue.destinationViewController;
        
        DetailsViewController *detailsVC = navVC.topViewController;
        detailsVC.post = post;
    }
}

@end
