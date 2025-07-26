//
//  main.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/16.
//

import Foundation

class Solution {
    func solution(_ places:[[String]]) -> [Int] {
        struct Node {
            let row: Int
            let col: Int
        }
        
        // second가 first보다 클 수 밖에 없음
        func checkIsSafe(_ first: Node, _ second: Node, _ map: [[Character]]) -> Bool {
            let distance = abs(first.row - second.row) + abs(first.col - second.col)
            
            if distance <= 1 {
                return false
            } else if distance > 2 {
                return true
            } else {
                if first.row == second.row { // 같은 행
                    return map[first.row][first.col + 1] == "X" ? true : false
                } else if first.col == second.col { // 같은 열
                    return map[first.row + 1][first.col] == "X" ? true : false
                } else {
                    if first.col > second.col {
                        return map[first.row + 1][first.col] == "X" && map[first.row][first.col - 1] == "X" ? true : false
                    } else {
                        return map[first.row + 1][first.col] == "X" && map[first.row][first.col + 1] == "X" ? true : false
                    }
                }
            }
        }
        
        var result: [Int] = []
        
        for place in places {
            var map: [[Character]] = []
            
            for str in place {
                map.append(Array(str))
            }
            
            var pArr: [Node] = []
            
            for row in 0..<map.count {
                for col in 0..<map[row].count {
                    if map[row][col] == "P" {
                        pArr.append(Node(row: row, col: col))
                    }
                }
            }
            
            var isSafe = true
            
            for i in 0..<pArr.count {
                for j in i + 1..<pArr.count {
                    let first = pArr[i]
                    let second = pArr[j]
                    
                    if !checkIsSafe(first, second, map) {
                        isSafe = false
                        break
                    }
                }
            }
            
            result.append(isSafe ? 1 : 0)
        }
        
        return result
    }
}

let sol = Solution()
print(sol.solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]))
