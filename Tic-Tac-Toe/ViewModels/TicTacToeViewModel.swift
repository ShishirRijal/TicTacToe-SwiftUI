//
//  TicTacToeViewModel.swift
//  Tic-Tac-Toe
//
//  Created by Shishir Rijal on 09/10/2024.
//


import SwiftUI

/// ViewModel for managing the state and logic of the Tic-Tac-Toe game.
class TicTacToeViewModel: ObservableObject {
    @Published private var game = Game() // The game instance managing the board state
    @Published var isGameOver = false // Flag to indicate if the game has ended
    @Published var winnerMessage = "" // Message to display the winner or draw
    
    /// Returns the current state of the game board.
    var board: [String] {
        return game.board // Expose the game board to the view
    }
    
    /// Returns the current player.
    var currentPlayer: Player {
        return game.currentPlayer // Expose the current player to the view
    }
    
    /// Makes a move at the specified index and checks the game status.
    /// - Parameter index: The index on the board where the player wants to make a move.
    func makeMove(at index: Int) {
        game.makeMove(at: index) // Call the game logic to make a move
        checkGameStatus() // Check if the game has a winner or is a draw
    }
    
    /// Checks the current game status to determine if there is a winner or if the game is a draw.
    func checkGameStatus() {
        // Check for a winner
        if let winner = game.checkWinner() {
            winnerMessage = "Player \(winner.rawValue) wins!" // Set winner message
            isGameOver = true // Mark the game as over
        }
        // Check if the board is full (draw)
        else if game.isBoardFull() {
            winnerMessage = "It's a draw!" // Set draw message
            isGameOver = true // Mark the game as over
        }
    }
    
    /// Restarts the game to its initial state.
    func restartGame() {
        game = Game() // Create a new game instance
        isGameOver = false // Reset game over flag
        winnerMessage = "" // Clear any winner message
    }
}
