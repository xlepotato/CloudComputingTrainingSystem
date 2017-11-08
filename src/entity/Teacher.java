package entity;

/**
 * Created by Ying on 8/11/2017.
 */
public class Teacher extends User{

    private String lastLogin;

    public Teacher(String lastLogin) {
        this.lastLogin = lastLogin;
    }

    public Teacher(String userId, String username, int userType, String password, String name, String email, String lastLogin) {
        super(userId, username, userType, password, name, email);
        this.lastLogin = lastLogin;
    }

    public String getLastLogin() {
        return lastLogin;
    }

    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }
}
