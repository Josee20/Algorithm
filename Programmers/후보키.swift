//
//  후보키.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/02.
//

import Foundation

class CandidateKey {
    func isUnique(relation: [[String]], columns: [Int]) -> Bool {
        var uniqueColumns: Set<String> = []
        
        for row in relation {
            var rowInfo = ""
            
            for column in columns {
                rowInfo += row[column]
            }
            
            if uniqueColumns.contains(rowInfo) {
                return false
            }
            
            uniqueColumns.insert(rowInfo)
        }
        
        return true
    }

    func isMinimal(relation: [[String]], columns: [Int]) -> Bool {
        for i in 1..<columns.count {
            var allCombs: [[Int]] = []
            
            makeComb(attributes: columns, comb: [], allCombs: &allCombs, combSize: i, start: 0, maxLength: columns.count)
            
            for attr in allCombs {
                if isUnique(relation: relation, columns: attr) {
                    return false
                }
            }
        }
        
        return true
    }


    func makeComb(attributes: [Int], comb: [Int], allCombs: inout [[Int]], combSize: Int, start: Int, maxLength: Int) {
        var comb = comb
        
        if comb.count == combSize {
            allCombs.append(comb)
            return
        }
        
        for i in start..<maxLength {
            comb.append(attributes[i])
            makeComb(attributes: attributes, comb: comb, allCombs: &allCombs, combSize: combSize, start: i + 1, maxLength: maxLength)
            comb.removeLast()
        }
        
    }

    func candidateKey(_ relation:[[String]]) -> Int {
        var ans = 0
        let colLength = relation[0].count
        
        for i in 1...colLength {
            var allCombs: [[Int]] = []
            
            makeComb(attributes: Array(0..<colLength), comb: [], allCombs: &allCombs, combSize: i, start: 0, maxLength: colLength)
            
            for columns in allCombs {
                if isUnique(relation: relation, columns: columns) && isMinimal(relation: relation, columns: columns) {
                    ans += 1
                }
            }
        }
        
        return ans
    }
}



/* Testcase
 let relation = [
 ["100","ryan","music","2"],
 ["200","apeach","math","2"],
 ["300","tube","computer","3"],
 ["400","con","computer","4"],
 ["500","muzi","music","3"],
 ["600","apeach","music","2"]
 ]
 
 print(candidateKey(relation))
 */
