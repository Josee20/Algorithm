//
//  704_BinarySearch.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/26.
//

import Foundation

class BinarySearch {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        return binarySearch(nums, target)
    }

    // 재귀
    func recursiveBinarySearch(_ nums: [Int], _ target: Int, start: Int, end: Int) -> Int {
        if start > end {
            return -1
        }

        let mid = (start + end) / 2

        if target == nums[mid] {
            return mid
        } else if target > nums[mid] {
            return recursiveBinarySearch(nums, target, start: mid + 1, end: end)
        } else {
            return recursiveBinarySearch(nums, target, start: start, end: mid - 1)
        }
    }

    // 반복문
    func binarySearch(_ nums: [Int], _ target: Int) -> Int {
        var start = 0
        var end = nums.count - 1

        while (start <= end) {
            let mid = (start + end) / 2

            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }

        return -1
    }
}

/* Testcase
 let solution = BinarySearch()
 solution.binarySearch([-1, 0, 3, 5, 9, 12], 9)
 solution.binarySearch([-1, 0, 3, 5, 9, 12], 2)
 */
