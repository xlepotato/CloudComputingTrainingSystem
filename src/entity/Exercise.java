package entity;
/**
 * Created by Aloysius on 11/9/2017.
 */
public class Exercise {
    private int exerciseNo;
    private String exerciseName;

    public Exercise(int exerciseNo, String exerciseName)
    {
        this.exerciseNo = exerciseNo;
        this.exerciseName = exerciseName;
    }

    //GET Methods for variables
    public int getexerciseNo(){return exerciseNo;}
    public String getexerciseName(){return exerciseName;}

    //SET Methods for variables
    public void setexerciseNo(int exerciseNo){this.exerciseNo = exerciseNo;}
    public void setexerciseName(String exerciseName){this.exerciseName = exerciseName;}

}
