package entity;

/**
 * Created by Aloysius on 11/9/2017.
 */
public class UserDetail {

    private String userId;
    private int userlevel;
    private String progress;
    private String lastBrowse;
    private String lastLogin;

    public UserDetail(String userid, int userlevel, String progress, String lastBrowse, String lastlogin)
    {
        this.userId = userid;
        this.userlevel = userlevel;
        this.progress = progress;
        this.lastBrowse = lastBrowse;
        this.lastLogin = lastlogin;
    }

    //GET Methods for variables
    public String getuserId() {return userId;}
    public int getuserLevel() {return userlevel;}
    public String getprogress() {return progress;}
    public String getlastBrowse() {return lastBrowse;}
    public String getlastLogin() {return lastLogin;}

    //SET Methods for variables
    public void setuserId(String userId) {this.userId = userId;}
    public void setuserLevel(int userLevel){this.userlevel = userLevel;}
    public void setprogress(String progress){this.progress = progress;}
    public void setlastBrowse(String lastBrowse){this.lastBrowse = lastBrowse;}
    public void setlastLogin(String lastLogin){this.lastLogin = lastLogin;}


}
