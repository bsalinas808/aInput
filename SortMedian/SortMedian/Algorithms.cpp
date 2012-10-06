//
//  InputAlgorithms.cpp
//  SortedMedian
//
//  Created by Brian Salinas on 10/3/12.
//  Copyright (c) 2012 Bit Rhythmic Inc. All rights reserved.
//

#include "Algorithms.h"

int partition(vector<int> A, int lo, int hi)
{
    // A more thourogh implementation would use a median of three or similar
    // purpose algorithm before picking the pivot. The size of the array in
    // this app is so small why bother.
    int pivot = A[hi - 1];
    int endOfLo = lo;
    
    for (int toPlace = lo; toPlace < hi - 1; ++toPlace) {
        if (A[toPlace] < pivot) {
            swap(A[toPlace], A[endOfLo]);
            ++endOfLo;
        }
    }
    
    // move pivot to final destination
    A[hi - 1] = A[endOfLo];
    A[endOfLo] = pivot;
    
    return endOfLo;
}

int Algorithms::findOrderStat(vector<int> A, int order)
{
    if (A.size() == 1) return A[0];
    
    int lo = 0;
    int hi = A.size();
    int mid = order;
    int pivot;
    
    while (lo < hi) {
        pivot = partition(A, lo, hi);
        if (pivot == mid)
            break;
        else if (pivot > mid)
            hi = pivot;
        else
            lo = pivot + 1;
    }
    
    return A[pivot];
}

int Algorithms::findMedian(vector<int> A)
{
    return findOrderStat(A, (A.size() >> 1));
}

// O(n) if sorted, O(n^2) if reverse sorted
vector<int> Algorithms::iSort(int A[], const int size){
    int insNdx, toInsert;
    for (int ndx = 1; ndx < size; ++ndx) {
        toInsert = A[ndx];
        insNdx = ndx;
        while (insNdx > 0 && A[insNdx - 1] > toInsert) {
            A[insNdx] = A[insNdx - 1];
            insNdx--;
        }
        A[insNdx] = toInsert;
    }
    
    vector<int> sorted(A, A + size);
    return sorted;
}