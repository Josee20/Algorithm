//
//  764. Min Cost Climbing Stairs.swift
//  Algorithm
//
//  Created by 이동기 on 5/4/25.
//

import Foundation

// MARK: Top-Down
class MinCostClimbingStairs {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var memo = Array(repeating: -1, count: cost.count + 1)
        let top = cost.count
        
        func dp(_ n: Int) -> Int {
            if n <= 1 {
                return 0
            }
            
            if memo[n] != -1 {
                return memo[n]
            }
            
            memo[n] = min(dp(n - 1) + cost[n - 1], dp(n - 2) + cost[n - 2])
            return memo[n]
        }
        
        return dp(top)
    }
}

// MARK: Bottom-Up
class MinCostClimbingStairs2 {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array(repeating: 0, count: cost.count + 1)
        let n = cost.count
        
        for i in 2...n {
            dp[i] = min(dp[i - 1] + cost[i - 1] , dp[i - 2] + cost[i - 2])
        }
        
        return dp[n]
    }
}

/* Testcase
let minCostClimbingStairs = MinCostClimbingStairs()
print(minCostClimbingStairs.minCostClimbingStairs([10, 15, 20]))
print(minCostClimbingStairs.minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]))
*/
