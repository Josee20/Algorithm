//
//  이진 변환 반복하기.swift
//  Algorithm
//
//  Created by 이동기 on 8/7/25.
//

import Foundation

class 이진_변환_반복하기 {
    func solution(_ s:String) -> [Int] {
        var s = s
        var removeCnt = 0
        var convertCnt = 0
        
        func getCount(_ s: String) -> Int {
            var cnt = 0
            
            for char in s {
                if char == "0" {
                    removeCnt += 1
                } else {
                    cnt += 1
                }
            }
            
            return cnt
        }
        
        func makeBinary(_ num: Int) -> String {
            convertCnt += 1
            
            var num = num
            var binary = 0
            var multiplier = 1
            
            while num > 0 {
                binary += num % 2 * multiplier
                num /= 2
                multiplier *= 10
            }
            
            return String(binary)
        }
        
        while s != "1" {
            let cnt = getCount(s)
            let binaryStr = makeBinary(cnt)
            s = binaryStr
        }
        
        return [convertCnt, removeCnt]
    }
}

/*
 Input: "110010101001", Output: [3,8]
 Input: "01110", Output: [3,3]
 Input: "1111111", Output: [4,1]
 */
