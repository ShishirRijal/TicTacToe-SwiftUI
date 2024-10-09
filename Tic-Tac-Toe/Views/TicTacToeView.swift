//
//  TicTacToeView.swift
//  Tic-Tac-Toe
//
//  Created by Shishir Rijal on 09/10/2024.
//

import SwiftUI

struct TicTacToeView: View {
    @StateObject private var viewModel = TicTacToeViewModel()
    @Namespace private var animation
    @State private var showConfetti = false
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Tic Tac Toe")
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
                            
                            Text(viewModel.board[index])
                                .font(.system(size: 40, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .matchedGeometryEffect(id: "cell\(index)", in: animation)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                viewModel.makeMove(at: index)
                            }
                        }
                    }
                }
                .padding()
                
                Text("Current Player: \(viewModel.currentPlayer.rawValue)")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
            
            ConfettiView(isShowing: $showConfetti)
        }
        .overlay(
            Group {
                if viewModel.isGameOver {
                    Color.black.opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                    
                    VStack {
                        Text(viewModel.winnerMessage)
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
                                viewModel.restartGame()
                                showConfetti = false
                            }
                        }) {
                            Text("Play Again")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green)
                                .cornerRadius(15)
                        }
                    }
                    .transition(.scale)
                }
            }
        )
        .onChange(of: viewModel.isGameOver) { newValue in
            if newValue && viewModel.winnerMessage.contains("wins") {
                showConfetti = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TicTacToeView()
    }
}
