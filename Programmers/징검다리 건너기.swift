//
//  징검다리 거넌기.swift
//  Algorithm
//
//  Created by 이동기 on 9/14/25.
//

import Foundation

class 징검다리_건너기 {
    func solution(_ stones:[Int], _ k:Int) -> Int {
        var left = 0
        var right = 200_000_000
        
        while left <= right {
            let mid = (left + right) / 2
            var cnt = 0
            
            for i in 0..<stones.count {
                if stones[i] - mid <= 0 {
                    cnt += 1
                } else {
                    cnt = 0
                }
                
                if cnt >= k {
                    break
                }
            }
            
            if cnt < k {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return left
    }
}
