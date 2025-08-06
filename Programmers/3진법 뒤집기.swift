//
//  3진법 뒤집기.swift
//  Algorithm
//
//  Created by 이동기 on 8/6/25.
//

import Foundation

class 삼진법_뒤집기 {
    func solution(_ n:Int) -> Int {
        func makeTrinaryDigit(_ n: Int) -> [Int] {
            var n = n
            var arr: [Int] = []
            
            while n > 0 {
                arr.append(n % 3)
                n /= 3
            }
                
            return arr.reversed()
        }
        
        var result = 0
        var multiplier = 1
        
        for num in makeTrinaryDigit(n) {
            result += num * multiplier
            multiplier *= 3
        }
        
        return result
    }
}

/*
 Input: 45, Output: 7
 Input: 125, Output: 229
 */
