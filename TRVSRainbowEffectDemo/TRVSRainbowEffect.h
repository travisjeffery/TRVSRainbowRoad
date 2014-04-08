//
//  TRVSRainbowEffect.h
//  RainbowLabelDemo
//
//  Created by Travis Jeffery on 4/7/14.
//  Copyright (c) 2014 Travis Jeffery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRVSRainbowEffect : NSObject

- (instancetype)initWithLabel:(UILabel *)label;

- (void)resume;
- (void)pause;
- (void)remove;

@end
