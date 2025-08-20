//
//  모의고사.swift
//  Algorithm
//
//  Created by 이동기 on 8/20/25.
//

import Foundation

class 모의고사 {
    func solution(_ answers:[Int]) -> [Int] {
        var result: [Int] = []
        var ansCntList: [Int] = [0, 0, 0]
        
        let first = [1, 2, 3, 4, 5]
        let second = [2, 1, 2, 3, 2, 4, 2, 5]
        let third = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
        
        for (idx, answer) in answers.enumerated() {
            if answer == first[idx % first.count] {
                ansCntList[0] += 1
            }
            
            if answer == second[idx % second.count] {
                ansCntList[1] += 1
            }
            
            if answer == third[idx % third.count] {
                ansCntList[2] += 1
            }
        }
        
        let max = ansCntList.max()

        for (idx, value) in ansCntList.enumerated() {
            if max == value {
                result.append(idx + 1)
            }
        }
        
        return result
    }
}
