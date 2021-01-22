/* Reflection

Name :                       Michael Kelly

Student Number:              20041540

Link to Video:                https://youtu.be/-iI_qjLm5x8


Part A - Mark (3 /5)
-----------------------------

Includsion of completed Readme and Reflection, and Video

3/5


Part B - Mark (4 /5)
-----------------------------

Comments, indentation, naming, structure of code, etc.

<4/5>


Part C - Mark (4 /5)
-----------------------------
Use of if and loop statements:

line 78 to check if total points is to progress in game
line 89 to check thge collision
line 95 to check collision
line 116 if's and else if's to check what level the user entered
line 163 to check if the user wants to proceed to next level
line 164 nested else if's to see what level the user on and to move to the next
line 190 to check if else it was cancel on the eneter name dialog box
line 193 a nested else if's for validation
line 215 as a checker to see which button button pressed


for loops used on:

line 85 to send back to the constructor the values for each ballon in the array
line 129 to draw enemies
line 137 to draw bullets

Bullet class
line 21 to check if x was less than 0
line 28 to check that y didnt meet its boundry if so reset
line 40 to stop the bullet automatically shooting when game starts

Destroyer Class
line 18 to check if x less than zero
line 21 to reset x if it moves off screen
line 52 to set the width if needed
line 60 to set the height depending on what user enters
line 20 to check if the enemy has hit the bottom of the screen
line 31 to display the ballons if collision didnt happen

Part D - Mark (5 /5)
-----------------------------
Working game with inclusion of bespoke methods in the main sketch.

bespoke method:

reset() on line 114 to 146
gameOver() on line 148 to 155
warningMsg() on line 157 to 179
welcomeInput() on line 181 to 207
youLost() on line 209 to 221
...


Part E1 - Mark (10 /10)
-----------------------------
User-defined class with appropriate fields, constructors, getters, setters

class named Bullet
class named Destroyer
class named Enemy
class named User
...


Part E2 - Mark (14 /15)
-----------------------------

Class bespoke methods:
Bullet
update() on line 18 to 24
reset() on line 26 to 30
start() on line 32 to 36
display() on line 38 to 46

Destroyer
update() on line 15 to 24
display() on line 26 to 30

Enemy
gameReset() on line 18 to 23
display() on line 30 to 38
start() on line 32 to 36
display() on line 38 to 46
...


Part E3 - Mark (9 /10)
-----------------------------

The user-defined class(es) are used in an appropriate manner

<just a mark needed here>



Part F1 - Mark (20 /20)
-----------------------------
- Use of a data structure to store information i.e. array
Bullet array is on 45
Enemy array is on 46

bullet array initalized on 45 (primitave)
enemy array initalized 0n 126 (object)

enemy array to draw enemies is 85
bullet array to draw bullets 101

...

Part F2 - Mark (12 /20)
-----------------------------
- Calculations performed on the information stored

line 127 i divided the width by the number of enemies depending on what level to get them spread out evenly
line 139 i added 40 to height

bullet class
line 13 to get the X for the bullet i divided the width by 2
line 19 i wanted X to be - it height divided by 2 

Destroyer class
line 11 i wanted the X to be width didvided by 2
line 12 made Y height take away from what the constructor took in
line 16 x was to be where the mouse moves taken away from height divided by 2

...


*/
