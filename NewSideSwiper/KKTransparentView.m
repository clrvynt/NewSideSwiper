//
//  KKTransparentView.m
//  NewSideSwiper
//
//  Created by kalyankrishnamurthi on 5/16/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import "KKTransparentView.h"

@implementation KKTransparentView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return NO;
}

@end
