//
//  ResultsView.h
//  Input
//
//  Created by Brian Salinas on 10/4/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsView : UIView

@property (readwrite, nonatomic)NSArray *sortedList;
@property (readwrite, nonatomic)NSArray *minAndMax;
@property (readwrite, nonatomic)int median;

@end
