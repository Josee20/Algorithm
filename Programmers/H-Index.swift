//
//  H-Index.swift
//  Algorithm
//
//  Created by 이동기 on 9/3/25.
//

import Foundation

class HIndex {
    func solution(_ citations:[Int]) -> Int {
        if citations.isEmpty { return 0 }

        let sorted = citations.sorted(by: >)

        var h = 0
        
        for (i, c) in sorted.enumerated() {
            if c >= i + 1 {
                h = i + 1
            } else {
                break
            }
        }
        
        return h
    }
}
