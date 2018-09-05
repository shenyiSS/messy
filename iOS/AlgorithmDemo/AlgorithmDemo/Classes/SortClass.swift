//
//  SortClass.swift
//  AlgorithmDemo
//
//  Created by shenyi on 2018/9/5.
//  Copyright © 2018年 shenyi. All rights reserved.
//

import UIKit

class SortClass: NSObject {
    static var times = 0;

}

//MARK:-排序
extension SortClass {
    //快速排序
    static func quickSort(_ array: inout[Int], _ low: Int, _ high: Int) -> [Int] {
        var left = low;
        var right = high;
        if left >= right {
            return array;
        }
        let key = array[left];
        
        while left < right {
            while (left < right && array[right] >= key) {
                right -= 1;
            }
            array[left] = array[right];
            
            while (left < right && array[left] <= key) {
                left += 1;
            }
            array[right] = array[left];
            
            times += 1;
            print("第\(times)次----：\(array)");
        }
        
        array[left] = key;
        quickSort(&array, low, left-1);
        quickSort(&array, right+1, high);
        
        return array;
    }
    
    //冒泡排序
    static func bubbleSort(_ array: inout[Int]) -> [Int] {
        times = 0;
        
        let n = array.count;
        for i in 0..<n {
            for j in 0..<(n - 1 - i) {
                if array[j] > array[j+1] {
                    array.swapAt(j, j+1);
                    
                    times += 1;
                    print("第\(times)次----：\(array)");
                }
            }
        }
        return array;
    }
    
    
}
