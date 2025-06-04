//
//  32. Longest Valid Parentheses.swift
//  Algorithm
//
//  Created by 이동기 on 6/4/25.
//

import Foundation

class LongestValidParentheses {
    
    func longestValidParentheses(_ s: String) -> Int {
        var maxLength = 0
        var stack: [Int] = [-1] // 인덱스 저장, -1로 시작하는 이유는 최초 "("가 나왔을 경우 처리가 편함
 
        for (i, char) in s.enumerated() {
            if char == "(" {
                stack.append(i)
            } else {
                let _ = stack.popLast()
                
                if let last = stack.last {
                    maxLength = max(maxLength, i - last)
                } else {
                    stack.append(i)
                }
            }
        }
        
        return maxLength
    }
}

/* Testcase
 let sol = LongestValidParentheses()
 print(sol.longestValidParentheses("(()")) // 2
 print(sol.longestValidParentheses(")()())")) // 4
 print(sol.longestValidParentheses("()(()")) // 2
 print(sol.longestValidParentheses("(())")) // 0
 */
