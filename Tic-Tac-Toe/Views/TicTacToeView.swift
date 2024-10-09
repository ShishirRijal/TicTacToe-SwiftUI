//
//  TicTacToeView.swift
//  Tic-Tac-Toe
//
//  Created by Shishir Rijal on 09/10/2024.
//


import SwiftUI

/// View for displaying the Tic-Tac-Toe game.
struct TicTacToeView: View {
    @StateObject private var viewModel = TicTacToeViewModel() // ViewModel for managing game logic
    @Namespace private var animation // For matched geometry effect animations
    @State private var showConfetti = false // Flag to control confetti display
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tic Tac Toe") // Game title
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                // Game board
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                    ForEach(0..<9) { index in
                        ZStack {
                            Circle()
                                .fill(Color.white.opacity(0.2))
                                .aspectRatio(1, contentMode: .fit)
                            
                            Text(viewModel.board[index]) // Display player mark (X or O)
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .matchedGeometryEffect(id: "cell\(index)", in: animation) // Match geometry for animation
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                viewModel.makeMove(at: index) // Make a move on tap
                            }
                        }
                    }
                }
                .padding()
                
                Text("Current Player: \(viewModel.currentPlayer.rawValue)") // Show current player
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
            
            ConfettiView(isShowing: $showConfetti) // Confetti view for celebration
        }
        .overlay(
            Group {
                if viewModel.isGameOver {
                    Color.black.opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity) // Overlay for game over state
                    
                    VStack {
                        Text(viewModel.winnerMessage) // Show winner or draw message
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                        
                        Image(systemName: viewModel.winnerMessage.contains("wins") ? "trophy.fill" : "hand.raised.fill")
                            .font(.system(size: 60))
                            .foregroundColor(.yellow)
                            .padding()
                        
                        Button(action: {
                            withAnimation {
                                viewModel.restartGame() // Restart the game
                                showConfetti = false // Hide confetti
                            }
                        }) {
                            Text("Play Again") // Button to restart the game
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(15)
                        }
                    }
                    .transition(.scale) // Transition effect for game over overlay
                }
            }
        )
        .onChange(of: viewModel.isGameOver) { isGameOver in
            if isGameOver && viewModel.winnerMessage.contains("wins") {
                showConfetti = true // Show confetti if there's a winner
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView() 
    }
}
