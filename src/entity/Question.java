package entity;
/**
 * Created by Aloysius on 11/9/2017.
 */
public class Question {
    private int questionNo;
    private String questionDetail;
    private String answer;
    private int exerciseNo;

    public Question(int questionNo, String questionDetail, String answer, int exerciseNo){
        this.questionNo = questionNo;
        this.questionDetail = questionDetail;
        this.answer = answer;
        this.exerciseNo = exerciseNo;
    }

    //GET Methods for variables
    public int getquestionNo(){return questionNo;}
    public String getquestionDetails(){return questionDetail;}
    public String getanswer(){return answer;}
    public int getexerciseNo(){return exerciseNo;}

    //SET Methods for variables
    public void setquestionNo(int questionNo){this.questionNo = questionNo;}
    public void setquestionDetails(String questionDetails){this.questionDetail = questionDetails;}
    public void setanswer(String answer){this.answer = answer;}
    public void setexerciseNo(int exerciseNo){this.exerciseNo = exerciseNo;}
}
