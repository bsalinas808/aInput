//
//  ResultsView.h
//  SortedMedian
//
//  Created by Brian Salinas on 10/4/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsView : UIView

@property (readwrite, nonatomic)NSString *sortedList;
@property (readwrite, nonatomic)NSString *median;

@end
