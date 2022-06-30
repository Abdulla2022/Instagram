//
//  ComposeViewController.m
//  Ios-Instagram
//
//  Created by Abdullahi Ahmed on 6/28/22.
//

#import "ComposeViewController.h"
#import "Parse/Parse.h"
#import "PostCell.h"
#import "Post.h"
@interface ComposeViewController ()

@end

@implementation ComposeViewController

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    [self.postImage setImage:editedImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapShare:(id)sender {
    [Post postUserImage: self.postImage.image withCaption:self.postCaption.text withCompletion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)openCamera:(id)sender {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];
    imagePickerVC.delegate = self;
    imagePickerVC.allowsEditing = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePickerVC.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    NSLog(@"Camera 🚫 available so we will use photo library instead");
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:imagePickerVC animated:YES completion:nil];
}

@end
