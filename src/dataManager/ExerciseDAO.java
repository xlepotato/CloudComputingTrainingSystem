package dataManager;
import entity.Exercise;
import entity.MCQ;
import entity.Question;
import entity.User;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Aloysius on 13/9/2017.
 */

public class ExerciseDAO {


    private Exercise convertToExercise(ResultSet rs) throws SQLException {

        Exercise exercise;
        int exerciseNo= rs.getInt("exerciseNo");
        String exerciseName = rs.getString("exerciseName");

        exercise = new Exercise(exerciseNo, exerciseName);
        return exercise;
    }

    private Question convertToQuestion(ResultSet rs) throws SQLException{
        Question qns;
        int questionNo = rs.getInt("questionNo");
        String questionDetail = rs.getString("questionDetail");
        String answer = rs.getString("answer");
        int exerciseNo = rs.getInt("exerciseNo");
        int questionId = rs.getInt("questionId");
        qns = new Question(questionNo,questionDetail,answer,exerciseNo, questionId);
        return qns;
    }
    private MCQ convertToMCQ(ResultSet rs) throws SQLException{
        MCQ mcq;
        int mcqId = rs.getInt("mcqId");
        String option = rs.getString("optionLetter");
        String optionDetail = rs.getString("optionDetail");
        int questionNo = rs.getInt("questionNo");
        mcq = new MCQ(mcqId,option,optionDetail,questionNo);
        return mcq;
    }

    public ArrayList<Question> retrieveQuestion(int inputExerciseNo){

        // declare local variables
        ArrayList<Question> qnsList = new ArrayList<Question>();
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT questionNo, questionDetail, answer, q.exerciseNo, questionId FROM question q INNER JOIN exercise e ON q.exerciseNo = e.exerciseNo WHERE e.exerciseNo = ? ";


        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setInt(1, inputExerciseNo);
            rs = pstmt.executeQuery();
            while (rs.next())
            {
                Question qns = convertToQuestion(rs);
                qnsList.add(qns);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return qnsList;
    }


    public ArrayList<MCQ> retrieveMCQOption(int inputQuestionNo){

        // declare local variables
        ArrayList<MCQ> mcqList = new ArrayList<MCQ>();
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT mcqId, optionLetter, optionDetail, m.questionNo FROM mcq m INNER JOIN question q ON m.questionNo = q.questionId WHERE m.questionNo = ? ";


        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setInt(1, inputQuestionNo);
            rs = pstmt.executeQuery();
            while (rs.next())
            {
                MCQ mcq = convertToMCQ(rs);
                mcqList.add(mcq);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return mcqList;
    }

    public ArrayList<Exercise> retrieveAllExercise() {
        // declare local variables
        ArrayList<Exercise> list = new ArrayList<>();
        ResultSet rs;
        DBController db = new DBController();
        String dbQuery;

        // Step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT * FROM exercise ";

        // step 3 - using DBController readRequest method
        rs = db.readRequest(dbQuery);
        try {
            while (rs.next())
            {
                Exercise exercise = convertToExercise(rs);
                list.add(exercise);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return list;
    }

    public boolean checkForSearchResult(String exerciseName){

        boolean Searching = false;
        int exerciseNo = 0;
        List<Exercise> list ;
        list = retrieveAllExercise();
        for (int i = 0; i < list.size(); i++){
            if(list.get(i).getexerciseNo() == exerciseNo)
            {
                System.out.println("Exercise exist in database");

                if(list.get(i).getexerciseName().equals(exerciseName))
                {
                    System.out.println("exerciseName exist in database");
                    Searching = true;
                }

            }
            else
            {
                System.out.println("No results found");
            }
        }
        return Searching;
    }

}
