//
//  KKScrollView.m
//  NewSideSwiper
//
//  Created by kalyankrishnamurthi on 5/16/13.
//  Copyright (c) 2013 clrvynt. All rights reserved.
//

#import "KKScrollView.h"
#import "KKTransparentView.h"

@implementation KKScrollView

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
    if (self.dragging )
        return YES;
    
    // Get the width of the transparent view if it exists.
    int width = 0;
    for ( UIView *aView in self.subviews ) {
        if ( [aView isKindOfClass:[KKTransparentView class]]) {
            width = aView.frame.size.width;
        }
    }
    
    if ( self.contentOffset.x == 0 && point.x < width)
        return NO;
    return YES;
}


@end
