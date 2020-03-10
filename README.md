# Toy Robot Simulator

## Description

- The application is a simulation of a toy robot moving on a **Table**, of dimensions **5 units x 5 units**.
- There are no other obstructions on the table surface.
  
- The **robot** is free to **def_roam** around the **:surface** of SquareTabletop, but must prevent from  **falling_to_destruction.**. Any **def_movement** that would result in the **robot falling from the table** must be prevented, however further  **:valid_movement_commands** must still be allowed.
Create an application that can **read_in_commands** of the following (textual) form:
**PLACE X,Y,F
MOVE LEFT
MOVE RIGHT
REPORT**
- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
SOUTH, EAST or WEST.
- The **origin** (0,0) can be considered to be the **SOUTH WEST** most corner.
- The first valid command to the robot is a **PLACE** command, after that, any
sequence of commands may be issued, in any order, including another **PLACE**
command. The application should discard all commands in the sequence until
a valid **PLACE** command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is
currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form,
but standard output is sufficient.
- A robot that is not on the table can choose the **ignore** the **MOVE**, **LEFT**, **RIGHT**
and **REPORT** commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.
- The application must be a command line application.

## Constraints


- The toy robot must not fall off the table during movement. This also
includes the **initial placement** of the toy robot.
- Any move that would cause the robot to fall must be ignored.
Example Input and Output


### Example 1
```
PLACE 0,0,NORTH
MOVE SOUTH
REPORT
```

Expected output:
```
1,0,SOUTH
```

### Example 2
```
PLACE 0,0,NORTH
MOVE WEST
REPORT
```
Expected output:

```
0,1,WEST
```

### Example 3
```
PLACE 1,2,EAST
MOVE EAST
MOVE EAST
REPORT
```
Expected output
```
1,4,EAST
```

## Deliverables

Please provide your source code, and any test code/data you using in developing your solution. Please engineer your solution to a standard you consider suitable for production. It is not required to provide any graphical output showing the movement of the toy robot. Please do not put your name in any of the submitted code since this makes it harder for us to review your submission anonymously.
