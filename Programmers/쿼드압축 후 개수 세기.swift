//
//  쿼드압축 후 개수 세기.swift
//  Algorithm
//
//  Created by 이동기 on 8/12/25.
//

import Foundation

class 쿼드압축_후_개수_세기 {
    func solution(_ arr:[[Int]]) -> [Int] {
        var zeroCnt = 0
        var oneCnt = 0
        
        func compress(_ row: Int, _ col: Int, _ length: Int) {
            let start = arr[row][col]
            
            for i in row..<row + length {
                for j in col..<col + length {
                    if start != arr[i][j] {
                        let half = length / 2
                        compress(row, col, half)
                        compress(row, col + half, half)
                        compress(row + half, col, half)
                        compress(row + half, col + half, half)
                        return
                    }
                }
            }
            
            if start == 0 {
                zeroCnt += 1
            } else {
                oneCnt += 1
            }
        }
        
        compress(0, 0, arr.count)
        
        return [zeroCnt, oneCnt]
    }
}
