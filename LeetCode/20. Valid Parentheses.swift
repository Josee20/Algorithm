//
//  20_ValidParentheses.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/24.
//

import Foundation

class ValidParentheses {
    func isValid(_ s: String) -> Bool {
        if s.count % 2 != 0 {
            return false
        }
        
        var stack: [Character] = []
        
        for char in s {
            switch char {
            case "(":
                stack.append(")")
            case "{":
                stack.append("}")
            case "[":
                stack.append("]")
            default:
                if stack.popLast() == char {
                    continue
                } else {
                    return false
                }
            }
        }
    
        return stack.isEmpty
    }
}

/* Testcase
 let validParentheses = ValidParentheses()
 print(validParentheses.isValid("()"))
 print(validParentheses.isValid("()[]{}"))
 print(validParentheses.isValid("(]"))
 print(validParentheses.isValid("([])"))
 */
