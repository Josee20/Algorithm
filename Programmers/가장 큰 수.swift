//
//  가장 큰 수.swift
//  Algorithm
//
//  Created by 이동기 on 9/6/25.
//

import Foundation

class 가장_큰_수 {
    func solution(_ numbers:[Int]) -> String {
        let result = numbers.map { String($0) }.sorted { $0 + $1 > $1 + $0 }.joined()
        return result.first == "0" ? "0" : result
    }
}
