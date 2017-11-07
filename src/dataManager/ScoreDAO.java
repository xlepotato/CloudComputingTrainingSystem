package dataManager;

import entity.Answer;
import entity.Score;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Ying on 27/10/2017.
 */
public class ScoreDAO {


    //consist of Answer entity & Score entity data access object methods


    private Score convertToScore(ResultSet rs) throws SQLException {
        Score score;


        String userId= rs.getString("userId");
        int exerciseNo = rs.getInt("exerciseNo");
        double quizScore = rs.getDouble("quizScore");
        int quizOverall = rs.getInt("quizOverall");


        score = new Score(userId, exerciseNo, quizScore, quizOverall);
        return score;
    }

    private Answer convertToAnswer(ResultSet rs) throws SQLException {
        Answer ans;


        String userId= rs.getString("userId");
        int questionId = rs.getInt("questionId");
        String chosenOptionLetter = rs.getString("chosenOptionLetter");
        int exerciseNo = rs.getInt("exerciseNo");


        ans = new Answer(userId, questionId, chosenOptionLetter, exerciseNo);
        return ans;
    }

    // to be created after user submit online exercise / quiz

    public boolean createScore(String userId, int exerciseNo, double quizScore, int quizOverall) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "INSERT INTO score(userId, exerciseNo, quizScore, quizOverall) VALUES(?, ?, ?, ?)";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to insert record using executeUpdate method
        try {
            pstmt.setString(1, userId);
            pstmt.setInt(2, exerciseNo);
            pstmt.setDouble(3, quizScore);
            pstmt.setInt(4, quizOverall);




            if (pstmt.executeUpdate() == 1)
                success = true;
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return success;
    }

    /*
        Method Name: createAnswer
        Usage: To be used after user successfully submitted the online exercise quiz.
     */
    public boolean createAnswer(String userId, int questionId, String chosenOptionLetter, int exerciseNo) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "INSERT INTO answer(userId, questionId, chosenOptionLetter, exerciseNo) VALUES(?, ?, ?, ?)";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to insert record using executeUpdate method
        try {
            pstmt.setString(1, userId);
            pstmt.setInt(2, questionId);
            pstmt.setString(3, chosenOptionLetter);
            pstmt.setInt(4, exerciseNo);

            if (pstmt.executeUpdate() == 1)
                success = true;
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return success;
    }


    // to be used on the online exercise score display page

    public Score retrieveScoreByUserIdAndExerciseNo(String userId, int exerciseNo) {
        // declare local variables
        Score score = null;
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT s.userId, s.exerciseNo, quizScore, quizOverall FROM score s INNER JOIN user u ON s.userId = u.userId INNER JOIN exercise e ON s.exerciseNo = e.exerciseNo WHERE s.userId = ? AND s.exerciseNo = ? GROUP BY s.userId";


        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setString(1, userId);
            pstmt.setInt(2, exerciseNo);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                score = convertToScore(rs);
                //   list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return score;
    }


    //for display each and every quiz score taken by a particular student

    public ArrayList<Score> retrieveAllScoreDoneByAStudent(String userId) {
        // declare local variables
        ArrayList<Score> list = new ArrayList<Score>();
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT s.userId, s.exerciseNo, quizScore, quizOverall FROM score s INNER JOIN user u ON s.userId = u.userId INNER JOIN exercise e ON s.exerciseNo = e.exerciseNo WHERE s.userId = ? GROUP BY s.userId";


        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Score score = convertToScore(rs);
                list.add(score);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return list;
    }



    public ArrayList<Answer> retrieveStudentCheckboxAnswerByUserIdAndQnsId(String userId, int questionId) {
        // declare local variables
        ArrayList<Answer> list = new ArrayList<Answer>();
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT userId, questionId, chosenOptionLetter, exerciseNo FROM answer WHERE userId = ? AND questionId = ? GROUP BY userId, questionId";


        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setString(1, userId);
            pstmt.setInt(2, questionId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Answer ans = convertToAnswer(rs);
                list.add(ans);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return list;
    }


    public Answer retrieveStudentAnswerByUserIdAndQnsId(String userId, int questionId) {
        // declare local variables
        Answer ans = null;
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT userId, questionId, chosenOptionLetter, exerciseNo FROM answer WHERE userId = ? AND questionId = ? GROUP BY userId, questionId";


        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setString(1, userId);
            pstmt.setInt(2, questionId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                ans = convertToAnswer(rs);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return ans;
    }

}
