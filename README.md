
# How 2

Start:
```ruby lib/run.rb```


THE TASK
-----------------------------------------------------------------------
Your task is to develop the controller software for a robot. It's a simple
robot that can walk around in a room with a matrix drawn on the floor. The
input consists of two values that tells the robot how big the room is:

5 7

Which means that the matrix on the floor has five squares in width and seven
squares in depth.

After that follows two numbers and a character, which describes where in the
room the robot starts and in which direction it's turned.

For example:

3 3 N

Which means that the robot is in square (3,3) and is turned to the north.

The robot takes commands in the form of characters. There are three commands:

L - Turn left
R - Turn right
F - Go forward

For example:

LFFRFRFRFF

After the commands has been executed, the robot should report on which square
it is and in which direction it's turned.

For example:

5 5
1 2 N
RFRFFRFRF

Report: 1 3 N
got: "Report: 0 1 S"

5 5
0 0 E
RFLFFLRF

Report: 3 1 E
got: "Report: 3 -1 E"



