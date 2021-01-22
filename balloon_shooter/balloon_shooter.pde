/*
Name : Michael Kelly
Student Number: 20041540

Brief description of the game developed: The game I developed is a shooting game, basically you shoot down the ballons before they hit the bottom of the screen to progress on to the next level
the array of enemies that are float down at random speeds that has been set in the constructor of the class. There is validation on the JOptionPanes at the begining to make sure user enters
the correct data before proceeding. If you resach a total of 37 points in each level you will be notified and asked if you would like to proceed to the next level. if you decline or make it 
past level 4 then you will be displayed with your name in all caps even if you didnt do so at the begining and you will be informed on how many levels you successfuly passed. The enemies disapear
upon being shoot. In the video i reached the 10 minute mark alone when i went into the bullet class, so idecided to just leave the main workings of the code as the talking about the code, thats where
all the complex coding is to as to the getters and setters and constructors and a few update and display methods. I spent at least 30 hours trying to get the collision working the way i wanted in 2 and half days.

Justification of spec: 1. validation
                       2. array primitave
                       3.array object
                       4.beSpoke Methods
                       5.for loops
                       6.if statements, if else's, nested if's
                       7. working game.
                       8. collison detection.
                       9.upon collision the enemy dissapears
                       10.encacpsulation
                       11. getters and setters
                       12. constructors

Known bugs/problems: The only know problem, is when i click cancel at the begining when you are enetering in the level and if you chose to cancel, you will get a nullPointerException. I know exactly what it is
but because one of the options is the number 2, i couldn't go levels ==2{ exit();} and levels == JOptionPane.CANCEL_OPTION wasnt working so, just left it be. when entering the string it was grand it will cancel,
it because it was taking in an integer.

Any sources referred to during the development of the assignment (be precise and specific with references) {there no need to reference lecture/lab materials}:
https://forum.processing.org/two/discussion/23555/how-to-make-2-moving-objects-collide               this is how i figured out the collision i wanted with this code, re-worked it to fit mine.
https://forum.processing.org/one/topic/collision-with-objects-in-an-array.html
https://www.openprocessing.org/sketch/20795
https://forum.processing.org/two/discussion/11412/collision-ellipse-and-rect
https://forum.processing.org/one/topic/arrays-and-getting-more-than-one-ball-to-spawn.html
https://processing.org/tutorials/arrays/
https://forum.processing.org/two/discussion/26707/basic-how-to-draw-and-add-more-bullets-as-soon-as-there-is-space-for-them
https://forum.processing.org/one/topic/basic-shooting-and-dection.html
https://processing.org/tutorials/transform2d/
https://processing.org/tutorials/arrays/
https://processing.org/tutorials/objects/
https://forum.processing.org/one/topic/array-moving-balls.html
*/
import javax.swing.*;

Bullet[] bullets = new Bullet[100];    //primitave array
Enemy[] enemy;                          //object array
Destroyer destroyer;                    //Calling from the Destroyer class
User user;                              // Calling from the User Class

int numBullets;                        //////////////////////////////////
int numEnemies;
float y;                             
float bW;
float eX, eH, eW, eY;
float bH;
float x;
int d;
int let;
int destHeight;                  
int destWidth;
int currentBullet = 0;              //Initalizing the variables
int bul = 0;
int countEnemiesShot = 0;
int levels = 0;
boolean bullet = false;
String userName;                   /////////////////////////////////////////


void setup() {
    size(1000, 600);              //setting up the screen size
    welcomeInput();               //calling the input method where user enters information
    reset();                      //calling the reset method that creates the gameplay
}

void draw() {
    background(0);                //setting background to black
    noCursor();                   //no cursor is needed for this game
    if (countEnemiesShot == 37) {  //this is checking if a total of 37 points have been obtained to progress onto next level
        countEnemiesShot = 0;      // re-initalizing in the next level back to 0
        warningMsg();              // calling a message that has been coded in a method further down
    }

    destroyer.update();           //calling the update method from the Destroyer class
    destroyer.display();          //calling the displaymethod from the Destroyer class
    for (int i = 0; i < enemy.length; i++) {          // a for loop that will display out the enemies i.e. balloons
        enemy[i].display();                         // Display each object
        enemy[i].update();                         // Update each object

        if (dist(enemy[i].x, enemy[i].y, bullets[0].eX,    //collision detection between the x and y of each object 
                bullets[0].eY) < d / 2) {
                enemy[i].isDead = true;                    //if its false it will be used in the enemy class
                countEnemiesShot++;                        // this is the counter counting the points, that gives the user the go ahead to the next level

        }
        if (dist(bullets[0].eX, bullets[0].eY, enemy[i].x,  //another collision the same as above just to show that it can be detected twice
                enemy[i].y) < d) {
                println("Bang");                            // just printing out bang to show it works
        }
    }

    for (int i = 0; i < bullets.length; i++) {         // a for loop that will display out the bullets to shoot the balloons
        bullets[i].display();                         // Display each object
        bullets[i].update();                          // Update each object
    }
}


