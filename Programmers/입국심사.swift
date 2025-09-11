//
//  입국심사.swift
//  Algorithm
//
//  Created by 이동기 on 9/11/25.
//

import Foundation

class 입국심사 {
    func solution(_ n:Int, _ times:[Int]) -> Int64 {
        let times = times.sorted()
        var maxTime = times.last! * n
        var minTime = 1
        var result = 0
        
        while minTime <= maxTime {
            let midTime = (minTime + maxTime) / 2
            var sum = 0
            
            times.forEach { time in
                sum += midTime / time
            }
            
            if sum < n {
                minTime = midTime + 1
            } else {
                maxTime = midTime - 1
                result = midTime
            }
        }
        
        return Int64(result)
    }
}
