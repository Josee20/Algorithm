//
//  main.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/16.
//

import Foundation



//solution()

var emptySpaces: [(Int, Int)] = [
    (0, 0), (0, 1), (0, 2),
    (1, 0), (1, 1),
    (2, 0)
]

func combinations<T>(_ array: [T], _ k: Int) -> [[T]] {
    if k == 0 { return [[]] }
    if array.isEmpty { return [] }
    
    var result = [[T]]()
    let head = array[0]
    let subcomb = combinations(Array(array.dropFirst()), k - 1)
    print(subcomb)
    for comb in subcomb {
        result.append([head] + comb)
    }
    result += combinations(Array(array.dropFirst()), k)
    return result
}

let wallCombinations = combinations(emptySpaces, 3)
//print(wallCombinations)
// 1. 먼저 벽을 세움
// 2. 바이러스(2번 찾아) 0이면 2로 전부 바꿈
// 3. 0번 순회하면서 0번 count
