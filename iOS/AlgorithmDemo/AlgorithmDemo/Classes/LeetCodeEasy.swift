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
        var map = Dictionary<Int, Int>();
        for i in 0..<nums.count {
            let temp = target - nums[i];
            if map.keys.contains(temp) && i != map[temp]!{
                return [i, map[temp]!];
            }
            map[nums[i]] = i;
        }

        return [];
    }
    
    func question26removeDuplicates (_ nums: inout [Int]) -> Int {
        //双指针
        if nums.count < 2 {
            return nums.count;
        }
        var i = 0;
        for j in 1...nums.count-1 {
            if nums[j] != nums[i] {
                i += 1;
                nums[i] = nums[j];
            }
        }
        return i+1;
    }
    
    func question27RemoveElement(_ nums: inout [Int], _ val: Int) -> Int {
        if nums.count == 0 {
            return 0;
        }
        //双指针，慢指针i和快指针j
        var i = 0;
        for j in 0...nums.count-1 {
            if nums[j] != val {
                nums[i] = nums[j];
                i += 1;
            }
        }
        return i;
    }
}
