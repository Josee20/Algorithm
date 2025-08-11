//
//  신규 아이디 추천.swift
//  Algorithm
//
//  Created by 이동기 on 8/11/25.
//

import Foundation

class 신규_아이디_추천 {
    func solution(_ new_id:String) -> String {
        func removeContinousComma(_ str: String) -> String {
            var result = ""
            var commas = ""
            
            for char in str {
                if char == "." {
                    if commas.isEmpty {
                        result.append(".")
                        commas += "."
                    } else {
                        continue
                    }
                } else {
                    result.append(char)
                    commas = ""
                }
            }
            
            return result
        }
        
        var result = new_id.lowercased() // 1. 소문자 치환
        let speicalChars = "-_."
        result.removeAll(where: { !$0.isNumber && !$0.isLowercase && !speicalChars.contains($0) }) // 2. 소문자, 숫자, 허용된 특수문자 뺴고 삭제
        result = removeContinousComma(result)
        
        if result.first == "." { result.removeFirst() }
        if result.last == "." { result.removeLast() }
        
        if result.isEmpty {
            result += "a"
        }
        
        if result.count > 15 {
            let endIndex = result.index(result.startIndex, offsetBy: 15)
            result = String(result[result.startIndex..<endIndex])
        }
        
        if result.first == "." { result.removeFirst() }
        if result.last == "." { result.removeLast() }
        
        if result.count <= 2 {
            while result.count < 3 {
                result += String(result.last!)
            }
        }
        
        return result
    }
}
