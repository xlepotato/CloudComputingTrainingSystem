package entity;
/**
 * Created by Aloysius on 11/9/2017.
 */
public class MCQ {
    private int id;
    private String option;
    private int questionNo;

    public MCQ(int id, String option, int questionNo)
    {
        this.id = id;
        this.option = option;
        this.questionNo = questionNo;
    }

    //GET Methods for variables
    public int getid() {return id;}
    public String getoption(){return option;}
    public int getquestionNo(){return questionNo;}

    //SET Methods for variables
    public void setid(int id){this.id = id;}
    public void setoption(String option){this.option = option;}
    public void setquestionNo(int questionNo){this.questionNo = questionNo;}
}
