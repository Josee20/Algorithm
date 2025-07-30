//
//  자연수 뒤집어 배열로 만들기.swift
//  Algorithm
//
//  Created by 이동기 on 7/30/25.
//

import Foundation

class 자연수_뒤집어_배열로_만들기 {
    func solution(_ n:Int64) -> [Int] {
        return String(n).reversed().compactMap { Int(String($0)) }
    }
}
