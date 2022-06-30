//
//  ComposeViewController.h
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "PostCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface ComposeViewController : UIViewController < UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *postCaption;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;

@end

NS_ASSUME_NONNULL_END
