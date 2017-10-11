package entity;
/**
 * Created by Aloysius on 11/9/2017.
 */
public class Question {
    private int questionNo;
    private String questionDetail;
    private String answer;
    private int exerciseNo;
    private int questionId;

    public Question(int questionNo, String questionDetail, String answer, int exerciseNo, int questionId) {
        this.questionNo = questionNo;
        this.questionDetail = questionDetail;
        this.answer = answer;
        this.exerciseNo = exerciseNo;
        this.questionId = questionId;
    }

    public int getQuestionNo() {
        return questionNo;
    }

    public void setQuestionNo(int questionNo) {
        this.questionNo = questionNo;
    }

    public String getQuestionDetail() {
        return questionDetail;
    }

    public void setQuestionDetail(String questionDetail) {
        this.questionDetail = questionDetail;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public int getExerciseNo() {
        return exerciseNo;
    }

    public void setExerciseNo(int exerciseNo) {
        this.exerciseNo = exerciseNo;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }
}
