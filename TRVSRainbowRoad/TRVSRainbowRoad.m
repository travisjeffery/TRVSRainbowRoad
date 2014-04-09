//
//  TRVSRainbowRoad.m
//  RainbowLabelDemo
//
//  Created by Travis Jeffery on 4/7/14.
//  Copyright (c) 2014 Travis Jeffery. All rights reserved.
//

#import "TRVSRainbowRoad.h"

static inline CGFloat HueUsingIndex(NSInteger index) {
    return 10 * index % 360 / 360.f;
}

static inline UIColor *ColorWithHue(CGFloat hue) {
    return [UIColor colorWithHue:hue saturation:1.f brightness:1.f alpha:1.f];
}

@interface TRVSRainbowRoad ()

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (assign, nonatomic) NSInteger hueIndex;
@property (strong, nonatomic) NSMutableArray *colors;

@end

@implementation TRVSRainbowRoad

#pragma mark - Public

- (void)dealloc {
    [_displayLink invalidate];
}

- (instancetype)initWithLabel:(UILabel *)label {
    if (self = [super init]) {
        _label = label;
    }
    return self;
}

- (void)resume {
    self.displayLink.paused = NO;
}

- (void)remove {
    self.displayLink.paused = YES;
    self.colors = nil;
    self.label.text = self.label.attributedText.string;
}

- (void)pause {    
    self.displayLink.paused = YES;
}

#pragma mark - Private

- (void)rainbowRoad:(CADisplayLink *)sender {
    NSMutableAttributedString *attributedText = self.label.attributedText.mutableCopy;
    [self updateColorsMaintainingLength:attributedText.length];
    [self addColorAttributesToAttributedString:attributedText];
    self.label.attributedText = attributedText;
}

- (void)updateColorsMaintainingLength:(NSUInteger)maxLength {
    [self.colors insertObject:ColorWithHue(HueUsingIndex(self.hueIndex++)) atIndex:0];
    if (self.colors.count > maxLength) {
        [self.colors removeObjectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(maxLength, self.colors.count - maxLength)]];
    }
}

- (void)addColorAttributesToAttributedString:(NSMutableAttributedString *)attributedText {
    [self.colors enumerateObjectsUsingBlock:^(UIColor *color, NSUInteger idx, BOOL *stop) {
        [attributedText setAttributes:@{ NSForegroundColorAttributeName : color } range:NSMakeRange(idx, 1)];
    }];
}

- (CADisplayLink *)displayLink {
    if (!_displayLink) {
        _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(rainbowRoad:)];
        _displayLink.paused = YES;
        [_displayLink addToRunLoop:NSRunLoop.mainRunLoop forMode:NSDefaultRunLoopMode];
    }
    return _displayLink;
}

- (NSMutableArray *)colors {
    if (!_colors) {
        _colors = NSMutableArray.new;
    }
    return _colors;
}

- (NSInteger)hueIndex {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _hueIndex = floor(360 * drand48());
    });
    return _hueIndex;
}

@end
