//
//  하노이의 탑.swift
//  Algorithm
//
//  Created by 이동기 on 8/18/25.
//

import Foundation

class 하노이의_탑 {
    func solution(_ n:Int) -> [[Int]] {
        var answer: [[Int]] = []
        
        func hanoi(n: Int, from: Int, to: Int, via: Int) {
            if n == 1 {
                answer.append([from, to])
                return
            }
            
            hanoi(n: n - 1, from: from, to: via, via: to)
            answer.append([from, to])
            hanoi(n: n - 1, from: via, to: to, via: from)
        }
        
        hanoi(n: n, from: 1, to: 3, via: 2)
        
        return answer
    }
}
