//
//  ImageDetailViewController.m
//  ScrollViews
//
//  Created by Josh Endter on 6/23/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController ()


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIImage *image;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageDetailViewController

- (void)viewDidAppear:(BOOL)animated {
    
    
    
    self.image = [UIImage imageNamed:self.imageName];
    self.imageView.image = self.image;
    //self.imageView.sizeToFit;
    self.imageView.frame = self.scrollView.frame;
    
    
    self.scrollView.contentSize = (CGSize){self.imageView.frame.size.width, self.imageView.frame.size.height};
    
    
}



- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}


@end
