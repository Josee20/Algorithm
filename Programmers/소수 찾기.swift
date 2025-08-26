//
//  소수 찾기.swift
//  Algorithm
//
//  Created by 이동기 on 8/26/25.
//

import Foundation

class 소수_찾기 {
    func solution(_ numbers:String) -> Int {
        var result = 0
        var numberList: [Int] = []
        var visited = Array(repeating: false, count: numbers.count)
        
        func getPerm(_ numbers: String, _ str: String, _ idx: Int) {
            if idx > numbers.count {
                return
            }
            
            var str = str
            
            if let strNum = Int(str) {
                if strNum != 0 && strNum != 1 && !numberList.contains(strNum) {
                    numberList.append(strNum)
                }
            }
            
            for (i, number) in numbers.enumerated() {
                if !visited[i] {
                    visited[i] = true
                    str += String(number)
                    getPerm(numbers, str, idx + 1)
                    visited[i] = false
                    str.removeLast()
                }
            }
        }
        
        func isPrime(num: Int) -> Bool {
            var cnt = 0
            
            for i in 1...Int(sqrt(Double(num))) {
                if num % i == 0 {
                    cnt += 1
                }
            }
            
            return cnt == 1 ? true : false
        }
        
        getPerm(numbers, "", 0)
        
        for number in numberList {
            if isPrime(num: number) {
                result += 1
            }
        }
        
        return result
    }
}
