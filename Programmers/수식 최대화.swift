//
//  수식 최대화.swift
//  Algorithm
//
//  Created by 이동기 on 8/25/25.
//

import Foundation

class 수식_최대화 {
    func solution(_ expression:String) -> Int64 {
        var results: [Int] = []
        var operands: Set<String> = []
        
        expression.forEach {
            if $0 == "+" || $0 == "*" || $0 == "-" {
                operands.insert(String($0))
            }
        }
        
        var arr = [String]()
        var num = ""
            
        expression.forEach {
            if $0.isNumber {
                num += String($0)
            } else {
                arr.append(num)
                arr.append(String($0))
                num = ""
            }
        }
        
        arr.append(num)
        
        func makeCases(operands: [String]) -> [[String]] {
            var result: [[String]] = []
            var visited = Array(repeating: false, count: operands.count)
            
            func bt(operands: [String], arr: [String]) {
                if arr.count == operands.count {
                    result.append(arr)
                    return
                }
                
                var arr = arr
                
                for i in 0..<operands.count {
                    if !visited[i] {
                        visited[i] = true
                        arr.append(operands[i])
                        bt(operands: operands, arr: arr)
                        visited[i] = false
                        arr.removeLast()
                    }
                }
            }
            
            bt(operands: operands, arr: [])
            return result
        }
        
        let priorities = makeCases(operands: Array(operands))
        
        var newArr = arr
        
        priorities.forEach { priority in
            while newArr.count > 1 {
                priority.forEach { operand in
                    while newArr.contains(operand) {
                        let i = newArr.firstIndex(of: operand)!
                        var result = ""
                        
                        switch operand {
                        case "+":
                            result = String(Int(newArr[i - 1])! + Int(newArr[i + 1])!)
                        case "-":
                            result = String(Int(newArr[i - 1])! - Int(newArr[i + 1])!)
                        case "*":
                            result = String(Int(newArr[i - 1])! * Int(newArr[i + 1])!)
                        default:
                            break
                        }
                        
                        newArr.replaceSubrange(i-1...i+1, with: [result])
                    }
                }
            }
            
            results.append(abs(Int(newArr[0])!))
            newArr = arr
        }
        
        return Int64(results.max()!)
    }
}
