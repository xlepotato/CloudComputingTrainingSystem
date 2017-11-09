package dataManager;

/**
 * Created by Ying on 5/9/2017.
 */
import entity.Progress;
import entity.Teacher;
import entity.User;
import entity.UserDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class UserDAO {
    public static int getNextUserId() {
        // declare local variables
        int userId = 0;
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT MAX(userId) FROM user";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            rs = pstmt.executeQuery();
            if (rs.next()) { // first record found
                userId = rs.getInt(1) + 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();
        return userId;
    }


    private User convertToUser(ResultSet rs) throws SQLException {
        User user;


        String userId= rs.getString("userId");
        int userType = rs.getInt("userType");
        String username= rs.getString("username");
        String password = rs.getString("password");
        String name = rs.getString("name");
        String email = rs.getString("email");

        user = new User(userId, username, userType, password, name, email);
        return user;
    }


    private UserDetail convertToUserDetail(ResultSet rs) throws SQLException {
        UserDetail user;

        String userId= rs.getString("userId");
        int userlevel = rs.getInt("userlevel");
        int progress = rs.getInt("progress");
        String lastBrowse = rs.getString("lastBrowse");
        String lastLogin = rs.getString("lastLogin");
        double totalScore = rs.getDouble("totalScore");
        int totalScoreOverall = rs.getInt("totalScoreOverall");
        double progressPercentage = rs.getDouble("progressPercentage");

        user = new UserDetail(userId, userlevel, progress, lastBrowse, lastLogin, totalScore, totalScoreOverall, progressPercentage);
        return user;
    }

    private UserDetail convertToUserAndUserDetail(ResultSet rs) throws SQLException {
        UserDetail user;

        String userId= rs.getString("userId");
        int userType = rs.getInt("userType");
        String username= rs.getString("username");
        String password = rs.getString("password");
        String name = rs.getString("name");
        String email = rs.getString("email");
        int userlevel = rs.getInt("userlevel");
        int progress = rs.getInt("progress");
        String lastBrowse = rs.getString("lastBrowse");
        String lastLogin = rs.getString("lastLogin");
        double totalScore = rs.getDouble("totalScore");
        int totalScoreOverall = rs.getInt("totalScoreOverall");
        double progressPercentage = rs.getDouble("progressPercentage");

        user = new UserDetail(userId, username, userType, password, name, email, userlevel, progress, lastBrowse, lastLogin, totalScore, totalScoreOverall,progressPercentage);
        return user;
    }

    private Progress convertToProgress(ResultSet rs) throws SQLException {
       Progress progress;

        int progressId = rs.getInt("progressId");
        String progressCriteria = rs.getString("progressCriteria");
        String userId= rs.getString("userId");


        progress = new Progress(progressId, progressCriteria, userId);
        return progress;
    }


    //For converting Teacher entity (still under testing)

    private Teacher convertToTeacher(ResultSet rs) throws SQLException {
        Teacher user;

        String userId= rs.getString("userId");
        int userType = rs.getInt("userType");
        String username= rs.getString("username");
        String password = rs.getString("password");
        String name = rs.getString("name");
        String email = rs.getString("email");
        String lastLogin = rs.getString("lastLogin");


        user = new Teacher(userId, username, userType, password, name, email, lastLogin);
        return user;
    }



    /*
    Method Name: createUser
    Usage: Registration, Admin Add Student, Admin Add Teacher
     */
    public boolean createUser(String userId, String username, int userType, String password, String name, String email) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "INSERT INTO user(userId, username, userType, password, name, email) VALUES(?, ?, ?, ?, ?, ?)";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to insert record using executeUpdate method
        try {
            pstmt.setString(1, userId);
            pstmt.setString(2, username);
            pstmt.setInt(3, userType);
            pstmt.setString(4, password);
            pstmt.setString(5, name);
            pstmt.setString(6, email);



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
  Method Name: createUserAdmin
  Usage: Registration, Admin Add Student, Admin Add Teacher
   */
    public boolean createUserAdmin(String userId, String username, int userType, String password, String name) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "INSERT INTO user(userId, username, userType, password, name, email) VALUES(?, ?, ?, ?, ?, ?)";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to insert record using executeUpdate method
        try {
            pstmt.setString(1, userId);
            pstmt.setString(2, username);
            pstmt.setInt(3, userType);
            pstmt.setString(4, password);
            pstmt.setString(5, name);
            pstmt.setString(6, "");


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

    public boolean createUserDetail(String userId, int userlevel, int progress, String lastLogin, String lastBrowse) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "INSERT INTO userdetail VALUES(?, ?, ?, CURRENT_TIMESTAMP, ?, 0, 0, 0)";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to insert record using executeUpdate method
        try {
            pstmt.setString(1, userId);
            pstmt.setInt(2, userlevel);
            pstmt.setInt(3, progress);
          //  pstmt.setString(4, lastLogin);
            pstmt.setString(4, lastBrowse);



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
Method Name: createProgress
Usage: For creating progress each time user pass by a website that gives progress point
 */
    public boolean createProgress(String progressCriteria, String userId) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "INSERT INTO progress(progressCriteria, userId) VALUES(?, ?)";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to insert record using executeUpdate method
        try {

            pstmt.setString(1, progressCriteria);
            pstmt.setString(2, userId);




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


    public User retrieveUserByUsername(String username) {
        // declare local variables
        User user = null;
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT userId, username, userType, password, name, email FROM user WHERE username = ? ";


        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = convertToUser(rs);
                //   list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return user;
    }

    public UserDetail retrieveUserDetailByUsername(String username) {
        // declare local variables
        UserDetail user = null;
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT a.userId, userlevel, progress, lastBrowse, lastLogin, totalScore, totalScoreOverall, progressPercentage FROM userdetail a INNER JOIN user b ON a.userId = b.userId WHERE username = ? GROUP BY a.userId";


        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = convertToUserDetail(rs);
                //   list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return user;
    }



    public Progress retrieveProgressByUserIdAndProgressCriteria(String userId, String progressCriteria) {
        // declare local variables
        Progress progress = null;
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT * FROM progress WHERE userId = ? AND progressCriteria = ? ";


        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setString(1, userId);
            pstmt.setString(2, progressCriteria);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                progress = convertToProgress(rs);
                //   list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return progress;
    }


    public boolean updateUser(String name, String email, String username, String userId) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "UPDATE user SET name = ?, email = ?, username = ? WHERE userId = ?";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to update record using executeUpdate method
        try {

            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, username);
            pstmt.setString(4, userId);

            if (pstmt.executeUpdate() == 1)
                success = true;
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(success);
        // step 4 - close connection
        db.terminate();

        return success;
    }

    public boolean updatePassword(String newPassword, String userId) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "UPDATE user SET password = ? WHERE userId = ?";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to update record using executeUpdate method
        try {

            pstmt.setString(1, newPassword);
            pstmt.setString(2, userId);



            if (pstmt.executeUpdate() == 1)
                success = true;
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(success);
        // step 4 - close connection
        db.terminate();

        return success;
    }

    public boolean checkForExistingUser(String username, String password){

        boolean allowLogin = false;
        List<User> list = new ArrayList<User>();
        list = retrieveAllUser();
        for (int i = 0; i < list.size(); i++){
            if(list.get(i).getUsername().equals(username)){
                System.out.println("Username exist in database");
                if(list.get(i).getPassword().equals(password)){
                    System.out.println("Correct password");
                    allowLogin = true;
                }else{
                    System.out.println("Wrong password");
                }
            }else {
              //  System.out.println("Username does not exist");
            }
        }
        return allowLogin;
    }
    public int checkForUserType(String username){
        int userType = 0;
        List<User> list = new ArrayList<User>();
        list = retrieveAllUser();
        for (int i =0 ; i < list.size(); i++){
            if (username.equals(list.get(i).getUsername())){
                userType = list.get(i).getUserType();
            }
        }
        return userType;
    }


    public boolean updateProgress(int progress, double progressPercentage, String userId) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "UPDATE user SET progress = ?, progressPercentage WHERE userId = ?";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to update record using executeUpdate method
        try {

            pstmt.setInt(1, progress);
            pstmt.setDouble(2, progressPercentage);
            pstmt.setString(3, userId);



            if (pstmt.executeUpdate() == 1)
                success = true;
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(success);
        // step 4 - close connection
        db.terminate();

        return success;
    }

    public boolean updateUserLastLogin(String lastLogin,String userId) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "UPDATE userdetail" +
                " SET lastLogin = CURRENT_TIMESTAMP WHERE userId = ? ";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to update record using executeUpdate method
        try {

//            pstmt.setString(1, lastLogin);
            pstmt.setString(1, userId);

            if (pstmt.executeUpdate() == 1)
                success = true;
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(success);
        // step 4 - close connection
        db.terminate();

        return success;
    }

    /*
        The methods below is for Admin
     */
    public ArrayList<User> retrieveAllUser() {
        // declare local variables
        ArrayList<User> list = new ArrayList<User>();
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;

        // Step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT * FROM user ";

        // step 3 - using DBControlle readRequest method
        rs = db.readRequest(dbQuery);
        try {
            while (rs.next()) {
                User user = convertToUser(rs);
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return list;
    }


    public ArrayList<UserDetail> retrieveAllUserWithUserDetail() {
        // declare local variables
        ArrayList<UserDetail> list = new ArrayList<UserDetail>();
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;

        // Step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT * FROM user u INNER JOIN userDetail ud ON u.userId = ud.userId";

        // step 3 - using DBControlle readRequest method
        rs = db.readRequest(dbQuery);
        try {
            while (rs.next()) {
                UserDetail user = convertToUserAndUserDetail(rs);
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return list;
    }

    /*
        The method below is for Admin
     */
    public ArrayList<UserDetail> retrieveAllStudent() {
        // declare local variables
        ArrayList<UserDetail> list = new ArrayList<UserDetail>();
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;

        // Step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT * FROM user u INNER JOIN userDetail ud ON u.userId = ud.userId WHERE userType = 0";

        // step 3 - using DBControlle readRequest method
        rs = db.readRequest(dbQuery);
        try {
            while (rs.next()) {
                UserDetail user = convertToUserAndUserDetail(rs);
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return list;
    }

    /*
        The method below is for Admin
     */
    public ArrayList<User> retrieveAllTeacher() {
        // declare local variables
        ArrayList<User> list = new ArrayList<User>();
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;

        // Step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT * FROM user WHERE userType = 2";

        // step 3 - using DBControlle readRequest method
        rs = db.readRequest(dbQuery);
        try {
            while (rs.next()) {
                User user = convertToUser(rs);
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return list;
    }

/*
    Method Name: removeUser
    Usage: For admin to remove student or teacher's account
 */
    public boolean removeUser(String userId) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "DELETE FROM user WHERE userId = ?";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to delete record using executeUpdate method
        try {
            pstmt.setString(1, userId);
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
        Method Name: updateUserTotalScore
        Usage: to update the student total score after a completion of any exercises.
     */

    public boolean updateUserTotalScore(double totalScore,int totalScoreOverall,String userId) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "UPDATE userdetail" +
                " SET totalScore = ?, totalScoreOverall = ? WHERE userId = ? ";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to update record using executeUpdate method
        try {

            pstmt.setDouble(1, totalScore);
            pstmt.setInt(2, totalScoreOverall);
            pstmt.setString(3, userId);


            if (pstmt.executeUpdate() == 1)
                success = true;
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(success);
        // step 4 - close connection
        db.terminate();

        return success;
    }


    //Writing to Excel spreadsheet






}
