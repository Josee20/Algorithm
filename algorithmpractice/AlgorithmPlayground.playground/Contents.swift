import UIKit

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, M) = (input[0], input[1])
var graph: [[Int]] = []

for _ in 0..<N {
    graph.append(readLine()!.map { Int(String($0))! })
}

func DFS(_ x: Int, _ y: Int) -> Bool {
    
    if !isInRange(x, y) {
        return false
    }
    
    if graph[x][y] == 0 {
        graph[x][y] = 1
        DFS(x - 1, y)
        DFS(x, y - 1)
        DFS(x + 1, y)
        DFS(x, y + 1)
        return true
    }
    
    return false
}


func isInRange(_ x: Int, _ y: Int) -> Bool {
    return (0..<x ~= x) && (0..<y ~= y)
}

for i in 0..<N {
    for j in 0..<M {
        if DFS(i, j) == true {
            result += 1
        }
    }
}

