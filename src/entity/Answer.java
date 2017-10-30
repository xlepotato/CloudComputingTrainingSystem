package entity;

/**
 * Created by Ying on 30/10/2017.
 */
public class Answer {

    String userId;
    int questionId;
    String chosenOptionLetter;


    public Answer(String userId, int questionId, String chosenOptionLetter) {
        this.userId = userId;
        this.questionId = questionId;
        this.chosenOptionLetter = chosenOptionLetter;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getChosenOptionLetter() {
        return chosenOptionLetter;
    }

    public void setChosenOptionLetter(String chosenOptionLetter) {
        this.chosenOptionLetter = chosenOptionLetter;
    }
}
