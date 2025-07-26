//
//  삼각 달팽이.swift
//  Algorithm
//
//  Created by 이동기 on 7/23/25.
//

import Foundation

func 삼각_달팽이(_ n:Int) -> [Int] {
    var graph = Array(repeating: Array(repeating: 0, count: n), count: n)
    var result: [Int] = []
    
    var num = 1
    var x = -1, y = 0
    
    for i in 0..<n {
        for _ in i..<n {
            if i % 3 == 0 {
                x += 1
            } else if i % 3 == 1 {
                y += 1
            } else {
                x -= 1
                y -= 1
            }
            
            graph[x][y] = num
            num += 1
        }
    }
    
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] != 0 {
                result.append(graph[i][j])
            }
        }
    }
    
    return result
}

/* Test case
 print(삼각_달팽이(4))
 print(삼각_달팽이(5))
 print(삼각_달팽이(6))
 */
