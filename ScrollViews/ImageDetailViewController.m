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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.image = [UIImage imageNamed:self.imageName];
    self.imageView.image = self.image;
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    float zoom = self.scrollView.frame.size.width / self.image.size.width;
    NSLog(@"Zoom = %f", zoom);
    
    if (self.image.size.width > self.image.size.height){
        [self.scrollView zoomToRect:(CGRect){0, 0, self.image.size.width, self.image.size.height*zoom} animated:NO];
        self.scrollView.minimumZoomScale = zoom;
    } else {
        [self.scrollView zoomToRect:(CGRect){0, 0, self.image.size.width*zoom, self.image.size.height} animated:NO];
        zoom = self.scrollView.frame.size.height / self.image.size.height;
        self.scrollView.minimumZoomScale = zoom;
    }
    
  
}



- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}



@end
