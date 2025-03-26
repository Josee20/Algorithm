//
//  131_PalindromePartioning.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/11.
//

import Foundation

class PalindromePartioning {
    func partition(_ s: String) -> [[String]] {
        var answer: [[String]] = []
        backtrack(curr: [], start: 0, answer: &answer, str: s)
        return answer
    }
    
    func backtrack(curr: [String], start: Int, answer: inout [[String]], str: String) {
        var curr = curr
        var chars = Array(str)
        
        if start == str.count {
            answer.append(curr)
            return
        }
        
        for i in start..<str.count {
            let subString = String(chars[start...i])
            
            if isValid(str: subString) {
                curr.append(subString)
                backtrack(curr: curr, start: i + 1, answer: &answer, str: str)
                curr.removeLast()
            }
        }
    }
    
    func isValid(str: String) -> Bool {
        return str == String(str.reversed())
    }
}
