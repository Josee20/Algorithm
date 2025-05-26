//
//  785. Is Graph Bipartite?.swift
//  Algorithm
//
//  Created by 이동기 on 5/20/25.
//

import Foundation

class IsBipartite {
    func isBipartite(_ graph: [[Int]]) -> Bool {
        let length = graph.count
        var colors = Array(repeating: -1, count: length)
        
        func dfs(_ n: Int, _ color: Int) -> Bool {
            colors[n] = color
            
            for neighbor in graph[n] {
                if colors[neighbor] == -1 {
                    if !dfs(neighbor, 1 - color) {
                        return false
                    }
                } else if colors[neighbor] == color {
                    return false
                }
            }
            
            return true
        }
        
        for i in 0..<length {
            if colors[i] == -1 {
                if !dfs(i, 0) {
                    return false
                }
            }
        }
        
        return true
    }
}

/* Testcase
 Input: graph = [[1,2,3],[0,2],[0,1,3],[0,2]]
 Output: false
 
 Input: graph = [[1,3],[0,2],[1,3],[0,2]]
 Output: true
 */

