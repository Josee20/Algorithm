//
//  main.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/16.
//

import Foundation

class Solution {
    
    func solution(_ maps:[String]) -> [Int] {
        let n = maps.count
        let m = maps[0].count
        let board = maps.map { Array($0) }
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
        var result: [Int] = []
        
        let dx = [-1, 0, 1, 0]
        let dy = [0, -1, 0, 1]
        
        func dfs(_ x: Int, _ y: Int) -> Int {
            var sum = Int(String(board[x][y])) ?? 0
            visited[x][y] = true
            
            for dir in 0..<4 {
                let nx = x + dx[dir]
                let ny = y + dy[dir]
                
                guard nx >= 0, ny >= 0, nx < n, ny < m else { continue }
                guard !visited[nx][ny], board[nx][ny] != "X" else { continue }
                
                sum += dfs(nx, ny)
            }
            
            return sum
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if !visited[i][j] && board[i][j] != "X" {
                    result.append(dfs(i, j))
                }
            }
        }
        
        
        return result.isEmpty ? [-1] : result.sorted()
    }
    
}

let sol = Solution()
print(sol.solution(["X591X","X1X5X","X231X", "1XXX1"]))
print(sol.solution(["XXX","XXX","XXX"]))
