# Dino Run

## Overview

This project implements a simple game called "Dino Run" on a Basys 3 FPGA Board using SystemVerilog. The game simulates a side-scrolling environment where a dinosaur character must jump or duck to avoid obstacles. The project involves designing and connecting several modules, including a state machine, random number generator, VGA timer, and various game objects, to create a fully functional game.

## Goals

- Implement a finite state machine (FSM) to control the game logic.
- Integrate multiple modules to manage game objects such as the dinosaur, obstacles (cacti and birds), and the score counter.
- Program the design onto a Basys 3 FPGA Board and display the game on a VGA monitor.

## Key Components

### 1. Random Number Generator
A Linear Feedback Shift Register (LFSR) was implemented to generate random numbers, which were used to determine obstacle spawn timing and characteristics such as bird height and cactus style.

### 2. Edge Detector
An edge detector module was utilized to generate a 1-cycle pulse on the rising edge of a signal, converting VGA vsync into a frame signal for synchronizing game object updates.

### 3. Title Screen
The title screen module was implemented to display the game title at the start. It disappears when the game begins, allowing obstacles to start spawning.

### 4. Obstacle Modules
Cacti and birds are the primary obstacles in the game. These obstacles are spawned at random intervals and move across the screen. They are instantiated using predefined modules that manage their appearance and behavior based on random inputs from the LFSR.

### 5. Dino Module
The dinosaur character's actions (running, jumping, ducking, and hit detection) are controlled by the dino module. The module updates the dinosaur's position and animation frame based on player inputs and game events.

### 6. Score Counter
A score counter module was used to keep track of the player's score, which increases as long as the dinosaur avoids obstacles. The score is displayed on a 7-segment display on the FPGA board.

### 7. VGA Timer
The VGA timer module was used to control the synchronization signals for the VGA display. It also managed the x and y coordinates, which were passed to the various game objects to determine their on-screen positions.

### 8. State Machine
The game's logic was controlled by a state machine, implemented according to the lowRISC SystemVerilog coding style guide. The state machine managed transitions between different game states, such as the title screen, game running, and game over states.

## Requirements

To run the Dino Run project, you will need the following:

### Hardware
- **Basys 3 FPGA Board**: The game is designed to run on this specific FPGA development board.
- **VGA Monitor**: Required to display the game output.
- **Micro-USB Cable**: To connect the Basys 3 board to your computer for programming and power.

### Software
- **Xilinx Vivado**: The project requires Xilinx Vivado Design Suite for synthesis, simulation, and programming of the FPGA board. Ensure you have Vivado installed and properly configured to work with the Basys 3 board.
- **SystemVerilog**: Familiarity with SystemVerilog is essential for understanding and modifying the project files.

## How to Run

To run the Dino Run game on your Basys 3 FPGA board, follow these steps:

1. **Clone the Repository**:
   - Clone the project repository from GitHub to your local machine.

   ```bash
   git clone https://github.com/yourusername/dino-run.git
   cd dino-run
   ```

2. **Open the Project in Vivado**:
   - Launch Xilinx Vivado.
   - Open the project by selecting `File > Open Project` and navigate to the `dino-run` directory.

3. **Synthesize the Design**:
   - In Vivado, click on the **Run Synthesis** button to synthesize the design. This process will check your SystemVerilog code and prepare it for implementation on the FPGA.

4. **Implement the Design**:
   - After synthesis, click on the **Run Implementation** button. This step maps your design onto the FPGA's resources and generates the necessary bitstream file.

5. **Generate the Bitstream**:
   - Once implementation is complete, click on the **Generate Bitstream** button. This creates the bitstream file (`.bit`) that will be loaded onto the FPGA.

6. **Program the FPGA**:
   - Connect your Basys 3 board to your computer using a micro-USB cable.
   - In Vivado, go to **Open Hardware Manager** and select **Open Target** followed by **Auto Connect**.
   - Click on **Program Device** and choose the generated bitstream file to load the game onto the FPGA.

7. **Connect the VGA Monitor**:
   - Connect a VGA monitor to the VGA port on the Basys 3 board.

8. **Play the Game**:
   - Use the buttons on the Basys 3 board to control the dinosaur:
     - **btnC**: Start the game.
     - **btnU**: Make the dinosaur jump.
     - **btnD**: Make the dinosaur duck.
     - **btnR**: Reset the game.

9. **Enjoy Dino Run**:
   - The game should now be running on your FPGA, with the display shown on the VGA monitor.

## Conclusion

This lab provided hands-on experience with designing and integrating various digital systems components on an FPGA. By completing this project, I developed a deeper understanding of state machines, VGA display control, and modular design in SystemVerilog. This project showcases my ability to tackle complex hardware design challenges and my proficiency in SystemVerilog, making it a valuable addition to my portfolio.

---

### Contact

For any questions or further information, please contact:

- **Paolo Pedroso**
- **Email:** [paoloapedroso@gmail.com](mailto:paoloapedroso@gmail.com)
- **GitHub:** [github.com/paolopedroso](https://github.com/paolopedroso)

---

Enjoy playing the "Dino Run" game!

---

CSE100 - Lab 5

Copyright ©2024 Martine Schlag and Ethan Sifferman.

All rights reserved. **Distribution Prohibited.**

---
