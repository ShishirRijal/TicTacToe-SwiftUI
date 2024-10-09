//
//  Game.swift
//  Tic-Tac-Toe
//
//  Created by Shishir Rijal on 09/10/2024.
//



import Foundation

/// Represents the two possible players in the game.
enum Player: String {
    case x = "X"
    case o = "O"
}

/// Represents a player's move in the game.
struct Move {
    let player: Player // The player making the move
    let boardIndex: Int // The index of the board where the move is made
}

/// Represents the game state and logic for Tic-Tac-Toe.
struct Game {
    var board = [String](repeating: "", count: 9) // The game board, initialized with empty strings
    var currentPlayer: Player = .x // The player whose turn it is to play
    
    /// Makes a move for the current player at the specified index.
    /// - Parameter index: The index on the board where the player wants to make a move.
    /// - Returns: `Void`. If the move is valid, updates the board and switches the current player.
    mutating func makeMove(at index: Int) {
        // Ensure the selected index is empty before making a move
        guard board[index].isEmpty else { return }
        // Place the current player's symbol on the board
        board[index] = currentPlayer.rawValue
        // Switch to the next player
        currentPlayer = currentPlayer == .x ? .o : .x
    }
    
    /// Checks if there is a winner.
    /// - Returns: The winning player if there is one, otherwise `nil`.
    func checkWinner() -> Player? {
        // Define the winning patterns (combinations of board indices)
        let winPatterns: Set<Set<Int>> = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontal
            [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertical
            [0, 4, 8], [2, 4, 6] // Diagonal
        ]
        
        // Check each winning pattern
        for pattern in winPatterns {
            let values = pattern.map { board[$0] }
            // Check if all values in the pattern are "X"
            if values.allSatisfy({ $0 == "X" }) {
                return .x // Player X wins
            }
            // Check if all values in the pattern are "O"
            else if values.allSatisfy({ $0 == "O" }) {
                return .o // Player O wins
            }
        }
        return nil // No winner found
    }
    
    /// Checks if the game board is full.
    /// - Returns: `true` if the board is full (no empty spaces), otherwise `false`.
    func isBoardFull() -> Bool {
        return !board.contains("") // Returns true if there are no empty strings in the board
    }
}
