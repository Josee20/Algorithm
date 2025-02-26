//
//  main.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/16.
//

import Foundation

class Solution {
    var ans: [[Int]] = [[]]
    var visited: [Bool] = []
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        visited = Array(repeating: false, count: nums.count)
        bt(depth: 0, nums: nums, result: [])
        return ans
    }
    
    func bt(depth: Int, nums: [Int], result: [Int]) {
        var result = result
        
        if !result.isEmpty {
            ans.append(result)
        }
        
        for i in depth..<nums.count {
//            if !visited[i] {
//                visited[i] = true
                result.append(nums[i])
                bt(depth: i + 1, nums: nums, result: result)
//                visited[i] = false
                result.removeLast()
//            }
        }
    }
    
}

let solution = Solution()
print(solution.subsets([1, 2, 3]))
//print(solution.subsets([0]))
