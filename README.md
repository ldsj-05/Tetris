Project Name
FPGA Tetreex

Team Members
Carly Butler, Leah Jones, Sarah Koesema, Hieu Nguyen

Demo Video Link

Overview
Inspired by the classic 1980s puzzle game Tetris, we decided to create a version of the game using what we learned in EC311. Our edition uses button input for player controls, the seven segment display to keep track of score, and shows graphics on a monitor using VGA display.

How to Run
Needed:
Nexys A7 FPGA Board
VGA Cable
Download all required files and set topmodule and topmodule_tb as top. 


Player Controls:
Right Button: Shift Right
Left Button: Shift Left
Down Button: Fast Drop Down
Center Button: Rotate

Code Structure


Seven-Segment Display

-Displays current user score

-Testbench: tb_seven_seg_display.v


Score Module

-Set the difficulty level, increasing as the score increases. Implemented a restart and game over condition based on the height of the blocks (i.e the user reaches the top and loses). Gives bonus based on the amount of lines cleared and displays on the Seven-Segment display.

-Testbench: ScoreModule_tb.v


VGA

-Visual Display of our Tetris game. showing both our game board and our 7 different shaped blocks. 

-Testbench: vga_tb.v


Constraint File 


Random Number Generator

-Increments a counter on the clock to generate a number 1-7 that will be unpredictable to the user

-Testbench: randomnumgen_tb.v


Shape Select

-Uses input from number generator to assign a piece to one of seven configurations

-Testbench: shapeselect_tb.v


Make Shape 

-Assigns a position for each shape based on the user input rotation scheme

-Testbench: makeshape_tb.v


Next Block

-Allows a new number to be generated if the game doesn’t end

-Testbench: next_tb.v


Rotate FSM

-Counts the number of times the user has pressed rotate in a row

-Testbench: rotatefsm_tb.v

Button

-Connects button input to shift left, shift right, and rotate (with debouncer)


Clock Divider 

-Checks two counters and determines whether to toggle the clock signal for the VGA Display and Game logic. 

-Testbench: game_clock_tb.v


Collision Detection

-Set the grid specifications and detects the collision between both the grid and other blocks 

-Testbench: collision_tb.v


Top

-Combines all modules into an overall game module

-Testbench: top_tb.v

	

