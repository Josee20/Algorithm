//
//  문자열 내 p와 y의 개수.swift
//  Algorithm
//
//  Created by 이동기 on 8/8/25.
//

import Foundation

func solution(_ s:String) -> Bool
{
    let pCnt = s.filter { $0 == "p" || $0 == "P"}.count
    let yCnt = s.filter { $0 == "y" || $0 == "Y"}.count
    return pCnt == yCnt
}
