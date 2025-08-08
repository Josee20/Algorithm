//
//  숫자 문자열과 영단어.swift
//  Algorithm
//
//  Created by 이동기 on 8/8/25.
//

import Foundation

class 숫자_문자열과_영단어 {
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
