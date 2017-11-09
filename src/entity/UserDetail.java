package entity;

/**
 * Created by Aloysius on 11/9/2017.
 */
public class UserDetail extends User{

    private String userId;
    private int userlevel;
    private int progress;
    private String lastBrowse;
    private String lastLogin;
    private double totalScore;
    private int totalScoreOverall;
    private double progressPercentage;

//    public UserDetail(String userid, int userlevel, String progress, String lastBrowse, String lastlogin)
//    {
//        this.userId = userid;
//        this.userlevel = userlevel;
//        this.progress = progress;
//        this.lastBrowse = lastBrowse;
//        this.lastLogin = lastlogin;
//    }


    public UserDetail(String userId, String username, int userType, String password, String name, String email,
                      int userlevel, int progress, String lastBrowse, String lastLogin, double totalScore,
                      int totalScoreOverall, double progressPercentage){

        super(userId,username,userType,password,name,email);
        this.userlevel = userlevel;
        this.progress = progress;
        this.lastBrowse = lastBrowse;
        this.lastLogin = lastLogin;
        this.totalScore = totalScore;
        this.totalScoreOverall = totalScoreOverall;
        this.progressPercentage = progressPercentage;
    }

    public UserDetail(String userId, int userlevel, int progress, String lastBrowse, String lastLogin, double totalScore, int totalScoreOverall, double progressPercentage) {
        this.userId = userId;
        this.userlevel = userlevel;
        this.progress = progress;
        this.lastBrowse = lastBrowse;
        this.lastLogin = lastLogin;
        this.totalScore = totalScore;
        this.totalScoreOverall = totalScoreOverall;
        this.progressPercentage = progressPercentage;
    }

    public double getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(double totalScore) {
        this.totalScore = totalScore;
    }

    public int getTotalScoreOverall() {
        return totalScoreOverall;
    }

    public void setTotalScoreOverall(int totalScoreOverall) {
        this.totalScoreOverall = totalScoreOverall;
    }


    public double getProgressPercentage() {
        return progressPercentage;
    }

    public void setProgressPercentage(double progressPercentage) {
        this.progressPercentage = progressPercentage;
    }

    //GET Methods for variables
    public String getuserId() {return userId;}
    public int getuserLevel() {return userlevel;}
    public int getprogress() {return progress;}
    public String getlastBrowse() {return lastBrowse;}
    public String getlastLogin() {return lastLogin;}

    //SET Methods for variables
    public void setuserId(String userId) {this.userId = userId;}
    public void setuserLevel(int userLevel){this.userlevel = userLevel;}
    public void setprogress(int progress){this.progress = progress;}
    public void setlastBrowse(String lastBrowse){this.lastBrowse = lastBrowse;}
    public void setlastLogin(String lastLogin){this.lastLogin = lastLogin;}


}
