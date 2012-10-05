//
//  InputAlgorithms.h
//  Input
//
//  Created by Brian Salinas on 10/3/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#ifndef __Input__Algorithms__
#define __Input__Algorithms__

//#include <iostream>

#include <vector>
using namespace std;

class Algorithms
{
public:
    Algorithms(){}
//    Algorithms(const Algorithms & rhs){ *this = rhs; }
    ~Algorithms(){}
    
    int findMedian(vector<int> A);
    int findOrderStat(vector<int> A, int order);
    vector<int> iSort(int A[], const int size);
};

#endif /* defined(__Input__InputAlgorithms__) */
