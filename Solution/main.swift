//
//  main.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/16.
//

import Foundation

class Solution {
    var visited: [Int] = []
    
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        return bfs(rooms, 0).count == visited.count
    }
    
    func bfs(_ rooms: [[Int]], _ start: Int) -> [Int] {
        visited = [start]
        var queue = [start]
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            for room in rooms[current] {
                if !visited.contains(room) {
                    visited.append(room)
                    queue.append(room)
                }
            }
        }
        
        return visited
    }
}
