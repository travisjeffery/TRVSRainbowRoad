//
//  View.m
//  TRVSRainbowEffectDemo
//
//  Created by Travis Jeffery on 4/8/14.
//  Copyright (c) 2014 Travis Jeffery. All rights reserved.
//

#import "View.h"

#define SetupButton(X, Y) \
    X = [UIButton buttonWithType:UIButtonTypeCustom]; \
    [X setTitle:NSLocalizedString(Y, nil) forState:UIControlStateNormal]; \
    [X setTitleColor:UIColor.whiteColor forState:UIControlStateNormal]; \
    X.translatesAutoresizingMaskIntoConstraints = NO; \
    [self addSubview:X]; \
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[" @#X "(40)]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(X)]];

@implementation View

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = UIColor.blackColor;
        
        _effectLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _effectLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _effectLabel.text = NSLocalizedString(@"Hello...", nil);
        _effectLabel.textAlignment = NSTextAlignmentCenter;
        _effectLabel.textColor = UIColor.whiteColor;
        _effectLabel.font = [UIFont fontWithName:@"AvenirNext-Bold" size:120.f];
        [self addSubview:_effectLabel];
        
        SetupButton(_resumeButton, @"Resume");
        SetupButton(_removeButton, @"Remove");
        SetupButton(_pauseButton, @"Pause");
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[_pauseButton][_resumeButton][_removeButton]-5-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_removeButton, _resumeButton, _pauseButton)]];
    }
    return self;
}

@end
