package entity;

/**
 * Created by Ying on 9/11/2017.
 */
public class Progress {

    private int progressId;
    private String progressCriteria;
    private String userId;

    public Progress(int progressId, String progressCriteria, String userId) {
        this.progressId = progressId;
        this.progressCriteria = progressCriteria;
        this.userId = userId;
    }

    public int getProgressId() {
        return progressId;
    }

    public void setProgressId(int progressId) {
        this.progressId = progressId;
    }

    public String getProgressCriteria() {
        return progressCriteria;
    }

    public void setProgressCriteria(String progressCriteria) {
        this.progressCriteria = progressCriteria;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
