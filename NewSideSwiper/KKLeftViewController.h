//
//  KKLeftViewController.h
//  NewSideSwiper
//
//  Created by kalyankrishnamurthi on 5/16/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KKLeftViewControllerDelegate <NSObject>

@optional
-(void)selectedItemForRowNumber:(int)rowNumber;
@end

@interface KKLeftViewController : UITableViewController
{
    NSArray *_viewControllers;
    int _selectedIndex;
}

@property (nonatomic, weak) id<KKLeftViewControllerDelegate> delegate;
-(id)initWithViewControllers:(NSArray *)viewControllers;

@end
