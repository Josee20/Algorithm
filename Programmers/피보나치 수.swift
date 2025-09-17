//
//  피보나치 수.swift
//  Algorithm
//
//  Created by 이동기 on 9/17/25.
//

import Foundation

class 피보나치_수 {
    func solution1(_ n:Int) -> Int {
        if n <= 1 { return n }
        var memo = Array(repeating: -1, count: n + 1)
        memo[0] = 0
        memo[1] = 1
        
        func fibo(_ n: Int) -> Int {
            if memo[n] != -1 { return memo[n] }
            memo[n] = (fibo(n - 1) + fibo(n - 2)) % 1234567
            return memo[n]
        }

        return fibo(n)
    }
    
    func solution2(_ n:Int) -> Int {
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
}
