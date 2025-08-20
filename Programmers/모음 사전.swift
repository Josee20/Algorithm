//
//  모음 사전.swift
//  Algorithm
//
//  Created by 이동기 on 8/19/25.
//

import Foundation

class 모음_사전 {
    func solution(_ word:String) -> Int {
        var result: [String] = []
        let str = "AEIOU"
        let maxDepth = 4
        
        func comb(_ depth: Int, _ word: String) {
            result.append(word)
            
            if depth >= maxDepth {
                return
            }
            
            for char in str {
                comb(depth + 1, word + String(char))
            }
            
            return
        }
        
        for char in str {
            comb(0, String(char))
        }
        
        return result.firstIndex(of: word)! + 1
    }
}
