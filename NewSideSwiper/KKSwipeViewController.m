//
//  KKSwipeViewController.m
//  NewSideSwiper
//
//  Created by kalyankrishnamurthi on 5/16/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import "KKSwipeViewController.h"

#define LEFT_VIEW_WIDTH 280
#define MAIN_VIEW_WIDTH 320

@interface KKSwipeViewController ()

@end

@implementation KKSwipeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        buttonView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        buttonView.backgroundColor = [UIColor clearColor];
        
        UIButton *aButton = [UIButton buttonWithType:UIButtonTypeCustom];
        aButton.frame = CGRectMake(10, 2, 25, 25);
        [aButton addTarget:self action:@selector(listClicked:) forControlEvents:UIControlEventTouchUpInside];
        [aButton setImage:[UIImage imageNamed:@"swipelist.png"] forState:UIControlStateNormal];
        [aButton addTarget:self action:@selector(buttonTouched:) forControlEvents:UIControlEventTouchDown];
        
        [buttonView addSubview:aButton];
        
        _leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:buttonView];
        tapper = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(navViewClicked:)];
        [tapper setNumberOfTapsRequired:1];
        
        imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"whiteglow.png"]];
        imgView.frame = CGRectMake(0, 0, 50, 30);
        imgView.contentMode = UIViewContentModeScaleAspectFill;

    }
    return self;
}

-(void)buttonTouched:(id)sender
{
    [buttonView addSubview:imgView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setViewControllerItems:(NSArray *)viewControllerItems
{
    _viewControllerItems = viewControllerItems;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    _leftController = [[KKLeftViewController alloc] initWithViewControllers:_viewControllerItems];
    _leftController.view.frame = CGRectMake(0, 0, LEFT_VIEW_WIDTH, self.view.frame.size.height);
    _leftController.delegate = self;
    
    // Add left controller to the bottom
    [self.view addSubview:_leftController.view];
    
    _scrollView = [[KKScrollView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(LEFT_VIEW_WIDTH + MAIN_VIEW_WIDTH, self.view.frame.size.height);
    
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    // Add transparent uiview
    _transparentView = [[KKTransparentView alloc] initWithFrame:_leftController.view.frame];
    _transparentView.backgroundColor = [UIColor clearColor];
    
    [_scrollView addSubview:_transparentView];
    [self.view addSubview:_scrollView];
    
    _navController = [[UINavigationController alloc] init];
    [self setRootControllerForNavigation:[_viewControllerItems objectAtIndex:0]];
    
    _navController.view.frame = CGRectMake(_leftController.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [_scrollView addSubview:_navController.view];
    
    _scrollView.contentOffset = CGPointMake(_leftController.view.frame.size.width, 0);
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

-(void)listClicked:(id)sender
{
    [imgView removeFromSuperview];
    listControlUsed = YES;
    if ( _scrollView.contentOffset.x != 0 )
        [_scrollView setContentOffset:CGPointMake(0, 0) animated:YES];
    else
        [_scrollView setContentOffset:CGPointMake(_leftController.view.frame.size.width, 0) animated:YES];
    
}

-(void)navViewClicked:(id)sender
{
    [_scrollView setContentOffset:CGPointMake(_leftController.view.frame.size.width, 0) animated:YES];
}

-(void)selectedItemForRowNumber:(int)rowNumber
{
    // Restore swiped out view
    [_scrollView setContentOffset:CGPointMake(_leftController.view.frame.size.width, 0) animated:YES];
    [self setRootControllerForNavigation:[_viewControllerItems objectAtIndex:rowNumber]];
}

-(void)setRootControllerForNavigation:(UIViewController *)viewController
{
    [_navController setViewControllers:[NSArray arrayWithObject:viewController]];
    [_navController topViewController].navigationItem.leftBarButtonItem = _leftBarButtonItem;
}

#pragma scrollview 
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    listControlUsed = NO;
    if ( scrollView.contentOffset.x == 0)
    {
        [_navController.view setUserInteractionEnabled:NO];
        [_scrollView addGestureRecognizer:tapper];
    }
    else {
        [_navController.view setUserInteractionEnabled:YES];
        [_scrollView removeGestureRecognizer:tapper];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ( listControlUsed )
        return;
    if ( scrollView.contentOffset.x == 0)
    {
        [_navController.view setUserInteractionEnabled:NO];
        [_scrollView addGestureRecognizer:tapper];
    }
    else {
        [_navController.view setUserInteractionEnabled:YES];
        [_scrollView removeGestureRecognizer:tapper];
    }
}

@end
