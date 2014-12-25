//
//  FirstViewController.h
//  WineSender
//
//  Created by michael on 12/25/14.
//  Copyright (c) 2014 michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIScrollViewDelegate>

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) IBOutlet UIPageControl *pageControl;

- (IBAction)changePage:(id)sender;

- (void)previousPage;
- (void)nextPage;

@end

