//
//  KKBaseViewController.h
//  NewSideSwiper
//
//  Created by kalyankrishnamurthi on 5/16/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KKBaseViewController : UIViewController

@property (nonatomic, strong) UIImage *rowImage;
@property (nonatomic, strong) NSString *rowTitle;

-(id)initWithRowImage:(UIImage *)image andTitle:(NSString *)title;

@end
