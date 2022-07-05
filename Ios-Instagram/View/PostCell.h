//
//  PostCell.h
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "Parse/PFImageView.h"

static NSString *cellIdentifier = @"PostCell";

@interface PostCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *authorImage;
@property (weak, nonatomic) IBOutlet UILabel *postedDate;
@property (weak, nonatomic) IBOutlet UILabel *captionField;

@end

