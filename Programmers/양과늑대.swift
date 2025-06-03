//
//  양과늑대.swift
//  Algorithm
//
//  Created by 이동기 on 6/3/25.
//

import Foundation

class 양과늑대 {
    func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
        var graph = Array(repeating: [Int](), count: info.count)
        
        for edge in edges {
            graph[edge[0]].append(edge[1])
        }
        
        var maxSheep = 0
        
        func dfs(_ next: Int, _ sheep: Int, _ wolf: Int, _ nextNodes: [Int]) {
            var sheep = sheep
            var wolf = wolf
            
            if info[next] == 0 {
                sheep += 1
            } else {
                wolf += 1
            }
            
            if wolf >= sheep { return }
            
            maxSheep = max(maxSheep, sheep)
            
            var nextNodes = nextNodes
            nextNodes.append(contentsOf: graph[next])
            
            if let index = nextNodes.firstIndex(of: next) {
                nextNodes.remove(at: index)
            }
            
            for nextNode in nextNodes {
                dfs(nextNode, sheep, wolf, nextNodes)
            }
        }
        
        dfs(0, 0, 0, [])
        
        return maxSheep
    }
}

/* Testcase
let sol = 양과늑대()
print(sol.solution([0,0,1,1,1,0,1,0,1,0,1,1],     [[0,1],[1,2],[1,4],[0,8],[8,7],[9,10],[9,11],[4,3],[6,5],[4,6],[8,9]]))// 5
print(sol.solution([0,1,0,1,1,0,1,0,0,1,0], [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6],[3,7],[4,8],[6,9],[9,10]])) // 5
*/
