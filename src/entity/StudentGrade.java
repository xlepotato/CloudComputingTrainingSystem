package entity;
/**
 * Created by Aloysius on 11/9/2017.
 */
public class StudentGrade {
    private String userId;
    private int score;
    private String courseName;

    public StudentGrade(String userId, int score, String courseName)
    {
        this.userId = userId;
        this.score = score;
        this.courseName = courseName;
    }

    //GET Methods for variables
    public String getuserId(){return userId;}
    public int getscore(){return score;}
    public String getcourseName(){return courseName;}

    //SET Methods for variables
    public void setuserId(String userId){this.userId = userId;}
    public void setscore(int score){this.score = score;}
    public void setcourseName(String courseName){this.courseName = courseName;}
}
