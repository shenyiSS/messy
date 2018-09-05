//
//  ViewController.swift
//  AlgorithmDemo
//
//  Created by shenyi on 2018/9/5.
//  Copyright © 2018年 shenyi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        testQuickSort();
    }
    
    func testQuickSort() {
        var array = [1,3,4,6,8,2,34,5,7,23,5,6,23,55,5,1,1,2,8,0];
        SortClass.quickSort(array: &array, low: 0, high: array.count-1);
    }

}

