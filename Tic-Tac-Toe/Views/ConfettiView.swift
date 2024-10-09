//
//  ConfettiView.swift
//  Tic-Tac-Toe
//
//  Created by Shishir Rijal on 09/10/2024.
//

import SwiftUI

/// A single piece of confetti that falls from the top of the screen.
struct ConfettiPiece: View {
    let color: Color // Color of the confetti piece
    @State private var xPosition: CGFloat // X position of the confetti piece
    @State private var yPosition: CGFloat // Y position of the confetti piece
    @State private var rotation: Double // Rotation angle of the confetti piece

    /// Initializes a new ConfettiPiece with a random position and rotation.
    init(color: Color) {
        self.color = color
        _xPosition = State(initialValue: CGFloat.random(in: 0...UIScreen.main.bounds.width)) // Random X position within screen bounds
        _yPosition = State(initialValue: -100) // Start further above the screen
        _rotation = State(initialValue: Double.random(in: 0...360)) // Random rotation angle
    }
    
    var body: some View {
        Rectangle() // Shape of the confetti piece
            .fill(color) // Fill the rectangle with the specified color
            .frame(width: 5, height: 20) // Dimensions of the confetti piece
            .rotationEffect(.degrees(rotation)) // Rotate the piece
            .position(x: xPosition, y: yPosition) // Set the position based on calculated coordinates
            .onAppear {
                fall(in: UIScreen.main.bounds.size) // Start the falling animation when the view appears
            }
    }
    
    /// Makes the confetti piece fall down the screen with horizontal motion.
    /// - Parameter size: The size of the screen for calculating animation parameters.
    private func fall(in size: CGSize) {
        let duration = Double.random(in: 4...6) // Random fall duration for each piece
        withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
            yPosition = size.height + 50 // Set the final Y position to below the screen
            rotation += Double.random(in: 720...1080) // Randomly rotate the piece during the fall
            xPosition += CGFloat.random(in: -50...50) // Add some horizontal movement during the fall
        }
    }
}

/// A view that displays multiple confetti pieces falling from the top of the screen.
struct ConfettiView: View {
    @Binding var isShowing: Bool // Binding to control the visibility of the confetti
    let colors: [Color] = [.red, .blue, .green, .yellow, .pink, .purple, .orange] // Array of colors for confetti pieces
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Create 100 pieces of confetti
                ForEach(0..<100, id: \.self) { index in
                    ConfettiPiece(color: colors.randomElement()!) // Create a confetti piece with a random color
                        .onAppear {
                            // Each piece has a very small staggered delay
                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.01) {
                                // The animation starts with onAppear, no extra logic needed here
                            }
                        }
                }
            }
            .opacity(isShowing ? 1 : 0) // Control the opacity based on isShowing
        }
    }
}
