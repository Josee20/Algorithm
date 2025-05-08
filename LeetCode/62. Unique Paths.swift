//
//  62. Unique Paths.swift
//  Algorithm
//
//  Created by 이동기 on 5/8/25.
//

import Foundation

class UniquePaths {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
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
