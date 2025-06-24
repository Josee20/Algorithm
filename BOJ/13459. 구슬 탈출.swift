//
//  13459. 구슬 탈출.swift
//  Algorithm
//
//  Created by 이동기 on 6/21/25.
//

import Foundation

func 구슬_탈출() {
    struct Point: Equatable {
        let x: Int
        let y: Int

        static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.x == rhs.x && lhs.y == rhs.y
        }
    }

    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    let dx: [Int] = [-1, 0, 1, 0]
    let dy: [Int] = [0, -1, 0, 1]

    var board: [[String]] = []
    var red = Point(x: 0, y: 0)
    var blue = Point(x: 0, y: 0)

    for i in 0..<n {
        var row = readLine()!.map { String($0) }

        for j in 0..<m {
            if row[j] == "B" {
                row[j] = "."
                blue = Point(x: i, y: j)
            } else if row[j] == "R" {
                row [j] = "."
                red = Point(x: i, y: j)
            }
        }

        board.append(row)
    }

    func move(_ first: Point, _ second: Point, _ i: Int) -> (Point, Point) {
        var nf = first
        var ns = second
        
        while true {
            let first = Point(x: nf.x + dx[i], y: nf.y + dy[i])
            if first.x < 0 || first.y < 0 || first.x >= n || first.y >= m || board[first.x][first.y] == "#" {
                break
            }
            
            nf = first
            
            if board[first.x][first.y] == "O" {
                break
            }
        }
        
        while true {
            let second = Point(x: ns.x + dx[i], y: ns.y + dy[i])
            if second.x < 0 || second.y < 0 || second.x >= n || second.y >= m || board[second.x][second.y] == "#" {
                break
            }
            
            if second == nf && board[second.x][second.y] != "O" {
                break
            }
            
            ns = second
            
            if board[second.x][second.y] == "O" {
                break
            }
        }
        
        return (nf, ns)
    }

    func bfs() -> Int {
        var queue: [(red: Point, blue: Point, move: Int)] = [(red, blue, 0)]
        var visited = Array(repeating: Array(repeating: Array(repeating: Array(repeating: false, count: m), count: n), count: m), count: n)
        visited[red.x][red.y][blue.x][blue.y] = true
        var idx = 0
        
        while queue.count > idx {
            let (red, blue, moveCnt) = queue[idx]
            idx += 1
            
            if moveCnt >= 10 { return 0 }
            
            for i in 0..<4 {
                var nr = red
                var nb = blue
                
                switch i {
                case 0: // up
                    if red.x > blue.x {
                        (nb, nr) = move(blue, red, i)
                    } else {
                        (nr, nb) = move(red, blue, i)
                    }
                case 1: // left
                    if red.y > blue.y {
                        (nb, nr) = move(blue, red, i)
                    } else {
                        (nr, nb) = move(red, blue, i)
                    }
                case 2: // down
                    if red.x > blue.x {
                        (nr, nb) = move(red, blue, i)
                    } else {
                        (nb, nr) = move(blue, red, i)
                    }
                case 3: // right
                    if red.y > blue.y {
                        (nr, nb) = move(red, blue, i)
                    } else {
                        (nb, nr) = move(blue, red, i)
                    }
                default:
                    break
                }
            
                if visited[nr.x][nr.y][nb.x][nb.y] { continue }
                if board[nr.x][nr.y] == "O" && board[nb.x][nb.y] != "O" {
                    return 1
                } else if board[nr.x][nr.y] == "." && board[nb.x][nb.y] == "." {
                    queue.append((nr, nb, moveCnt + 1))
                    visited[nr.x][nr.y][nb.x][nb.y] = true
                }
            }
        }
        
        return 0
    }

    print(bfs())
}

/* Textcase
 Input
 3 10
 ##########
 #.O....RB#
 ##########
 
 Output
 0
 */
