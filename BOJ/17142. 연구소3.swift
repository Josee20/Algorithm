//
//  17142. 연구소3.swift
//  Algorithm
//
//  Created by 이동기 on 6/18/25.
//

import Foundation

func 연구소3() {
    struct Point {
        let x: Int
        let y: Int
    }

    let dx: [Int] = [-1, 0, 1, 0]
    let dy: [Int] = [0, -1, 0, 1]

    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    var map: [[Int]] = []
    var virusPoints: [Point] = []
    var emptyCount = 0

    for _ in 0..<n {
        map.append(readLine()!.components(separatedBy: " ").map { Int($0)! })
    }

    for i in 0..<n {
        for j in 0..<n {
            if map[i][j] == 2 {
                virusPoints.append(Point(x: i, y: j))
            } else if map[i][j] == 0 {
                emptyCount += 1
            }
        }
    }

    var minTime = Int.max

    func bfs(_ activeViruses: [Point]) {
        var visited = Array(repeating: Array(repeating: -1, count: n), count: n)
        var queue: [Point] = []
        
        for point in activeViruses {
            queue.append(point)
            visited[point.x][point.y] = 0
        }
        
        var maxTime = 0
        var infected = 0
        
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            
            for i in 0..<4 {
                let nx = curr.x + dx[i]
                let ny = curr.y + dy[i]
                
                guard nx >= 0 && ny >= 0 && nx < n && ny < n else { continue }
                
                // 방문을 안 하고 벽이 아닌 곳
                if map[nx][ny] != 1 && visited[nx][ny] == -1 {
                    visited[nx][ny] = visited[curr.x][curr.y] + 1
                    queue.append(Point(x: nx, y: ny))
                    
                    if map[nx][ny] == 0 {
                        infected += 1
                        maxTime = visited[nx][ny]
                    }
                }
            }
        }
        
        if infected == emptyCount {
            minTime = min(minTime, maxTime)
        }
    }

    func combinations(_ array: [Point], _ k: Int) -> [[Point]] {
        if k == 0 { return [[]] }
        if array.isEmpty { return [] }
        
        var result = [[Point]]()
        let head = array[0]
        let subcomb = combinations(Array(array.dropFirst()), k - 1)
        for comb in subcomb {
            result.append([head] + comb)
        }
        result += combinations(Array(array.dropFirst()), k)
        return result
    }

    if emptyCount == 0 {
        print(0)
    } else {
        let combs = combinations(virusPoints, m)
        
        for comb in combs {
            bfs(comb)
        }

        print(minTime == Int.max ? -1 : minTime)
    }
}
