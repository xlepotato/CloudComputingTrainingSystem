package dataManager;

import entity.Score;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by Ying on 27/10/2017.
 */
public class ScoreDAO {



    private Score convertToScore(ResultSet rs) throws SQLException {
        Score score;


        String userId= rs.getString("userId");
        int exerciseNo = rs.getInt("exerciseNo");
        double quizScore = rs.getDouble("quizScore");
        int quizOverall = rs.getInt("quizOverall");


        score = new Score(userId, exerciseNo, quizScore, quizOverall);
        return score;
    }

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

}
