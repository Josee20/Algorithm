//
//  46_Permutations.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/26.
//

import Foundation

class Permutations {
    var ans: [[Int]] = []
    var visited: [Bool] = []

    func permute(_ nums: [Int]) -> [[Int]] {
        visited = Array(repeating: false, count: nums.count)
        bt(depth: 0, nums: nums, result: [])
        return ans
    }

    func bt(depth: Int, nums: [Int], result: [Int]) {
        var result = result

        if result.count >= nums.count {
            ans.append(result)
            return
        }

        for i in 0..<nums.count {
            if !visited[i] {
                visited[i] = true
                result.append(nums[i])
                bt(depth: i + 1, nums: nums, result: result)
                result.removeLast()
                visited[i] = false
            }
        }
    }
}

/* Testcase
 let permutations = Permutations()
 permutations.permute([1, 2, 3])
 permutations.permute([0, 1])
 permutations.permute([1])
 */
