//
//  KKBaseViewController.m
//  NewSideSwiper
//
//  Created by kalyankrishnamurthi on 5/16/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import "KKBaseViewController.h"

@interface KKBaseViewController ()

@end

@implementation KKBaseViewController

@synthesize rowImage = _rowImage, rowTitle = _rowTitle;

-(id)initWithRowImage:(UIImage *)image andTitle:(NSString *)rowTitle
{
    self = [super init];
    if ( self ) {
        _rowTitle = rowTitle;
        _rowImage = image;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
