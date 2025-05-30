//
//  main.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/16.
//

import Foundation

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        
        let maxValue = amount + 1
        var dp = Array(repeating: maxValue, count: amount + 1)
        dp[0] = 0
        
        for i in 1...amount {
            for coin in coins {
                if i >= coin {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        
        for i in 0..<dp.count {
            print("dp[\(i)]: \(dp[i])")
        }
        
        return dp[amount] == maxValue ? -1 : dp[amount]
    }
}

let sol = Solution()
print(sol.coinChange([1, 2, 5], 11))
print(sol.coinChange([2], 3))
print(sol.coinChange([1], 0))
