//
//  ViewController.m
//  MPOProgressBar-iOS
//
//  Created by 吴天 on 19/12/17.
//  Copyright © 2017年 wutian. All rights reserved.
//

#import "ViewController.h"
#import <MPOProgressBar.h>

@interface ViewController ()

@property (nonatomic, strong) MPOProgressBar * progressBar;
@property (nonatomic, strong) NSTimer * timer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _progressBar = [[MPOProgressBar alloc] init];
    _progressBar.backgroundColor = [UIColor colorWithRed:180.0/255 green:207.0/255 blue:240.0/255 alpha:1.0].CGColor;
    _progressBar.fillColor = [UIColor colorWithRed:66.0/255 green:139.0/255 blue:237.0/255 alpha:1.0].CGColor;
    
    [self.view.layer addSublayer:_progressBar];
    
    typeof(self) __weak this = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [this _tick];
    }];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGSize size = CGSizeMake(300, 4);
    CGRect bounds = self.view.bounds;
    
    _progressBar.frame = CGRectMake((bounds.size.width - size.width) / 2, (bounds.size.height - size.height) / 2, size.width, size.height);
}

- (void)_tick
{
    self.progressBar.progress += (1.0 / 60.0 / 1.5); // total time 1.5s
    if (self.progressBar.progress >= 1) {
        [self.timer invalidate];
        [self setTimer:nil];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.progressBar.progressMode = MPOProgressBarModeIndeterminate;
            [self.progressBar startAnimation];
        });
    }
}

@end
