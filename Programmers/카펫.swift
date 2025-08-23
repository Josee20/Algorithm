//
//  카펫.swift
//  Algorithm
//
//  Created by 이동기 on 8/22/25.
//

import Foundation

class 카펫 {
    func solution(_ brown:Int, _ yellow:Int) -> [Int] {
        
        func findSize(_ brown: Int, _ yellow: Int) -> [Int] {
            for divider in 1...Int(sqrt(Double(yellow))) {
                if yellow % divider == 0 {
                    let width = yellow / divider
                    let height = divider
                    
                    if (width + 2) * (height + 2) - (width * height) == brown {
                        return [width + 2, height + 2]
                    }
                }
            }
            
            return []
        }
        
        
        return findSize(brown, yellow)
    }
}
