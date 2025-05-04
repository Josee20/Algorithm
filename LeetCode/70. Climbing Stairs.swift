//
//  70. Climbing Stairs.swift
//  Algorithm
//
//  Created by 이동기 on 5/4/25.
//

import Foundation

// MARK: Top-Down
class ClimbingStairs {
    func climbStairs(_ n: Int) -> Int {
        var memo = Array(repeating: -1, count: n + 1)
        
        func dp(_ k: Int) -> Int {
            if k <= 2 { return k }
            
            if memo[k] != -1 {
                return memo[k]
            }
            
            memo[k] = dp(k - 1) + dp(k - 2)
            return memo[k]
        }
        
        return dp(n)
    }
}

// MARK: Bottom-Up
class ClimbingStairs2 {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        dp[2] = 2
        
        for i in 3...n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        
        return dp[n]
    }
}

//let sol = Solution()
//print(sol.climbStairs(2))
//print(sol.climbStairs(3))
//print(sol.climbStairs(45))
