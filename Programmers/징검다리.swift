//
//  징검다리.swift
//  Algorithm
//
//  Created by 이동기 on 9/12/25.
//

import Foundation

class 징검다리 {
    func solution(_ distance:Int, _ rocks:[Int], _ n:Int) -> Int {
        var positions = rocks.sorted()
        positions.append(distance)
        var left = 1
        var right = distance
        var answer = 0
        
        while left <= right {
            let mid = (left + right) / 2
            var removed = 0
            var prev = 0
            for p in positions {
                if p - prev < mid {
                    removed += 1
                    
                    if removed > n {
                        break
                    }
                } else {
                    prev = p
                }
            }
            
            if removed <= n {
                answer = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return answer 
    }
}
