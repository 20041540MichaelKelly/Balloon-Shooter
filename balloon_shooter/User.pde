public class User {                    //the user class
    private String userName; 
    private int levels;

    User(String userName, int levels) {                  //the constructor with the parameters

        this.userName = userName.toUpperCase();          //converting the name to upercase if it wasnt already done so

        this.levels = levels;


    }

    public String getUserName() {                      //the getters
        return userName;
    }

    public int getLevels() {
        return levels;
    }

}
