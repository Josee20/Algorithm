//
//  322. Coin Change.swift
//  Algorithm
//
//  Created by 이동기 on 5/28/25.
//

import Foundation

class CoinChange {
    
    // Bottom-Up
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
    
    // BFS
    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 { return 0 }
        
        var visited = Set<Int>()
        var queue: [(amount: Int, count: Int)] = []
        queue.append((0, 0))
        visited.insert(0)
        
        while !queue.isEmpty {
            let (currentAmount, coinCount) = queue.removeFirst()
            
            for coin in coins {
                let nextAmount = currentAmount + coin
                
                if nextAmount == amount {
                    return coinCount + 1
                }
                
                if nextAmount < amount && !visited.contains(nextAmount) {
                    queue.append((nextAmount, coinCount + 1))
                    visited.insert(nextAmount)
                }
            }
        }
        
        return -1
    }
}
