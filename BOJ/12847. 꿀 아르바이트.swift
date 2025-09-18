//
//  꿀 아르바이트.swift
//  Algorithm
//
//  Created by 이동기 on 9/18/25.
//

import Foundation

func 꿀_아르바이트() {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    let arr = readLine()!.components(separatedBy: " ").map { Int($0)! }


    var sum = arr[0..<m].reduce(0, +)
    var result = sum

    for i in m..<n {
        sum += arr[i] - arr[i - m]
        result = max(result, sum)
    }

    print(result)
}
