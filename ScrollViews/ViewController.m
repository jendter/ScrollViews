//
//  ViewController.m
//  ScrollViews
//
//  Created by Josh Endter on 6/23/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIView *rootScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.rootScrollView = [[UIView alloc] init];
    [self.scrollView addSubview:self.rootScrollView];
    
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSArray *imageNames = @[@"Lighthouse-in-Field", @"Lighthouse-night", @"Lighthouse-zoomed"];
    
    int xPosition = 0;
    
    for (NSString *imageName in imageNames) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){xPosition,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height}];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *image = [UIImage imageNamed:imageName];
        imageView.image = image;
        [self.rootScrollView addSubview:imageView];
        xPosition = xPosition + self.scrollView.frame.size.width;
    }
    
    
    
    //    int xPosition = 0;
    //
    //    for (NSString *imageName in imageNames) {
    //        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){xPosition,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height}];
    //        UIImage *image = [UIImage imageNamed:imageName];
    //        imageView.image = image;
    //        [self.scrollView addSubview:imageView];
    //        xPosition = xPosition + self.scrollView.frame.size.width;
    //    }
    
    self.scrollView.contentSize = (CGSize){xPosition, self.scrollView.frame.size.height};
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
