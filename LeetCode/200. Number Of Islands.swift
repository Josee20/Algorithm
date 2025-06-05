//
//  200. Number Of Islands.swift
//  Algorithm
//
//  Created by 이동기 on 6/5/25.
//

import Foundation

class NumberOfIslands {
    func numIslands(_ grid: [[Character]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        let dx: [Int] = [-1, 0, 1, 0]
        let dy: [Int] = [0, -1, 0, 1]
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var result = 0

        func bfs(_ x: Int, _ y: Int) {
            visited[x][y] = true
            var queue: [(x: Int, y: Int)] = []
            queue.append((x, y))

            while !queue.isEmpty {
                let (x, y) = queue.removeFirst()

                for i in 0..<4 {
                    let newX = x + dx[i]
                    let newY = y + dy[i]

                    if newX >= 0 && newX < m && newY >= 0 && newY < n && !visited[newX][newY] {
                        visited[newX][newY] = true

                        if grid[newX][newY] == "1" {
                            queue.append((newX, newY))
                        }
                    }
                }
            }

            result += 1
        }

        for i in 0..<m {
            for j in 0..<n {
                if !visited[i][j] && grid[i][j] == "1" {
                    bfs(i, j)
                }
            }
        }

        return result
    }
}

/*Testcase
let sol = NumberOfIslands()
print(sol.numIslands([
    ["1","1","1","1","0"],
    ["1","1","0","1","0"],
    ["1","1","0","0","0"],
    ["0","0","0","0","0"]
]))
print(sol.numIslands([
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
]))
 */
