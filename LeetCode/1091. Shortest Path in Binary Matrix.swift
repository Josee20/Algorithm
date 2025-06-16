//
//  1091. Shortest Path in Binary Matrix.swift
//  Algorithm
//
//  Created by 이동기 on 6/9/25.
//

import Foundation

class ShortestPathBinaryMatrix {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let n = grid.count
        if grid[0][0] == 1 || grid[n - 1][n - 1] == 1 { return -1 }
        
        let direction = [
            (-1, -1), (0, -1), (1, -1),
            (-1, 0),          (1, 0),
            (-1, 1), (0, 1), (1, 1)
        ]
        
        var queue: [(x: Int, y: Int, dist: Int)] = []
        queue.append((0, 0, 1))
        
        var visited = Array(repeating: Array(repeating: false, count: n), count: n)
        visited[0][0] = true
        
        while !queue.isEmpty {
            let (curX, curY, dist) = queue.removeFirst()
            
            if curX == n - 1 && curY == n - 1 {
                return dist
            }
            
            for (x, y) in direction {
                let nextX = curX + x
                let nextY = curY + y
                
                if nextX >= 0 && nextY >= 0 && nextX < n && nextY < n && grid[nextX][nextY] == 0 && !visited[nextX][nextY] {
                    visited[nextX][nextY] = true
                    queue.append((nextX, nextY, dist + 1))
                }
            }
        }
        
        return -1
    }
}

/* Testcase
let sol = ShortestPathBinaryMatrix()
let grid1: [[Int]] = [
    [0, 1, 1],
    [1, 0, 0],
    [1, 1, 0]
]
let grid2 = [
    [0,1,1,0,0,0],
    [0,1,0,1,1,0],
    [0,1,1,0,1,0],
    [0,0,0,1,1,0],
    [1,1,1,1,1,0],
    [1,1,1,1,1,0]
]
let grid3 = [
    [0,0,0],
    [1,1,0],
    [1,1,0]
]
print(sol.shortestPathBinaryMatrix(grid1)) // 3
print(sol.shortestPathBinaryMatrix(grid2)) // 14
print(sol.shortestPathBinaryMatrix(grid3)) // 4
*/