void mousePressed() {                              /* this processing method is used for when i click the button then it calls the start method from Bullet and reloads the gun while*/
    bullets[0].start(bullets[0].eX,                /*the bullet has reached its boundary*/
        bullets[0].eY);
    currentBullet++;                              // a counter
}

void reset() {                                    // the reset method that is called throughout the project where needed

    if (levels == 1) {
        numEnemies = 15;
    } else if (levels == 2) {        
        numEnemies = 20;                         // a nested if else statement that will take in from the welcome message method the level they have chosen
    } else if (levels == 3) {                    // then will adjust the number of balloons that will be floating down towards the shooter i.e destroyer
        numEnemies = 25;
    } else if (levels == 4) {
        numEnemies = 30;
    }

    enemy = new Enemy[numEnemies];              // this is initilazing the array with the size depending on level chosen               
    d = width / numEnemies - 5;                  //this is creating a diameter of all the balls laid out atop the screen depending on amount the size will get smaller

    for (int i = 1; i <= enemy.length; i++) {    // a for loop to lay out all the balloons in the array

        x = d / 2 + i * d;                       // creating the x value by diameter dividing by 2 adding it to each enemy multiplied by diameter
        y = 10;                                  //it the vaue of y

        enemy[i - 1] = new Enemy(x, y, d, d);    // sending back to the constructor in the class
    }

    for (int i = 1; i <= bullets.length; i++) {   // a for loop to lay out all the bullets in the array

        eY = height + 40;                            
        eH = 15;                                  //creating the values to be sent back to the constructor
        eW = 15;

        bullets[i - 1] = new Bullet(eY, eH, eW);      //sending back to the consructor
    }
    destroyer = new Destroyer(20, 40);
}

void gameOver() {
    JOptionPane.showMessageDialog(null,
        user.getUserName() +                          //Game over message that displays your name in all caps and how many levels you passed
        ", your game is over! \n\n" +
        "Number of Levels passed: " + bul);

    exit();
}

void warningMsg() {
    bul++;
    int reply = JOptionPane.showConfirmDialog(null,
        "Game Over! You WON  Would you like to play the next level in Balloon Shooter?",
        "Play NEXT level?",
        JOptionPane.YES_NO_OPTION);
    if (reply == JOptionPane.YES_OPTION) {              //if the user decided to progress on the level
        if (levels == 1) {                              //if thare on level 1 then they will be                  
            levels = 2;                                 //sent to level 2
            reset();                                    //when the reset method is called, same all the way up to 3
        } else if (levels == 2) {
            levels = 3;
            reset();
        } else if (levels == 3) {                      
            levels = 4;
            reset();
        } else {
            gameOver();                                  //Then when you complete level 4 you will be displayed with your progression
        }
    } else {
        gameOver();                                       //if you decided no to progress the leve further then you will be showing your progression and then exit the game
    }
}

void welcomeInput() {
    levels =
        Integer.parseInt(JOptionPane.showInputDialog("Welcome to Balloon Shooter\n\n Please enter the level you would like to play: ",      //This is the welcome input method that the user eneters what level they want to start at
            "1"));                                                                                                                          //and the username they want to use 
    userName =
        JOptionPane.showInputDialog("Welcome to Ballon Shooter\n\n " +                                                                      
            "Please enter the your name: ", "Mick");

    if (userName == null) {                                  //This is when you click cancel when entering name then it will exit the game
        exit();
    } else {
        if (userName.length() < 4) {
            JOptionPane.showMessageDialog(null, "Enter more than 3 letters",              //this is validation for the name being enterd no less than 4 letters or you will be prompted with error message
                "Error", JOptionPane.ERROR_MESSAGE);
            welcomeInput();                                                                //then asked to enter again
        }
        if (levels > 4 || levels == 0) {
            JOptionPane.showMessageDialog(null, "Enter between levels 1 - 4",             //this is also validation where the iser must enter between levels 1 to 4 if not error message prompts user
                "Error", JOptionPane.ERROR_MESSAGE);
            welcomeInput();
            reset();                                                                      //you must enter again
        } else {
            user = new User(userName, levels);
        }
    }
    reset();
}

void youLost() {
    int reply = JOptionPane.showConfirmDialog(null,
        "Game Over! You LOST  Would you like to retry a level in Balloon shooter?",              //this lets the user know that they have been beating by the game
        "Play another game?",
        JOptionPane.YES_NO_OPTION);
    if (reply == JOptionPane.YES_OPTION) {
        //player chooses to play the next game in their tournament.                              //if the user wants to play again they will be asked to start from the begining again
        welcomeInput();
        //reset();
    } else {
        gameOver();                                                                               //if they dont want to then calls the gameOver method and ends the game
    }
}
