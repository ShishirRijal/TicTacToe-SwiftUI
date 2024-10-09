//
//  Game.swift
//  Tic-Tac-Toe
//
//  Created by Shishir Rijal on 09/10/2024.
//
import Foundation

enum Player: String {
    case x = "X"
    case o = "O"
}

struct Move {
    let player: Player
    let boardIndex: Int
}

struct Game {
    var board = [String](repeating: "", count: 9)
    var currentPlayer: Player = .x
    
    mutating func makeMove(at index: Int) {
        guard board[index].isEmpty else { return }
        board[index] = currentPlayer.rawValue
        currentPlayer = currentPlayer == .x ? .o : .x
    }
    
    func checkWinner() -> Player? {
        let winPatterns: Set<Set<Int>> = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
        
        for pattern in winPatterns {
            let values = pattern.map { board[$0] }
            if values.allSatisfy({ $0 == "X" }) {
                return .x
            } else if values.allSatisfy({ $0 == "O" }) {
                return .o
            }
        }
        return nil
    }
    
    func isBoardFull() -> Bool {
        return !board.contains("")
    }
}
