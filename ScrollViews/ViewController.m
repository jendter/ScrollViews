//
//  ViewController.m
//  ScrollViews
//
//  Created by Josh Endter on 6/23/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "ViewController.h"

#import "ImageDetailViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) UIView *rootScrollView;
@property (strong, nonatomic) NSArray *imageNames;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //[self.navigationController setNavigationBarHidden:YES animated:NO];
    
    
}

- (void)viewDidLayoutSubviews {
    //[super viewDidLayoutSubviews];
    
    //NSLog(@"The scroll view starts out as origin y: %f", self.scrollView.frame.origin.y);
    //NSLog(@"The scroll view starts out as origin y: %f", self.scrollView.frame.origin.y);
    
    self.rootScrollView = [[UIView alloc] init];
    [self.scrollView addSubview:self.rootScrollView];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(handleImageTap:)];
    //tapRecognizer.delegate = self;
    [self.scrollView addGestureRecognizer:tapRecognizer];
    
    self.imageNames = @[@"Lighthouse-in-Field", @"Lighthouse-night", @"Lighthouse-zoomed"];
    
    int xPosition = 0;
    
    for (NSString *imageName in self.imageNames) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:(CGRect){xPosition,0,self.scrollView.frame.size.width, self.scrollView.frame.size.height}];
        //NSLog(@"Image Frame height:%f", imageView.frame.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *image = [UIImage imageNamed:imageName];
        imageView.image = image;
        [self.rootScrollView addSubview:imageView];
        xPosition = xPosition + self.scrollView.frame.size.width;
        
    }
    
    self.scrollView.contentSize = (CGSize){xPosition, self.scrollView.frame.size.height};
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handleImageTap:(UITapGestureRecognizer *)recognizer{
    [self performSegueWithIdentifier:@"showImageDetailView" sender:recognizer.view];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqual:@"showImageDetailView"]) {
        UIScrollView *scrollView = (UIScrollView *)sender;
        NSLog(@"Recognizer X:%f, Recognizer Y:%f", scrollView.contentOffset.x, scrollView.contentOffset.y);
        
        int imageNum = scrollView.contentOffset.x / scrollView.frame.size.width;
        
        NSLog(@"Image num: %d", imageNum);
        
        ImageDetailViewController *imageDetail = (ImageDetailViewController *)segue.destinationViewController;
        
        imageDetail.imageName = self.imageNames[imageNum];
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"ended scrolling");
    
    int imageNum = scrollView.contentOffset.x/ scrollView.frame.size.width;
    
    self.pageControl.currentPage = imageNum;
    
    
    NSLog(@"Scroll Frame height:%f", self.scrollView.frame.size.height);
    //imageDetail.imageName = self.imageNames[imageNum];

    
}



@end
