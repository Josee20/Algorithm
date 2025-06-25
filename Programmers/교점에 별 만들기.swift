//
//  교점에 별 만들기.swift
//  Algorithm
//
//  Created by 이동기 on 6/25/25.
//

import Foundation

func 교점에_별_만들기(_ line:[[Int]]) -> [String] {
    var points: Set<[Int]> = []
    var minX = Int.max, maxX = Int.min
    var minY = Int.max, maxY = Int.min
    
    for i in 0..<line.count {
        for j in i + 1..<line.count {
            hasSamePoint(
                a: line[i][0],
                b: line[i][1],
                e: line[i][2],
                c: line[j][0],
                d: line[j][1],
                f: line[j][2]
            )
        }
    }
    
    var answer = Array(repeating: Array(repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)
    
    for point in points {
        let x = point[0] - minX
        let y = maxY - point[1]
        answer[y][x] = "*"
    }
    
    func hasSamePoint(a: Int, b: Int, e: Int, c: Int, d: Int, f: Int) {
        let denominator = (a * d) - (b * c)
        if denominator == 0 { return }
        
        let xNumerator = (b * f) - (e * d)
        let yNumerator = (e * c) - (a * f)
        
        if xNumerator % denominator != 0 || yNumerator % denominator != 0 { return }
        
        let x = xNumerator / denominator
        let y = yNumerator / denominator
        
        minX = min(minX, x)
        maxX = max(maxX, x)
        minY = min(minY, y)
        maxY = max(maxY, y)
        points.insert([x, y])
    }
    
    return answer.map { $0.joined()}
}

/* Testcase
print(교점에_별_만들기([[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]]))
print(교점에_별_만들기([[0, 1, -1], [1, 0, -1], [1, 0, 1]]))
print(교점에_별_만들기([[1, -1, 0], [2, -1, 0]]))
print(교점에_별_만들기([[1, -1, 0], [2, -1, 0], [4, -1, 0]]))
*/
