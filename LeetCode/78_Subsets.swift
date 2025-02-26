//
//  78_Subsets.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/26.
//

import Foundation

class Subsets {
    var ans: [[Int]] = [[]]
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        bt(depth: 0, nums: nums, result: [])
        return ans
    }
    
    func bt(depth: Int, nums: [Int], result: [Int]) {
        var result = result
        
        if !result.isEmpty {
            ans.append(result)
        }
        
        for i in depth..<nums.count {
            result.append(nums[i])
            bt(depth: i + 1, nums: nums, result: result)
            result.removeLast()
        }
    }
}

/* Testcase
 let subsets = Subsets()
 subsets.subsets([1, 2, 3])
 subsets.subsets([0])
 */
