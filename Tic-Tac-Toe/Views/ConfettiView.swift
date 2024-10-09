//
//  ConfettiView.swift
//  Tic-Tac-Toe
//
//  Created by Shishir Rijal on 09/10/2024.
//

import SwiftUI

struct ConfettiPiece: View {
    let color: Color
    @State private var xPosition: CGFloat
    @State private var yPosition: CGFloat
    @State private var rotation: Double
    
    init(color: Color) {
        self.color = color
        _xPosition = State(initialValue: CGFloat.random(in: 0...UIScreen.main.bounds.width))
        _yPosition = State(initialValue: -100) // Start further above the screen
        _rotation = State(initialValue: Double.random(in: 0...360))
    }
    
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(width: 5, height: 20)
            .rotationEffect(.degrees(rotation))
            .position(x: xPosition, y: yPosition)
            .onAppear {
                fall(in: UIScreen.main.bounds.size)
            }
    }
    
    private func fall(in size: CGSize) {
        let duration = Double.random(in: 4...6)
        withAnimation(Animation.linear(duration: duration).repeatForever(autoreverses: false)) {
            yPosition = size.height + 50 // Falls to the bottom of the screen
            rotation += Double.random(in: 720...1080)
            xPosition += CGFloat.random(in: -50...50) // Adds some horizontal motion
        }
    }
}



struct ConfettiView: View {
    @Binding var isShowing: Bool
    let colors: [Color] = [.red, .blue, .green, .yellow, .pink, .purple, .orange]
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<100, id: \.self) { index in
                    ConfettiPiece(color: colors.randomElement()!)
                        .onAppear {
                            // Each piece has a very small staggered delay
                            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.01) {
                                // No need for extra logic here, the animation starts with onAppear
                            }
                        }
                }
            }
            .opacity(isShowing ? 1 : 0)
        }
    }
}
