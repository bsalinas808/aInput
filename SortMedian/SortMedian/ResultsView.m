//
//  ResultsView.m
//  Input
//
//  Created by Brian Salinas on 10/4/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import "ResultsView.h"

@interface ResultsView()
@property (readwrite, nonatomic, strong)UILabel *sortedLabel;
@property (readwrite, nonatomic, strong)UILabel *minMaxLabel;
@property (readwrite, nonatomic, strong)UILabel *medianLabel;
@end 

@implementation ResultsView

- (void)buildLabels
{
    _sortedLabel = [UILabel new];
    _minMaxLabel = [UILabel new];
    _medianLabel = [UILabel new];
    NSMutableArray *labels = [@[_sortedLabel, _minMaxLabel, _medianLabel] mutableCopy];
#define LABEL_HEIGHT 40.0
    CGRect rect = CGRectMake(0.0, 0.0, self.bounds.size.width, LABEL_HEIGHT);
    
    for (__strong UILabel *label in labels) {
        label.frame = rect;
        label.backgroundColor = [UIColor clearColor];
        label.text = @"Label";
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        rect.origin.y += LABEL_HEIGHT;
        [self addSubview:label];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildLabels];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
