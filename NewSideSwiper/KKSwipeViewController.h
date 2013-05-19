//
//  KKSwipeViewController.h
//  NewSideSwiper
//
//  Created by kalyankrishnamurthi on 5/16/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KKLeftViewController.h"
#import "KKScrollView.h"
#import "KKTransparentView.h"

@interface KKSwipeViewController : UIViewController <KKLeftViewControllerDelegate, UIScrollViewDelegate>
{
    NSArray *_viewControllerItems;
    KKLeftViewController *_leftController;
    KKScrollView *_scrollView;
    KKTransparentView *_transparentView;
    UINavigationController *_navController;
    UIBarButtonItem *_leftBarButtonItem;
    UITapGestureRecognizer *tapper;
    BOOL listControlUsed;
    UIView *buttonView;
    UIImageView *imgView;
}

-(void)setViewControllerItems:(NSArray *)viewControllerItems;

@end
