//
//  main.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/16.
//

import Foundation

func solution(_ n:Int) -> Int {
    if n <= 1 { return n }
    
    let divisor = 1234567
    var a = 0
    var b = 1
    
    for _ in 2...n {
        let c = (a + b) % divisor
        a = b
        b = c
    }
    
    return b
}
print(solution(50))
print(solution(2))

