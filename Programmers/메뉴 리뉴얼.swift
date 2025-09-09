//
//  메뉴 리뉴얼.swift
//  Algorithm
//
//  Created by 이동기 on 9/8/25.
//

import Foundation

class 메뉴_리뉴얼 {
    func solution(_ orders:[String], _ course:[Int]) -> [String] {
        var combs: [String] = []
        var dict: [String: Int] = [:]
        var result: [String] = []

        func makeComb(_ str: String, _ k: Int) -> [String] {
            if k == 0 { return [""] }
            if str.isEmpty { return [] }

            var result: [String] = []
            let head = str[str.startIndex]
            let subcomb = makeComb(String(str.dropFirst()), k - 1)
            for comb in subcomb {
                result.append(String(([head] + comb).sorted()))
            }
            result += makeComb(String(str.dropFirst()), k).sorted()
            return result
        }

        for order in orders {
            for c in course {
                combs.append(contentsOf: makeComb(order, c))
            }
        }

        for comb in combs {
            if let value = dict[comb] {
                dict.updateValue(value + 1, forKey: comb)
            } else {
                dict.updateValue(1, forKey: comb)
            }
        }

        for c in course {
            let dict = dict.filter { $0.key.count == c && $0.value >= 2 }
            let maxValue = dict.max(by: { $0.value < $1.value })?.value
            let keys = dict.filter { $0.value == maxValue }.keys
            result.append(contentsOf: keys)
        }

        return result.sorted()
    }
}
