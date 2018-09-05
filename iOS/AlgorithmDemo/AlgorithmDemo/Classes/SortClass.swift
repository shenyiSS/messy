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

//MARK:-快速排序
extension SortClass {

    static func quickSort(array: inout[Int], low: Int, high: Int) -> [Int] {
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
        quickSort(array: &array, low: low, high: left-1);
        quickSort(array: &array, low: right+1, high: high);
        
        return array;
    }
}
