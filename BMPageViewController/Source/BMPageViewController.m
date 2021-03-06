//
//  BMPageViewController.m
//  BMPageViewController
//
//  Created by Nacho Soto on 2/16/14.
//  Copyright (c) 2014 MindSnacks. All rights reserved.
//
//  Modified by Rogerio Araujo on 9/17/14.
//  Copyright (c) 2014 BMobile. All rights reserved.
//

#import "BMPageViewController.h"
#import "BMPageViewController+Protected.h"

@implementation BMPageViewController

- (id)initWithTransitionStyle:(UIPageViewControllerTransitionStyle)style
        navigationOrientation:(UIPageViewControllerNavigationOrientation)navigationOrientation
                      options:(NSDictionary *)options {
    if ((self = [super initWithTransitionStyle:style
                         navigationOrientation:navigationOrientation
                                       options:options])) {
        [self bs_setUp];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self bs_setUp];
    }
    
    return self;
}

#pragma mark - Protected

- (void)bs_setUp {
    _currentPage = 0;
    self.dataSource = self;
}

- (NSArray *)pageIdentifiers {
    [self doesNotRecognizeSelector:_cmd];
    
    return nil;
}

- (NSInteger)pageCount {
    return (NSInteger)self.pageIdentifiers.count;
}

- (void)setUpViewController:(UIViewController<BMPageViewControllerChild> *)viewController
                    atIndex:(NSInteger)index {
    
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAssert(self.pageCount > 0, @"%@ has no pages", self);
    
    [self setViewControllers:@[[self viewControllerAtIndex:_currentPage]]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
    
    if (self.pageCount == 1) {
        self.view.userInteractionEnabled = NO;
    }
}

- (void)changePage:(NSInteger)page {
    
    NSInteger direction = page < self.currentPage ? UIPageViewControllerNavigationDirectionReverse : UIPageViewControllerNavigationDirectionForward;
    
    if(page > -1 && page <= self.pageCount)
        [self setViewControllers:@[[self viewControllerAtIndex:page]]
                       direction:direction
                        animated:YES
                      completion:nil];
}

#pragma mark - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
      viewControllerBeforeViewController:(UIViewController<BMPageViewControllerChild> *)viewController {
    const NSInteger index = viewController.pageIndex;
    
    return (index == NSNotFound) ? nil : [self viewControllerAtIndex:index - 1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController
       viewControllerAfterViewController:(UIViewController<BMPageViewControllerChild> *)viewController {
    const NSInteger index = viewController.pageIndex;
    
    return (index == NSNotFound) ? nil : [self viewControllerAtIndex:index + 1];
}

- (UIViewController *)viewControllerAtIndex:(NSInteger)index {
    UIViewController<BMPageViewControllerChild> *result = nil;
    
    if (index >= 0 && index < self.pageCount) {
        NSAssert(self.storyboard,
                 @"This controller is only meant to be used inside of a UIStoryboard");
        
        result = [self.storyboard instantiateViewControllerWithIdentifier:self.pageIdentifiers[(NSUInteger)index]];
        
        NSParameterAssert(result);
        NSAssert([result conformsToProtocol:@protocol(BMPageViewControllerChild)],
                 @"Child view controller (%@) must conform to %@",
                 result,
                 NSStringFromProtocol(@protocol(BMPageViewControllerChild)));
        
        result.pageIndex = index;
        
        [self setUpViewController:result
                          atIndex:index];
        
        self.currentPage = index;
    }
    
    return result;
}

- (NSInteger)presentationCountForPageViewController:(BMPageViewController *)pageViewController {
    const BOOL shouldShowPageControl = (pageViewController.pageCount > 1);
    
    return (shouldShowPageControl) ? pageViewController.pageCount : 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    return [pageViewController.viewControllers.lastObject pageIndex];
}

@end
