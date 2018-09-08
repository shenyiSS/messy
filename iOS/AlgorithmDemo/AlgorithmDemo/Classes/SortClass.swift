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
        _ = quickSort(&array, low, left-1);
        _ = quickSort(&array, right+1, high);
        
        return array;
    }
    
    //冒泡排序,做第i次就能把第i大的数排好
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
    
    //归并排序，分治思想
    static func mergeSort(_ array: inout[Int]) {
        var gap = 1;
        while gap < array.count {
            SortClass.init().mergePass(&array, gap: gap);
            gap *= 2;
        }
    }
    
    private func mergePass(_ array: inout[Int], gap: Int) {
        var i = 0;
        let count = array.count;
        
        while i + 2 * gap - 1 < count {
            mergeArray(&array, low: i, mid: i + gap - 1, high: i + 2 * gap - 1);
            i += gap * 2;
        }
        
        if i + gap - 1 < count {
            mergeArray(&array, low: i, mid: i + gap - 1, high: count - 1);
        }
    }
    
    private func mergeArray(_ array: inout[Int], low: Int, mid: Int, high: Int) {
        var i = low;
        var j = mid + 1;
        var k = 0;
        
        var tempArray = Array<Int>(repeating: 0, count: high - low + 1);
        while i <= mid && j <= high {
            if array[i] < array[j] {
                tempArray[k] = array[i];
                i += 1;
                k += 1;
            }
            else {
                tempArray[k] = array[j];
                j += 1;
                k += 1;
            }
        }
        
        while i <= mid {
            tempArray[k] = array[i];
            i += 1;
            k += 1;
        }
        
        while j <= high {
            tempArray[k] = array[j];
            j += 1;
            k += 1;
        }
        
        k = 0;
        for i in low...high {
            array[i] = tempArray[k];
            k += 1;
        }
        
        print(array);
    }
    
    //插入排序
    static func insertSort(_ array : inout[Int]) -> [Int] {
        times = 0;
        
        for i in 1..<(array.count) {
            for j in (0...(i-1)).reversed() {
                //依次拿第n个数倒序和之前n-1个数比较，遇到比它小或者等于它就插入到这个数的右边
                if array[i] >= array[j] {
                    let temp = array[i];
                    array.remove(at: i);
                    array.insert(temp, at: j+1);
                    
                    times += 1;
                    print("第\(times)次----：\(array)");
                    break;
                }
                
                //遍历一遍如果之前成员没有比他小的，把这个数插入到最左边
                if j == 0 {
                    let temp = array[i];
                    array.remove(at: i);
                    array.insert(temp, at: 0);
                    
                    times += 1;
                    print("第\(times)次----：\(array)");
                }
            }
        }
        
        return array;
    }
    
    static func selectionSort(_ array: inout[Int]) -> [Int] {
        times = 0;
        var minIndex = 0;
        
        for i in 0..<array.count {
            for j in i..<array.count {
                if array[j] < array[minIndex] {
                    minIndex = j;
                }
            }
            array.swapAt(i, minIndex);
            //这里需要加一，因为是在i之后的数里面找到最小的
            minIndex = i+1;
            
            times += 1;
            print("第\(times)次----：\(array)");
        }

        return array;
    }
}






























