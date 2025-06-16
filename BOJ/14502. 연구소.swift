//
//  연구소.swift
//  Algorithm
//
//  Created by 이동기 on 6/12/25.
//

import Foundation

func 연구소() {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let n = input[0] // 세로
    let m = input[1] // 가로
    var map: [[Int]] = []

    for _ in 0..<n {
        let row = readLine()!.components(separatedBy: " ").map { Int($0)! }
        map.append(row)
    }

    let dx: [Int] = [-1, 0, 1, 0]
    let dy: [Int] = [0, -1, 0, 1]
    
    var emptySpaces: [(Int, Int)] = []
    var virusPositions: [(Int, Int)] = []
    var maxSafeArea = 0

    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 0 {
                emptySpaces.append((i, j))
            } else if map[i][j] == 2 {
                virusPositions.append((i, j))
            }
        }
    }
    
    func combinations<T>(_ array: [T], _ k: Int) -> [[T]] {
        if k == 0 { return [[]] }
        if array.isEmpty { return [] }
        
        var result = [[T]]()
        let head = array[0]
        let subcomb = combinations(Array(array.dropFirst()), k - 1)
        for comb in subcomb {
            result.append([head] + comb)
        }
        result += combinations(Array(array.dropFirst()), k)
        return result
    }
    
    func bfs(_ lab: inout [[Int]]) {
        var queue = virusPositions

        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()

            for dir in 0..<4 {
                let nx = x + dx[dir]
                let ny = y + dy[dir]
                if nx >= 0, ny >= 0, nx < n, ny < m, lab[nx][ny] == 0 {
                    lab[nx][ny] = 2
                    queue.append((nx, ny))
                }
            }
        }
    }
    
    func countSafeArea(_ lab: [[Int]]) -> Int {
        return lab.flatMap { $0 }.filter { $0 == 0 }.count
    }
    
    let wallCombinations = combinations(emptySpaces, 3)
    
    for walls in wallCombinations {
        var lab = map

        for (x, y) in walls {
            lab[x][y] = 1
        }

        bfs(&lab)
        let safeArea = countSafeArea(lab)
        maxSafeArea = max(maxSafeArea, safeArea)
    }
    
    print(maxSafeArea)
}
