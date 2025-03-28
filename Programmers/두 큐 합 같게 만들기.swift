//
//  두 큐 합 같게 만들기.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/28.
//

import Foundation

class MakeThSumOfTwoQueuesEqual {
    func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
        var arr = queue1 + queue2
        var answer: Int = 0
        
        var left = 0
        var right = queue1.count
        
        var queue1Sum: Int = queue1.reduce(0, +)
        let queue2Sum: Int = queue2.reduce(0, +)
        let goal: Int = (queue1Sum + queue2Sum) / 2
        
        if (queue1Sum + queue2Sum) % 2 != 0 {
            return -1
        }
        
        if queue1.max()! > goal || queue2.max()! > goal {
            return -1
        }
        
        while left < right && right < arr.count {
            if queue1Sum > goal {
                queue1Sum -= arr[left]
                left += 1
            } else if queue1Sum < goal {
                queue1Sum += arr[right]
                right += 1
            } else {
                break
            }
            answer += 1
        }
        
        if queue1Sum != goal {
            return -1
        }
        
        return answer
    }
}

/* Testcase
let makeThSumOfTwoQueuesEqual = MakeThSumOfTwoQueuesEqual()
print(makeThSumOfTwoQueuesEqual.solution([3, 2, 7, 2], [4, 6, 5, 1]))
print(makeThSumOfTwoQueuesEqual.solution([1, 2, 1, 2], [1, 10, 1, 2]))
print(makeThSumOfTwoQueuesEqual.solution([1, 1], [1, 5]))
 */
