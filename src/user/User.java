package user;

/**
 * Created by Ying on 5/9/2017.
 */
public class User {
    private String userId;
    private String username;
    private int userType;
    private String name;

    public User(String userId, String username, int userType, String name) {
        this.userId = userId;
        this.username = username;
        this.userType = userType;
        this.name = name;
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
