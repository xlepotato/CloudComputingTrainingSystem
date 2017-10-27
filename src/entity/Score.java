package entity;

/**
 * Created by Ying on 26/10/2017.
 */
public class Score {
    private String userId;
    private int exerciseNo;
    private double quizScore;
    private int quizOverall;

    public Score(String userId, int exerciseNo, double quizScore, int quizOverall) {
        this.userId = userId;
        this.exerciseNo = exerciseNo;
        this.quizScore = quizScore;
        this.quizOverall = quizOverall;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getExerciseNo() {
        return exerciseNo;
    }

    public void setExerciseNo(int exerciseNo) {
        this.exerciseNo = exerciseNo;
    }

    public double getQuizScore() {
        return quizScore;
    }

    public void setQuizScore(double quizScore) {
        this.quizScore = quizScore;
    }

    public int getQuizOverall() {
        return quizOverall;
    }

    public void setQuizOverall(int quizOverall) {
        this.quizOverall = quizOverall;
    }
}
