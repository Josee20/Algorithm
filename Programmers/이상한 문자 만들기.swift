//
//  이상한 문자 만들기.swift
//  Algorithm
//
//  Created by 이동기 on 7/31/25.
//

import Foundation

class 이상한_문자_만들기 {
    func solution(_ s:String) -> String {
        return s.components(separatedBy: " ")
            .map { word in
                word.enumerated()
                    .map { (index, char) in
                        index % 2 == 0 ? char.uppercased() : char.lowercased()
                    }.joined()
            }
            .joined(separator: " ")
    }
    
    func solution2(_ s:String) -> String {
        var result = ""
        var index = 0
        
        for char in s {
            if char == " " {
                result += " "
                index = 0
            } else if index % 2 == 0 {
                result += char.uppercased()
                index += 1
            } else {
                result += char.lowercased()
                index += 1
            }
        }
        
        return result
    }
}

/* Testcase
 print(sol.solution2("try hello world"))
 print(sol.solution2("tr"))
 print(sol.solution2("tryhelloworld"))
 print(sol.solution2("t     a bc ddddddd"))
 */
