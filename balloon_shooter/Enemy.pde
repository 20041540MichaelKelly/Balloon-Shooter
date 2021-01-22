public class Enemy {            //the enemy class
    private float x, y;         // X-coordinate, y-coordinate
    private float bH, bW;       // Diameter of the circle
    boolean isDead = false;
    private float speed;
    int direction = 1;
    int counters = 0;
                                                          // Constructor and the parameters
    Enemy(float x, float y, float bH, float bW) {
        this.x = x;
        this.y = y;
        this.bH = bH;
        this.bW = bW;

        this.speed = random(0.2, 0.6);                    //speed the array of ballons will fall down
    }

    public void gameReset() {                              //game reset method

        if (y > height) {                                  //if the ballons fall down to the ground then will display message from the youlose method
            youLost();
        }
    }

    void update() {                                        //the update method calls on the game reset method
        gameReset();
    }


    void display() {                                  //this display is instrumental on how the game work,
        if (isDead == false) {                        //in the collision detection in the main sketch, there a boolean that  
            fill(255, 0, 0);                          // cuts out each bollon thats shot, so they will display if it hasnt been set to true in the collsion detection
            strokeWeight(4);
            // stroke(204, 153);
            ellipse(x, y, bH, bW);
            y += (speed * direction);               //the speed at which they are coming down
        }
    }

    public float getX() {                          //the getter methods
        return x;
    }

    public float getY() {
        return y;
    }

    public float getBH() {
        return bH;
    }

    public float getBW() {
        return bW;
    }


}
