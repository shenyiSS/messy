//
//  LeetCodeEasy.swift
//  AlgorithmDemo
//
//  Created by shenyi on 2018/9/7.
//  Copyright © 2018年 shenyi. All rights reserved.
//

import UIKit

class LeetCodeEasy: NSObject {

}

extension LeetCodeEasy {
    
    func question1TwoSum(_ nums: [Int], _ target: Int) -> [Int] {
        //时间复杂度O(n²),空间复杂度O(1)
//        for i in 0..<nums.count {
//            for j in i+1..<nums.count {
//                if nums[i] + nums[j] == target {
//                    return [i, j];
//                }
//            }
//        }
        //这种解法会提示超出时间限制，应该是nums.contains或者indexOf这两个方法太耗时
//        for i in 0..<nums.count {
//            let temp = target - nums[i];
//            if nums.contains(temp) {
//                let index = nums.index(of: temp);
//                if i != index {
//                    return [i, index!];
//                }
//            }
//        }
        //这种解法时间复杂度O(n),空间复杂度O(n)
        var map = Dictionary<Int, Int>()
        for i in 0..<nums.count {
            let temp = target - nums[i]
            if map.keys.contains(temp) && i != map[temp]!{
                return [i, map[temp]!]
            }
            map[nums[i]] = i
        }

        return [];
    }
    
    func question26removeDuplicates (_ nums: inout [Int]) -> Int {
        //双指针
        if nums.count < 2 {
            return nums.count
        }
        var i = 0;
        for j in 1..<nums.count {
            if nums[j] != nums[i] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i+1
    }
    
    func question27RemoveElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 {
            return 0
        }
        //双指针，慢指针i和快指针j
        var i = 0
        for j in 0..<nums.count {
            if nums[j] != val {
                nums[i] = nums[j]
                i += 1
            }
        }
        return i
    }
    
    func question35SearchInsert(_ nums: [Int], _ target: Int) -> Int {
        for i in 0..<nums.count {
            if nums[i] >= target {
                return i
            }
        }
        return nums.count
    }
    
    func question53MaxSubArray(_ nums: [Int]) -> Int {
        var max = nums.first!
        
        for i in 0..<nums.count {
            var sum = 0
            for j in i..<nums.count {
                sum += nums[j]
                if sum > max {
                    max = sum
                }
            }
        }
        return max;
        
//        let count = nums.count
//        var sub = nums[0]
//        var maxSub = sub
//        for i in 1..<count {
//            let m = nums[i]
        //第i个数和之前已经遍历过的子数组最大和作比较
//            sub = max(m, m + sub)
        //第i个数结果和第i-1个数的结果作比较
//            maxSub = max(maxSub, sub)
//        }
//        return maxSub
    }
    
    func question66PlusOne(_ digits: [Int]) -> [Int] {
        var result:[Int] = []
        
        for element in digits {
            result.append(element)
        }
        
        if result.last != 9 {
            result[result.count-1] += 1
            return result
        }
        else {
            result[result.count-1] += 1;

            for i in (0..<result.count).reversed() {
                if result[i] == 10 && i > 0{
                    result[i] = 0
                    result[i-1] += 1
                }
                else if result[i] == 10 && i == 0 {
                    result[i] = 0
                    result.insert(1, at: 0)
                }
                else {
                    return result
                }
            }
        }
        
        return result
    }
    
    func question88Merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1
        var j = n - 1
        var index = m + n - 1
        
        while i >= 0 && j >= 0 {
            if nums1[i] > nums2[j] {
                nums1[index] = nums1[i]
                i -= 1
            }
            else {
                nums1[index] = nums2[j]
                j -= 1
            }
            index -= 1
        }
        
        while j >= 0 {
            nums1[index] = nums2[j]
            j -= 1
            index -= 1
        }
    }
    
    func question118generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        
        if numRows == 1 {
            return [[1]]
        }
        else if numRows == 2 {
            return [[1], [1, 1]]
        }
        else if numRows <= 0 {
            return []
        }
        
        result = [[1], [1, 1]]
        
        for i in 3...numRows {
            var array = [1, 1]
            var prevArray = result[i-2]
            for j in 2...i-1 {
                let num = prevArray[j-2] + prevArray[j-1]
                array.insert(num, at: array.count-1)
            }
            result.insert(array, at: result.count)
        }
        return result
    }

    func question119GetRow(_ rowIndex: Int) -> [Int] {
        if rowIndex == 1 {
            return [1, 1]
        }
        else if rowIndex <= 0 {
            return [1]
        }
        
        var result = [1]
        var lastRow = question119GetRow(rowIndex - 1)
        for i in 0..<lastRow.count-1 {
            result.append(lastRow[i] + lastRow[i+1])
        }
        result.append(1)
        return result
    }
}
