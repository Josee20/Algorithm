//
//  37_SudokuSolver.swift
//  Algorithm
//
//  Created by 이동기 on 2025/03/16.
//

import Foundation

class SudoKuSolver {
    func solveSudoku(_ board: inout [[Character]]) {
        solve(&board)
        print(board)
    }
    
    @discardableResult
    func solve(_ board: inout [[Character]]) -> Bool {
        for row in 0..<9 {
            for column in 0..<9 {
                if board[row][column] == "." {
                    for num in "123456789" {
                        if isValid(row, column, num, board) {
                            board[row][column] = num
                            
                            if solve(&board) {
                                return true
                            } else {
                                board[row][column] = "."
                            }
                            
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    func isValid(_ row: Int, _ column: Int, _ num: Character, _ board: [[Character]]) -> Bool {
        for i in 0..<9 {
            if board[i][column] == num || board[row][i] == num {
                return false
            }
            
            let boxRow = i / 3 + (row / 3) * 3
            let boxColumn = i % 3 + (column / 3) * 3
            
            if board[boxRow][boxColumn] == num {
                return false
            }
        }
        
        return true
    }
}

/* Testcase
var board: [[Character]] = [
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
]

let sol = SudoKuSolver()
sol.solveSudoku(&board)
*/
