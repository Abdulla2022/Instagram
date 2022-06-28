//
//  feedViewController.h
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface feedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *authorImage;
@property (weak, nonatomic) IBOutlet UILabel *postedDate;
@property (weak, nonatomic) IBOutlet UILabel *captionField;

@end

NS_ASSUME_NONNULL_END
