🎮 SkipBox
A Processing-based Frogger-style game where players guide a white box through traffic to reach the top of the screen while avoiding collisions. The game features dynamic difficulty scaling and a soundtrack that evolves with your score.

📖 Overview
SkipBox combines classic arcade gameplay with audio progression:
As you score points, the difficulty increases.
The background music changes to reflect your progress.

✨ Features
Progressive Difficulty: Game speed and obstacles increase as your score rises.
Dynamic Soundtrack: 6-level music system that evolves with your score.
Collision Detection: Rectangle-based system for player and obstacle interactions.
Multiple Game States: Intro, Objective, Gameplay, Pause, and Game Over screens.
Keyboard Controls: Arrow keys for smooth navigation.

🎯 Game Mechanics
Objective: Guide your white box from the bottom to the top white strip without hitting cars.
Scoring: Earn 10 points each time you reach the top.
Obstacles: Multi-row traffic system with varying speeds and directions.
Speed Scaling: Car speeds increase based on your current score.

🎮 Controls
Arrow Keys: Move the player (Up, Down, Left, Right)
S: Start game or restart after Game Over
O: View objectives (from intro screen)
R: Return to intro (from objectives screen)
P: Pause/Resume gameplay
E: Exit game (from Game Over screen)

📂 Project Structure
Game_Dev_Project_Sound/
├── Game_Dev_Project_Sound.pde    # Main game logic and state management
├── Player.pde                    # Player class extending Rectangle
├── Car.pde                       # Obstacle class extending Rectangle
├── Rectangle.pde                 # Base collision detection class
└── assets/                       # Sound files (level1-6.mp3, loading.wav)

⚙️ Dependencies
Processing 4.0+
Sound library (processing.sound)

🚀 Installation
Clone or download this repository.
Open Game_Dev_Project_Sound.pde in Processing.
Place audio files in the assets/ folder.
Run the sketch.

🎵 Audio Files Required
Place these files in the assets/ folder:
loading.wav → Loading sound
level1.mp3 through level6.mp3 → Level progression music

