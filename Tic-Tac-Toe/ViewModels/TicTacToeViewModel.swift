//
//  TicTacToeViewModel.swift
//  Tic-Tac-Toe
//
//  Created by Shishir Rijal on 09/10/2024.
//

import SwiftUI

class TicTacToeViewModel: ObservableObject {
    @Published private var game = Game()
    @Published var isGameOver = false
    @Published var winnerMessage = ""
    
    var board: [String] {
        return game.board
    }
    
    var currentPlayer: Player {
        return game.currentPlayer
    }
    
    func makeMove(at index: Int) {
        game.makeMove(at: index)
        checkGameStatus()
    }
    
    func checkGameStatus() {
        if let winner = game.checkWinner() {
            winnerMessage = "Player \(winner.rawValue) wins!"
            isGameOver = true
        } else if game.isBoardFull() {
            winnerMessage = "It's a draw!"
            isGameOver = true
        }
    }
    
    func restartGame() {
        game = Game()
        isGameOver = false
        winnerMessage = ""
    }
}
