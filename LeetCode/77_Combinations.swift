//
//  77_Combinations.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/26.
//

import Foundation

class Combinations {
    var ans: [[Int]] = []
    var visited: [Bool] = []
    
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        visited = Array(repeating: false, count: n + 1)
        bt(depth: 1, n: n, k: k, result: [])
        return ans
    }

    func bt(depth: Int, n: Int, k: Int, result: [Int]) {
        var result = result

        if result.count == k {
            ans.append(result)
            return
        }

        for i in depth..<n + 1 {
            if !visited[i] {
                visited[i] = true
                result.append(i)
                bt(depth: i + 1, n: n, k: k, result: result)
                visited[i] = false
                result.removeLast()
            }
        }
    }
}

/* Testcase
 let combinations = Combinations()
 combinations.combine(4, 2)
 combinations.combine(1, 1)
 */
