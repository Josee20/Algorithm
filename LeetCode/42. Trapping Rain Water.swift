//
//  42. Trapping Rain Water.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/30.
//

import Foundation

class TrappingRainWater {
    func trap(_ height: [Int]) -> Int {
        var answer = 0
        var left = 0
        var right = height.count - 1
        
        var leftMax = height[left]
        var rightMax = height[right]
        
        while left < right {
            leftMax = max(height[left], leftMax)
            rightMax = max(height[right], rightMax)
            
            if leftMax < rightMax {
                answer += leftMax - height[left]
                left += 1
            } else {
                answer += rightMax - height[right]
                right -= 1
            }
        }
        
        return answer
    }
}

/* Testcase
let trappingWater = TrappingRainWater()
print(trappingWater.trap([0,1,0,2,1,0,1,3,2,1,2,1]))
print(trappingWater.trap([4,2,0,3,2,5]))
*/
