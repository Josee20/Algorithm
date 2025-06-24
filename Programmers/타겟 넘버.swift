//
//  타겟 넘버.swift
//  Algorithm
//
//  Created by 이동기 on 6/23/25.
//

import Foundation

// dfs
func 타겟_넘버(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    
    func dfs(_ index: Int, _ sum: Int) {
        if index == numbers.count - 1 {
            if sum == target {
                result += 1
            }
            
            return
        }
        
        dfs(index + 1, sum + numbers[index])
        dfs(index + 1, sum - numbers[index])
    }
    
    dfs(0, 0)
    return result
}

// bfs
func 타겟_넘버2(_ numbers:[Int], _ target:Int) -> Int {
    struct Node {
        var depth: Int
        var sum: Int
    }
    
    var result = 0
    
    func bfs() {
        var queue: [Node] = [Node(depth: 0, sum: 0)]
        var idx = 0
        
        while queue.count > idx {
            let cur = queue[idx]
            idx += 1
            
            if cur.depth == numbers.count {
                if cur.sum == target {
                    result += 1
                }
            }
            
            if cur.depth < numbers.count {
                queue.append(Node(depth: cur.depth + 1, sum: cur.sum + numbers[cur.depth]))
                queue.append(Node(depth: cur.depth + 1, sum: cur.sum - numbers[cur.depth]))
            }
        }
    }
    
    bfs()
    return result
}

/* Testcase
 Input
 - numbers: [1, 1, 1, 1, 1]
 - target: 3
 Output
 - 5
 
 Input
 - numbers: [4, 1, 2, 1]
 - target: 4
 Output
 - 2
 */
