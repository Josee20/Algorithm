//
//  행렬의 곱셈.swift
//  Algorithm
//
//  Created by 이동기 on 7/29/25.
//

import Foundation

class 행렬의_곱셈 {
    func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
        let rowsArr1 = arr1.count
        let colsArr1 = arr1[0].count
        let colsArr2 = arr2[0].count
        var result = Array(repeating: Array(repeating: 0, count: colsArr2), count: rowsArr1)
        
        for i in 0..<rowsArr1 {
            for j in 0..<colsArr1 {
                for k in 0..<colsArr2 {
                    result[i][j] += arr1[i][k] * arr2[k][j]
                }
            }
        }
        
        return result
    }
}
/* Test case
 Input - arr1: [[1, 4], [3, 2], [4, 1]], arr2: [[3, 3], [3, 3]]
 Output - [[15, 15], [15, 15], [15, 15]]
 
 Input: - arr1: [[2, 3, 2], [4, 2, 4], [3, 1, 4]], arr2: [[5, 4, 3], [2, 4, 1], [3, 1, 1]]
 Output - [[22, 22, 11], [36, 28, 18], [29, 20, 14]]
*/
