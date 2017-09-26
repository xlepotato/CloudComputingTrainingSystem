package entity;
/**
 * Created by Aloysius on 11/9/2017.
 */
public class MCQ {
    private int mcqId;
    private String option;
    private int questionNo;
    private String optionDetail;

    public MCQ(int mcqId, String option, String optionDetail, int questionNo) {
        this.mcqId = mcqId;
        this.option = option;
        this.questionNo = questionNo;
        this.optionDetail = optionDetail;
    }


    public int getMcqId() {
        return mcqId;
    }

    public void setMcqId(int mcqId) {
        this.mcqId = mcqId;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public int getQuestionNo() {
        return questionNo;
    }

    public void setQuestionNo(int questionNo) {
        this.questionNo = questionNo;
    }

    public String getOptionDetail() {
        return optionDetail;
    }

    public void setOptionDetail(String optionDetail) {
        this.optionDetail = optionDetail;
    }
}
