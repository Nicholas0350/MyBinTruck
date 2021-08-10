# Bin Truck Simulator

## Instructions

- Read the problem description thoroughly then create a program to solve it.
- For the solution, we prefer you to use Ruby.
- There is no requirement for visualising this in any way beyond the output specified below.
- Provide a README with instructions to test and run the program. Note any key design thoughts or assumptions you’ve made during development.
- While this is a small problem, we expect you to submit what you believe is production quality code​. That is code that you would be happy to test, run, maintain, and evolve.
- To submit your code: create a git bundle and send to us via email. Please do not​publish the code in public repositories
- Provide test data to exercise the application.

## Problem Description

- The application is a simulation of a bin truck moving on a square-based neighbourhood, of dimensions 7 units x 7 units.
- There are no other obstructions on the neighbourhood surface.
  
- The truck is free to drive around the surface of neighborhood, but must prevent from leaving the area. Any movement that would result in the truck must be prevented, however further valid movement commands must still be allowed.
- The truck can only drive forward, not backwards.

Create an application that can read_in_commands of the following (textual) form:
PARK X,Y,F
DRIVE
LEFT
RIGHT
PICKUP
CALLCENTRAL
 
- PARK will put the bin truck on the garage in position X,Y and facing NORTH, SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the truck is a PARK command, after that, any sequence of commands may be issued, in any order, including another PARK command. The application should discard all commands in the sequence until
a valid PARK command has been executed.

- DRIVE will move the truck one unit forward in the direction it is currently facing.
- LEFT and RIGHT will manouver the truck 90 degrees in the specified direction without changing the position of the truck.

- CALLCENTRAL will announce the X,Y and F of the truck. This can be in any form, but standard output is sufficient.

- PICKUP will output the position X,Y of the bin at the left of the truck with the sayings: “BIN PICKED AT X,Y”.
- Input can be from a file, or from standard input, as the developer chooses.

## Constraints

- The bin truck must not leave the neighborhood during movement. This also includes the initial park of the truck. Any move that would cause the truck to fall must be ignored.
- A truck that is not in the neighbourhood can the ignore the DRIVE, LEFT, RIGHT and CALLCENTRAL commands.

# Example Input and Output

### Example A
```
PARK 0,0,NORTH
DRIVE
CALLCENTRAL
```
output:
```
0,1,NORTH
```

### Example B
```
PARK 0,0,NORTH
RIGHT
DRIVE
CALLCENTRAL
```
output:

```
1,0,EAST
```
PICKUP

output:
```
BIN PICKED AT 1,1
```

### Example 3
```
PARK 1,2,EAST
DRIVE
DRIVE
LEFT
DRIVE
CALLCENTRAL
```
output
```
3,3,NORTH
```
PICKUP

output
```
BIN OICKED AT 2,3
```
