public class Destroyer {                                    //The Destroyer class
    private int x;
    private int y;
    private int destWidth;
    private int destHeight;

    public Destroyer(int destWidth, int destHeight) {      // the constructor for the class and its parameters
        setDestWidth(destWidth);
        setDestHeight(destHeight);

        x = width / 2;                                    //dividing thw idth by itself so it will stay at the bottom of the 
        y = height - this.destHeight;                     //this is taking the height away from the 40 that was passed in through the y
    }

    public void update() {                                //the update method
        x = mouseX - destHeight / 2;                      //the location of the mouse taking away from the height of the destroyer divided by 2

        if (x < 0) {
            x = 0;
        }
        if (x > (width - destWidth)) {                  //checking the width of the destroyer along the x axis
            x = width - destWidth;
        }
    }

    public void display() {
        fill(0, 255, 0);                              // the display method where it shows what the destroyer looks like
        noStroke();
        rect(x, y, destWidth, destHeight);
    }
                                                        //getter methods
    public int getX() {
        return x;
    }

    public int getY() {
        return y;
    }

    public int getDestWidth() {                      //these will be used in the main sketch if needed, we will call on them
        return destWidth;
    }

    public int getDestHeight() {
        return destHeight;
    }


    
    public void setDestWidth(int destWidth) {
                                                               //setter methods 
        if ((destWidth == 20) && (destWidth <= width / 2)) {
            this.destWidth = destWidth;
        } else {
                                                               // If an invalid width is passed as a parameter, a default width of 20 is imposed.
            this.destWidth = 20;                               //the reason for these setters is to ensure the size of the destroyer is in scale to all the other objects
        }
    }

    public void setDestHeight(int destHeight) {                            //another setter method to ensure that the height is exactly the way i want it to be in the game
        //The paddle height must be between 50 and height/2 (inclusive)
        if ((destHeight == 40) && (destHeight <= height / 2)) {
            this.destHeight = destHeight;
        } else {
            this.destHeight = 40;
        }
    }

}
