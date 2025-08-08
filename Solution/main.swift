//
//  main.swift
//  Algorithm
//
//  Created by 이동기 on 2025/02/16.
//

import Foundation

class Main {
    func solution(_ s:String) -> Int {
        var result: String = ""
        let dict: [String: String] = [
            "zero": "0",
            "one": "1",
            "two": "2",
            "three": "3",
            "four": "4",
            "five": "5",
            "six": "6",
            "seven": "7",
            "eight": "8",
            "nine": "9"
        ]
        
        var str = ""
        
        for char in s {
            str += String(char)
            
            if let numStr = dict[str] {
                result += numStr
                str = ""
            } else if char.isNumber {
                result += String(char)
                str = ""
            }
        }
        
        return Int(result)!
    }
}

let main = Main()
print(main.solution("one4seveneight"))
print(main.solution("23four5six7"))
print(main.solution("2three45sixseven"))
print(main.solution("123"))
