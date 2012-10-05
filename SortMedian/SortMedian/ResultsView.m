//
//  ResultsView.m
//  SortedMedian
//
//  Created by Brian Salinas on 10/4/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import "ResultsView.h"

@interface ResultsView()
@property (readwrite, nonatomic, strong)UILabel *sortedLabel;
@property (readwrite, nonatomic, strong)UILabel *medianLabel;
@end 

@implementation ResultsView

- (void)buildLabels
{
    _sortedLabel = [UILabel new];
    _medianLabel = [UILabel new];
    NSMutableArray *labels = [@[_sortedLabel, _medianLabel] mutableCopy];
#define LABEL_HEIGHT 24.0
    CGRect rect = CGRectMake(0.0, 0.0, self.bounds.size.width, LABEL_HEIGHT);
    
    for (__strong UILabel *label in labels) {
        label.frame = rect;
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor lightGrayColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont fontWithName:@"ArialRoundedMTBold" size:18.0];
        label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        
        rect.origin.y += LABEL_HEIGHT;
        [self addSubview:label];
    }
}

- (void)setSortedList:(NSString *)sortedList
{
    self.sortedLabel.text = [NSString stringWithFormat:@"sorted: %@", sortedList];
}

- (void)setMedian:(NSString *)median
{
    self.medianLabel.text = [NSString stringWithFormat:@"median: %@", median];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self buildLabels];
    }
    return self;
}

@end
