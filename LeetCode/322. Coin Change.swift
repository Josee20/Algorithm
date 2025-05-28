//
//  322. Coin Change.swift
//  Algorithm
//
//  Created by 이동기 on 5/28/25.
//

import Foundation

class CoinChange {
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
        
        return dp[amount] == maxValue ? -1 : dp[amount]
    }
}

/* Testcase
 let sol = CoinChange()
 print(sol.coinChange([1, 2, 5], 11)) -> 3
 print(sol.coinChange([2], 3)) -> -1
 print(sol.coinChange([1], 0)) -> 0
 */
