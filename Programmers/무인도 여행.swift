//
//  무인도 여행.swift
//  Algorithm
//
//  Created by 이동기 on 5/26/25.
//

import Foundation

class 무인도여행 {
    
    // BFS
    func solution(_ maps:[String]) -> [Int] {
        let n = maps.count
        let m = maps[0].count
        let board = maps.map { Array($0) }
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)
        var result: [Int] = []
        
        let dx = [-1, 0, 1, 0]
        let dy = [0, -1, 0, 1]
        
        func bfs(_ x: Int, _ y: Int) -> Int {
            var queue = [(x, y)]
            visited[x][y] = true
            var total = Int(String(board[x][y])) ?? 0
            var index = 0
            
            while index < queue.count {
                let (curX, curY) = queue[index]
                index += 1
                
                for dir in 0..<4 {
                    let nx = curX + dx[dir]
                    let ny = curY + dy[dir]
                    
                    guard nx >= 0, ny >= 0, nx < n, ny < m else { continue }
                    guard !visited[nx][ny], board[nx][ny] != "X" else { continue }
                    
                    visited[nx][ny] = true
                    queue.append((nx, ny))
                    total += Int(String(board[nx][ny])) ?? 0
                }
            }
            
            return total
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if !visited[i][j] && board[i][j] != "X" {
                    result.append(bfs(i, j))
                }
            }
        }
        
        
        return result.isEmpty ? [-1] : result.sorted()
    }
    
    // DFS
    func solution2(_ maps:[String]) -> [Int] {
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
