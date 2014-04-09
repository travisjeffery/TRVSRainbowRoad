//
//  ViewController.m
//  RainbowLabelDemo
//
//  Created by Travis Jeffery on 4/7/14.
//  Copyright (c) 2014 Travis Jeffery. All rights reserved.
//

#import "ViewController.h"
#import "TRVSRainbowRoad.h"
#import "View.h"

@interface ViewController ()

@property (strong, nonatomic) TRVSRainbowRoad *effect;
@property (strong, nonatomic) View *view;

@end

@implementation ViewController

@dynamic view;

- (void)loadView {
    self.view = View.new;
    
    self.effect = [[TRVSRainbowRoad alloc] initWithLabel:self.view.effectLabel];
    [self.effect resume];
    
    [self.view.resumeButton addTarget:self.effect action:@selector(resume) forControlEvents:UIControlEventTouchUpInside];
    [self.view.removeButton addTarget:self.effect action:@selector(remove) forControlEvents:UIControlEventTouchUpInside];
    [self.view.pauseButton addTarget:self.effect action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
}

@end
