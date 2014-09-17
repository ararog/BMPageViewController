//
//  BMPageViewControllerExample.m
//  BMPageViewController
//
//  Created by Rogério Pereira Araújo on 17/09/14.
//  Copyright (c) 2014 Rogério Pereira Araújo. All rights reserved.
//

#import "BMPageViewControllerExample.h"

@interface BMPageViewControllerExample ()

@end

@implementation BMPageViewControllerExample

+ (void)initialize {
    if (self == BMPageViewControllerExample.class) {
        UIPageControl *pageControl = UIPageControl.appearance;
        pageControl.pageIndicatorTintColor = UIColor.blackColor;
        pageControl.currentPageIndicatorTintColor = UIColor.redColor;
    }
}

- (NSArray *)pageIdentifiers {
    return @[@"page1", @"page2", @"page3", @"page4"];
}


@end
