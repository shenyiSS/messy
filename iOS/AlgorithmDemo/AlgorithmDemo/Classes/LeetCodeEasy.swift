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
    
    /* question1
    给定一个整数数组和一个目标值，找出数组中和为目标值的两个数。
    
    你可以假设每个输入只对应一种答案，且同样的元素不能被重复利用。
    
    示例:
    
    给定 nums = [2, 7, 11, 15], target = 9
    
    因为 nums[0] + nums[1] = 2 + 7 = 9
    所以返回 [0, 1]
    */
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
}
