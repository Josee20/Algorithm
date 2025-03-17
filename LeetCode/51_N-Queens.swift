//
//  51_N-Queens.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/18.
//

import Foundation

class N_Queens {
    func solveNQueens(_ n: Int) -> [[String]] {
        var answer: [[String]] = []
        var check1: [Bool] = Array(repeating: false, count: n)
        var check2: [Bool] = Array(repeating: false, count: (n - 1) * 2 + 1)
        var check3: [Bool] = Array(repeating: false, count: (n - 1) * 2 + 1)
        var board: [[String]] = Array(repeating: Array(repeating: ".", count: n), count: n)
        bt(0, board, &check1, &check2, &check3, &answer)
        return answer
    }

    func bt(_ row: Int, _ board: [[String]], _ check1: inout [Bool], _ check2: inout [Bool], _ check3: inout [Bool], _ answer: inout [[String]]) {
        var board = board
        let n = board.count

        if row == n {
            answer.append(board.map { $0.joined() })
            return
        }

        for column in 0..<n {
            if !check1[column] && !check2[row + column] && !check3[row - column + n - 1] {
                check1[column] = true
                check2[row + column] = true
                check3[row - column + n - 1] = true
                board[row][column] = "Q"
                bt(row + 1, board, &check1, &check2, &check3, &answer)
                check1[column] = false
                check2[row + column] = false
                check3[row - column + n - 1] = false
                board[row][column] = "."
            }
        }
    }
}

/*Test case
 let nqueen = N_Queens()
 print(nqueen.solveNQueens(4))
 print(nqueen.solveNQueens(1))
 */
