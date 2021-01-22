public class Bullet {                               //th bullet class
    private float eX, eY;                         
    private float eH, eW; 
    boolean shoot = false; 
    boolean isSpent = false;

    
    Bullet(float eY, float eH, float eW) {          //creating the constructor for the bullet class with the parameters

        this.eY = eY;
        this.eH = eH;
        this.eW = eW;                                //bringing them in from ballon shooter
        eX = width / 2;


    }

    public void update() {                       // creating the updat method for the bullet class
        eX = mouseX - eH / 2;

        if (eX < 0) {                            //this is where the bullet is less than zero, is re intialized back to zero
            eX = 0;
        }
    }

    public void reset() {                      // createing the reset method
        if (eY < 0) {
            eY = 560;                          //if the bullet leaves its bounderies then it will be reset to 560 where it is measured to the rect aka the destroyer
        }
    }

    void start(float x, float y) {            //the start methods is being called in the mousePressed() method in the main sketch
        this.eX = x;
        this.eY = y;
        reset();
    }

    void display() {                         //the display for what the bullet looks like
        if (currentBullet >= 1) {            // this is the check that the bullet wont just shoot straight away, it has to be pressed at least once
            fill(0, 255, 0);
            strokeWeight(4);
            stroke(204, 153);                 //what the bullet looks like
            ellipse(eX, eY, eH, eW);
            eY = eY - 20;                      //the speed of the bullet -20 will be fast travelling upwards
        }
    }

    public float getEX() {                    //the getters
        return eX;
    }

    public float getEY() {
        return eY;
    }

    public float getEH() {
        return eH;
    }

    public float getEW() {
        return eW;
    }


}
