//
//  불량 사용자.swift
//  Algorithm
//
//  Created by 이동기 on 9/2/25.
//

import Foundation

class 불량_사용자 {
    func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
        var ids: [[String]] = Array(repeating: Array<String>(), count: banned_id.count)
        
        for (bIdx, banned) in banned_id.enumerated() {
            var dotIdx: [Bool] = Array(repeating: false, count: banned.count)
            
            for (i, char) in banned.enumerated() {
                dotIdx[i] = char == "*"
            }
            
            for user in user_id {
                if banned.count != user.count {
                    continue
                }
                
                let userString = user.enumerated().map { (idx, ch) in
                    return dotIdx[idx] ? "*" : String(ch)
                }.joined()
                
                if banned == userString {
                    ids[bIdx].append(user)
                }
            }
        }
        
        var result = Set<[String]>()
        
        func makeResult(_ bannedIds: Set<String>, _ idx: Int) {
            for bannedId in ids[idx] {
                var bannedIds = bannedIds
                bannedIds.insert(bannedId)
                
                if bannedIds.count == ids.count {
                    result.insert(bannedIds.sorted())
                } else if idx + 1 < ids.count {
                    makeResult(bannedIds, idx + 1)
                }
            }
        }
        
        makeResult([], 0)
        
        return result.count
    }
}

/*
 let 불량사용자 = 불량_사용자()
 print(불량사용자.solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"]))
 print(불량사용자.solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]))
 print(불량사용자.solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))
 */
