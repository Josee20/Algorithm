//
//  739_Daily Temperatures.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/26.
//

import Foundation

class DailyTemperatures {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var answer: [Int] = Array(repeating: 0, count: temperatures.count)
        var stack: [Int] = []

        for (i, t) in temperatures.enumerated() {
            while !stack.isEmpty && t > temperatures[stack.last!] {
                let pop = stack.popLast()!
                answer[pop] = i - pop
            }

            stack.append(i)
        }

        return answer
    }
}

/* Testcase
 let dailyTemperatures = DailyTemperatures()
 print(dailyTemperatures.dailyTemperatures([73,74,75,71,69,72,76,73]))
 print(dailyTemperatures.dailyTemperatures([30, 40, 50, 60]))
 print(dailyTemperatures.dailyTemperatures([30,60,90]))
 */
