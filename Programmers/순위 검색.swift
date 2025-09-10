//
//  순위 검색.swift
//  Algorithm
//
//  Created by 이동기 on 9/10/25.
//

import Foundation

class 순위_검색 {
    func solution(_ info:[String], _ query:[String]) -> [Int] {
        var result: [Int] = []
        var cases: [String: [Int]] = [:]
        
        for info in info {
            let info = info.components(separatedBy: " ")
            let lang = [info[0], "-"]
            let job = [info[1], "-"]
            let career = [info[2], "-"]
            let food = [info[3], "-"]
            
            var scores: [Int] = []
            
            for lang in lang {
                for job in job {
                    for career in career {
                        for food in food {
                            let key = lang + job + career + food
                            let score = Int(info[4])!
                            scores.append(score)
                            
                            if let _ = cases[key] {
                                cases[key]?.append(score)
                            } else {
                                cases[key] = [score]
                            }
                        }
                    }
                }
            }
        }
        
        cases.keys.forEach { cases[$0]?.sort() }
        
        for query in query {
            var query = query.components(separatedBy: " ").filter { $0 != "and" }
            let score = Int(query.popLast()!)!
            
            guard let scores = cases[query.joined()] else {
                result.append(0)
                continue
            }
            
            var low = 0
            var high = scores.count - 1
            var mid = 0
            
            while low <= high {
                mid = (low + high) / 2
                
                if scores[mid] < score {
                    low = mid + 1
                } else {
                    high = mid - 1
                }
            }
            
            result.append(scores.count - low)
        }
        
        return result
    }
}
