//
//  자물쇠와 열쇠.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/23.
//

import Foundation

class LockAndKey {
    func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
        if (lock.filter { $0.contains(0) }).isEmpty {
            return true
        }
        
        let N = lock.count
        let M = key.count
        
        var extendedLock: [[Int]] = Array(repeating: Array(repeating: 0, count: N * 3), count: N * 3)
        
        for i in 0..<N {
            for j in 0..<N {
                extendedLock[N + i][N + j] = lock[i][j]
            }
        }
        
        var tempKey = key
        var tempLock = extendedLock
        
        for _ in 0..<4 {
            for i in (N - M + 1)..<N * 2 {
                for j in (N - M + 1)..<N * 2 {
                    tempLock = extendedLock
                    
                    for row in 0..<M {
                        for col in 0..<M {
                            tempLock[i + row][j + col] += tempKey[row][col]
                        }
                    }
                    
                    if canOpen(N, tempLock) {
                        return true
                    }
                }
            }
            tempKey = rotateKey(tempKey)
        }
        
        return false
    }
    
    func canOpen(_ n: Int, _ lock: [[Int]]) -> Bool {
        for i in n..<n * 2 {
            for j in n..<n * 2 {
                if lock[i][j] != 1 {
                    return false
                }
            }
        }
        return true
    }
    
    func rotateKey(_ key: [[Int]]) -> [[Int]]{
        let m = key.count
        var rotatedKey = Array(repeating: Array(repeating: 0, count: m), count: m)
        
        for col in 0..<m {
            for row in 0..<m {
                rotatedKey[row][m - col - 1] = key[col][row]
            }
        }
        return rotatedKey
    }
}

/* Testcase
 let key: [[Int]] = [
 [0, 0, 0],
 [1, 0, 0],
 [0, 1, 1]
 ]
 
 let lock: [[Int]] = [
 [1, 1, 1],
 [1, 1, 0],
 [1, 0, 1]
 ]
 
 let lockAndKey = LockAndKey()
 print(lockAndKey.rotateKey(key))
 print(lockAndKey.solution(key, lock))
 */
