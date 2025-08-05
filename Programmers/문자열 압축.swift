//
//  문자열 압축.swift
//  Algorithm
//
//  Created by 이동기 on 8/5/25.
//

import Foundation

class 문자열_압축 {
    func solution(_ s:String) -> Int {
        func slicedArr(n: Int, s: String) -> [String] {
            var arr: [String] = []
            var tmp = ""
            
            for char in s {
                tmp += String(char)
                
                if tmp.count == n {
                    arr.append(tmp)
                    tmp = ""
                }
            }
            
            if tmp != "" {
                arr.append(tmp)
            }
            
            return arr
        }
        
        func zippedStr(_ arr: [String]) -> String {
            var result = ""
            var tmp = ""
            var cnt = 1
            
            for str in arr {
                if tmp == str {
                    cnt += 1
                    continue
                } else {
                    result += cnt > 1 ? "\(cnt)\(tmp)" : tmp
                    tmp = ""
                    cnt = 1
                }
                
                tmp = str
            }
            
            if tmp != "" {
                result += cnt > 1 ? "\(cnt)\(tmp)" : tmp
            }
            
            return result
        }
            
        var result = s.count
        
        if result < 3 { return result }
        
        for i in 1...s.count / 2 {
            result = min(result, zippedStr(slicedArr(n: i, s: s)).count)
        }
        
        return result
    }
}

/*
 let sol = 문자열_압축()
 print(sol.solution("aabbaccc"))
 print(sol.solution("aaa"))
 print(sol.solution("ababcdcdababcdcd"))
 print(sol.solution("abcabcdede"))
 print(sol.solution("abcabcabcabcdededededede"))
 print(sol.solution("xababcdcdababcdcd"))
 */
