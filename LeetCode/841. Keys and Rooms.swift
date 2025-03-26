//
//  841_KeysAndRooms.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/26.
//

import Foundation

class KeysAndRooms {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var stack: [Int] = []
        var visited: [Bool] = Array(repeating: false, count: rooms.count)
        visited[0] = true
        stack.append(contentsOf: rooms[0])
        
        while !stack.isEmpty {
            let i = stack.removeLast()
            
            if !visited[i] {
                visited[i] = true
                stack.append(contentsOf: rooms[i])
            }
        }
        
        for visit in visited {
            if visit == false {
                return false
            }
        }
        
        return true
    }
}

// MARK: - DFS
class KeysAndRooms2 {
    var visited: [Int] = []
    
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        dfs(rooms, 0)
        return rooms.count == visited.count
    }

    func dfs(_ rooms: [[Int]], _ current: Int) {
        visited.append(current)
        
        for room in rooms[current] {
            if !visited.contains(room) {
                dfs(rooms, room)
            }
        }
    }
}

// MARK: - BFS
class KeysAndRooms3 {
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

/* Testcase
 let keysAndRooms = KeysAndRooms()
 keysAndRooms.canVisitAllRooms([[1],[2],[3],[]])
 keysAndRooms.canVisitAllRooms([[1,3],[3,0,1],[2],[0]])
 keysAndRooms.canVisitAllRooms([[2],[],[1]])
 */
