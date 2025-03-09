//
//  60_Permutation Sequence.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/09.
//

import Foundation

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var answer = ""
        var numbers = Array(1...n)
        var k = k - 1
        var factorial = (1...n).reduce(1, *)
        
        for i in stride(from: n, to: 0, by: -1) {
            factorial /= i
            let index = k / factorial
            answer += String(numbers[index])
            numbers.remove(at: index)
            k %= factorial
        }
        
        return answer
    }
}

/* Testcase
let sol = Solution()
sol.getPermutation(3, 3)
sol.getPermutation(4, 9)
sol.getPermutation(3, 1)
 */
