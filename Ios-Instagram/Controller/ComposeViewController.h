//
//  ComposeViewController.h
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import <UIKit/UIKit.h>
#import "PostCell.h"

@interface ComposeViewController : UIViewController < UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *postCaption;
@property (weak, nonatomic) IBOutlet UIImageView *postImage;

@end
