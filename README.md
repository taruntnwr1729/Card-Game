# Card Game App

This is a simple two-player card game that I built while learning SwiftUI and iOS development in Xcode.

The goal of this project was not just to make a game, but to understand how user interfaces, state management, and program logic work together in a real iOS application. Before this project, I mostly wrote small pieces of code individually, but this was one of the first times I connected everything together into a complete interactive app.

The game works by generating two random cards whenever the player presses the **Deal** button. The player with the higher card earns a point, and the first player to reach 10 points wins the game. After someone wins, the scores reset automatically so the game can start again.

<p align="center">
  <img src="https://github.com/user-attachments/assets/cf3ad02e-ea8c-49f4-9395-43c0685028bc" width="300" title="SwiftCard Duel - Starting State" alt="Gameplay screen showing the wooden board with two facedown cards and 0-0 scores.">
  <img src="https://github.com/user-attachments/assets/bade2759-3363-4268-a4a8-8f0bc2ddef26" width="300" title="SwiftCard Duel - Player 1 Wins State" alt="Gameplay screen showing the wooden board with two faceup cards (King vs 10), Player 1 with 10 points, and the 'Player 1 WINS' console confirmation message.">
</p>

---

#  How the Game Works

The gameplay is intentionally simple so that I could focus on learning SwiftUI concepts and application logic.

### Game Flow

1. The app starts with two default card images.
2. When the **Deal** button is pressed:

   * Two random cards are generated
   * The card images update instantly
   * Scores are updated depending on which player received the higher card
3. If both players receive the same card value, both players receive one point.
4. Once a player reaches 10 points:

   * A winner is declared
   * The game resets automatically
   * Scores return to zero

---

#  Technologies Used

* Swift
* SwiftUI
* Xcode

---

# User Interface Design

The UI was built completely using SwiftUI.

I used:

* `ZStack` for layering the background and game elements
* `VStack` to arrange content vertically
* `HStack` to place cards and player scores side by side
* `Spacer()` to control spacing and alignment

I also experimented with:

* custom background images
* shadows
* rounded rectangles
* image-based textures

to make the game feel visually interesting instead of looking like a basic tutorial project.

---

# What I Learned From This Project

This project taught me many important concepts about iOS development and SwiftUI.

---

## 1. State Management in SwiftUI

One of the biggest things I learned was how SwiftUI updates the screen automatically whenever a state variable changes.

For example:

```swift id="f8wm8d"
@State var PlayerScore1 = 0
@State var PlayerScore2 = 0
```

Whenever these values change, SwiftUI automatically refreshes the UI without needing manual updates.

This helped me understand how reactive UI frameworks work.

---

## 2. Connecting Buttons With Logic

I learned how user interaction triggers functions inside SwiftUI.

```swift id="f1m6lt"
Button() {
    dealCards()
}
```

When the button is pressed, the `dealCards()` function runs and updates:

* the card images
* the scores
* the win condition

This made the app feel truly interactive.

---

## 3. Random Number Generation

To simulate drawing cards, I used random values:

```swift id="m8r3ah"
Int.random(in: 2...14)
```

This helped me understand:

* randomness in programming
* variable updates
* dynamic UI rendering

---

## 4. Conditional Logic

I practiced writing conditional statements to compare cards and determine the winner of each round.

```swift id="n2r7qp"
if PlayerValue1 > PlayerValue2
```

I also implemented:

* tie conditions
* score tracking
* game reset logic

which made me think more like a game developer instead of just writing isolated code.

---

## 5. Structuring SwiftUI Layouts

At first, arranging UI elements properly was confusing, but this project helped me understand how layouts work in SwiftUI.

I learned:

* when to use `VStack`
* when to use `HStack`
* how `Spacer()` affects positioning
* how nested stacks help build complex layouts

This was one of the most useful learning experiences from the project.

---

## 6. Thinking About Real App Design

While building the game, I started thinking beyond just functionality.

I began asking questions like:

* How should the UI feel?
* Where should buttons be placed?
* What makes an app look polished?
* How can backgrounds improve the experience?

That mindset made the project feel much more creative and enjoyable.

---

# 📂 Project Structure

```bash id="hh0l24"
Card Game/
│
├── ContentView.swift
├── Assets.xcassets
├── Card GameApp.swift
└── README.md
```

---

#  Running the Project

### Requirements

* macOS
* Xcode installed

### Steps

1. Clone the repository

```bash id="u9xy6m"
git clone https://github.com/yourusername/card-game.git
```

2. Open the project in Xcode

3. Run the app using:

* iPhone Simulator
* or a real iPhone device

---

#  Future Improvements

There are many things I would like to improve in the future:

* Add smoother card animations
* Add sound effects
* Add a proper win screen
* Create an AI opponent
* Add multiplayer support
* Improve overall UI polish
* Add themes and different card designs

---

#  Developer

Created by Tarun Tanwar while learning SwiftUI and iOS app development.

This project helped me move from just learning syntax to actually building something interactive and visual.
