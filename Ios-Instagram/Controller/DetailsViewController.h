//
//  DetailsViewController.h
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/29/22.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImage;
@property (weak, nonatomic) IBOutlet UILabel *postedDate;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;
@property (weak, nonatomic) IBOutlet UILabel *postCaption;

@end

NS_ASSUME_NONNULL_END
