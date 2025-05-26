//
//  12865. 평범한 배낭.swift
//  Algorithm
//
//  Created by 이동기 on 5/10/25.
//

import Foundation

func 평범한_배낭() {
    struct Item {
        var weight: Int
        var value: Int
    }
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let k = input[1]

    var items: [Item] = [Item(weight: 0, value: 0)]
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)

    for _ in 1...n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        items.append(Item(weight: input[0], value: input[1]))
    }

    for i in 1...n {
        for j in 0...k {
            if j < items[i].weight {
                dp[i][j] = dp[i - 1][j]
            } else {
                dp[i][j] = max(dp[i - 1][j], items[i].value + dp[i - 1][j - items[i].weight])
            }
        }
    }

    print(dp[n][k])
}

func 평범한_배낭2() {
    struct Item {
        var weight: Int
        var value: Int
    }
    
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let k = input[1]

    var items: [Item] = []
    var memo: [[Int]] = Array(repeating: Array(repeating: -1, count: k + 1), count: n + 1)

    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        items.append(Item(weight: input[0], value: input[1]))
    }
    
    func knapsack(_ i: Int, _ weight: Int) -> Int {
        if i == n { return 0 }
        if memo[i][weight] != -1 { return memo[i][weight] }
        
        let item = items[i]
        
        var result = knapsack(i + 1, weight)
        
        if weight + item.weight <= k {
            result = max(result, knapsack(i + 1, weight + item.weight) + item.value)
        }
        
        memo[i][weight] = result
        return memo[i][weight]
    }
    
    print(knapsack(0, 0))
}

/* Test case
 
 Input
 4 7
 6 13
 4 8
 3 6
 5 12
 
 Output
 14
 
 */
