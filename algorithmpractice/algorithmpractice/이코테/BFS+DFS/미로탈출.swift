//
//  미로탈출.swift
//  algorithmpractice
//
//  Created by 이동기 on 2023/02/22.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])
var graph: [[Int]] = []

for _ in 0..<N {
    graph.append(readLine()!.map { Int(String($0))! })
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

struct Queue<T> {
    
    var queue: [T] = []
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return queue.isEmpty ? nil : queue.removeFirst()
    }
}

func BFS(_ x: Int, _ y: Int) -> Int {
    
    var x = x
    var y = y
    
    var queue = Queue<(Int, Int)>()
    queue.enqueue((x, y))
    
    while !queue.isEmpty {
        
        (x, y) = queue.dequeue()!
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || nx >= N || ny >= M {
                continue
            }
            
            if graph[nx][ny] == 0 {
                continue
            }
            
            if graph[nx][ny] == 1 {
                graph[nx][ny] = graph[x][y] + 1
                queue.enqueue((nx, ny))
                
            }
            
        }
        
    }
    
    return graph[N-1][M-1]
}

