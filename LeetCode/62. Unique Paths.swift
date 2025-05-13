//
//  62. Unique Paths.swift
//  Algorithm
//
//  Created by 이동기 on 5/8/25.
//

import Foundation

class UniquePaths {
    // MARK: Top-Down
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var memo: [[Int]] = Array(repeating: Array(repeating: -1, count: n), count: m)
        
        func dp(_ row: Int, _ col: Int) -> Int {
            if row == 0 && col == 0 { return 1 }
            if row < 0 || col < 0 { return 0 }
            if memo[row][col] != -1 { return memo[row][col] }
            memo[row][col] = dp(row - 1, col) + dp(row, col - 1)
            return memo[row][col]
        }
        
        return dp(m - 1, n - 1)
    }
    
    // MARK: Bottom-Up
    func uniquePaths2(_ m: Int, _ n: Int) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 {
                    dp[i][j] = 1
                    continue
                }
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
            }
        }
        
        return dp[m - 1][n - 1]
    }
}

/* Testcase
let uniquePaths = UniquePaths()
print(uniquePaths.uniquePaths(3, 7))
print(uniquePaths.uniquePaths(3, 2))
*/
