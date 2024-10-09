# 🎮 Tic-Tac-Toe | A SwiftUI Implementation
A simple Tic-Tac-Toe game built using Swift and SwiftUI. The project is structured using the MVVM (Model-View-ViewModel) pattern, which separates concerns for better code organization and scalability.
It's a sleek, modern take on the classic paper and pen game, built with SwiftUI and infused with dazzling visual effects. 

## 🌟 Features
- **Two-player Mode**: Play the classic game of Tic-Tac-Toe with two players taking turns as "X" and "O".
- **Stunning UI**: Immerse yourself in a futuristic interface that makes every move feel epic.
- **MVVM Architecture**: Built on a rock-solid foundation for smooth performance and easy extensibility.
- **Confetti Celebration**: Win a game, and watch as a cascade of colorful confetti rains down to mark your victory!
- **Responsive Design**: Looks great on all iOS devices, from the smallest iPhone to the largest iPad.

## 🚀 Getting Started

### Prerequisites

- Xcode 13.0 or later
- iOS 15.0 or later
- Swift 5.5 or later

### Installation

1. Clone this repository:
   ```
   git clone https://github.com/ShishirRijal/TicTacToe-SwiftUI.git
   ```
2. Open `Tic-Tac-Toe.xcodeproj` in Xcode.
3. Build and run the project on your desired simulator or device.

## 🎯 How to Play

1. Launch the app and marvel at the sleek design.
2. Tap on any empty cell to place your mark (X or O).
3. Aim to get three of your marks in a row (horizontally, vertically, or diagonally).
4. Win the game and bask in the glory of the confetti shower!
5. Hit "Play Again" to start a new match and chase that confetti high once more.

## 🏗 Project Structure
The project follows the **MVVM** pattern:
- **Views:** Handles the UI rendering.
  - `TicTacToeView`: Main game board and player interaction.
  - `ConfettiView`: Renders celebratory confetti when a player wins.
- **ViewModels:** Manages game logic and state.
  - `TicTacToeViewModel`: Handles the game's business logic, manages moves, and communicates with the view.
- **Models:** Represents the game's data structures.
  - `Game`: Encapsulates game state, logic for checking winners, and player moves.

### File Overview:
```
📂 Tic-Tac-Toe
├── 📂 Views
│ ├── TicTacToeView.swift 
│ ├── ConfettiView.swift
├── 📂 ViewModels
│ ├── TicTacToeViewModel.swift 
├── 📂 Models
│ ├── Game.swift 
├── Tic_Tac_ToeApp.swift # App entry point
├── ContentView.swift 
```

## 🤝 Contributing

We welcome contributions! If you have ideas for improvements or find any bugs, please open an issue or submit a pull request.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 🤹 Future Improvements
- **Single-player Mode:** Implement a basic AI for a one-player mode.
- **Sound Effects:** Add sound effects for moves and wins to enhance the game experience.
- **Leaderboard:** Implement a scoreboard to track player wins.

## 📱 Screenshots
<img width="326" alt="Screenshot 2024-10-09 at 5 28 47 PM" src="https://github.com/user-attachments/assets/4be7dd8f-ea6b-46b5-b889-38c310d3aed9">
<img width="330" alt="Screenshot 2024-10-09 at 5 31 14 PM" src="https://github.com/user-attachments/assets/2ade47dc-9daa-42cb-9c46-d768574c4bab">
<img width="327" alt="Screenshot 2024-10-09 at 5 29 33 PM" src="https://github.com/user-attachments/assets/d1629a47-1318-4285-b91e-d6a49f20dec8">
<img width="324" alt="Screenshot 2024-10-09 at 5 30 01 PM" src="https://github.com/user-attachments/assets/3107c8df-8c17-4837-8626-7bbe36630e9d">



