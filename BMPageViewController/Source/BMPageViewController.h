//
//  BMPageViewController.h
//  BMPageViewController
//
//  Created by Nacho Soto on 2/16/14.
//  Copyright (c) 2014 MindSnacks. All rights reserved.
//
//  Modified by Rogerio Araujo on 9/17/14.
//  Copyright (c) 2014 BMobile. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 * This controller is only meant to be used inside of a storyboard.
 * @see `BMPageViewController+Protected.h` for subclassing notes.
 */
@interface BMPageViewController : UIPageViewController

@property (nonatomic) NSInteger currentPage;

- (void)changePage:(NSInteger)page;

@end

@protocol BMPageViewControllerChild <NSObject>

@property (nonatomic) NSInteger pageIndex;

@end