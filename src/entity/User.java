package entity;

/**
 * Created by Ying on 5/9/2017.
 */
public class User {
    private String userId;
    private String username;
    private int userType;
    private String password;
    private String name;
    private String email;


    public User(String userId, String username, int userType, String password, String name, String email) {
        this.userId = userId;
        this.username = username;
        this.userType = userType;
        this.password = password;
        this.name = name;
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public int getUserType() {
        return userType;
    }

    public String getName() {
        return name;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setUserType(int userType) {
        this.userType = userType;
    }

    public void setName(String name) {
        this.name = name;
    }


}
