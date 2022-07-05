//
//  DetailsViewController.m
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/29/22.
//

#import "DetailsViewController.h"
#import "Parse/Parse.h"
#import "PostCell.h"
#import "Post.h"
@interface DetailsViewController ()

@end

@implementation DetailsViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:self.post.image.url]];
    self.postImage.image = [UIImage imageWithData:imageData];
    self.postCaption.text = self.post.caption;
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = NSDateFormatterShortStyle;
    NSString *dateString = [formatter stringFromDate:self.post.createdAt];
    self.postedDate.text = dateString;
}

- (IBAction)DidTapBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
