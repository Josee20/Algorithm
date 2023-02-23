//
//  게임개발.swift
//  algorithmpractice
//
//  Created by 이동기 on 2023/02/11.
//

import Foundation

let mapSize = readLine()!.components(separatedBy: " ").map { Int($0)! }
let positionAndDirection = readLine()!.components(separatedBy: " ").map { Int($0)! }

let N = mapSize[0] // 가로
let M = mapSize[1] // 세로
var (x, y) = (positionAndDirection[0], positionAndDirection[1]) // 내 현재 위치
let sea = 1 // 바다는 1
let land = 0 // 육지는 0
let visitedLand = -1 // 방문한 육지는 -1

// 북동남서 정의
var dx = [-1, 0, 1, 0]
var dy = [0, 1, 0, -1]
var nx = 0
var ny = 0

var myDirection = positionAndDirection[2] // 처음 내가 바라보는 방향
var twoDimensionArr: [[Int]] = [[]] // 지형 종류(땅 or 바다)

for _ in 0..<M {
    let input = readLine()!.components(separatedBy: " ").map { Int(String($0))! }
    twoDimensionArr += Array(repeating: input, count: 1)
}
twoDimensionArr.remove(at: 0) // 계속 2차원 배열 index 0에 빈 배열이 생겨서 지워줌

func turnLeft() {
    switch myDirection {
    case 0: // 북쪽이면 서쪽으로
        myDirection = 3
    case 1: // 동쪽이면 북쪽으로
        myDirection = 0
    case 2: // 남쪽이면 동쪽으로
        myDirection = 1
    case 3: // 서쪽이면 남쪽으로
        myDirection = 2
    default:
        myDirection = 0
    }
}

var count = 1
var turnTime = 0 // 턴한 횟수

while true {
    turnLeft()
    nx = x + dx[myDirection] // 내가 움직일 곳의 x좌표
    ny = y + dy[myDirection] // 내가 움직일 곳의 y좌표
    
    if nx >= N - 1 || ny > M - 1 {
        continue
    }
    
    // 이동할 곳이 땅인 경우
    if twoDimensionArr[nx][ny] == land {
        (x, y) = (nx, ny)
        twoDimensionArr[x][y] = visitedLand
        count += 1
        turnTime = 0

    // 이동할 곳이 방문한 땅이거나 바다인 경우
    } else {
        turnTime += 1
        
        if turnTime == 4 {
            // 4방향 다 봤을 때 못가면 뒤의 좌표가 바다인지 방문한땅인지 확인해줘야한다.
            nx = x - dx[myDirection] - dy[myDirection] // 현재 내 뒤의 X좌표
            ny = y - dy[myDirection] - dx[myDirection] // 현재 내 뒤의 Y좌표
            
            if nx < 0 || ny < 0 {
                continue
            }
            
            if twoDimensionArr[nx][ny] == visitedLand {
                (x, y) = (nx, ny)
            } else {
                break
            }
            turnTime = 0
        }
    }
}

print(count)
