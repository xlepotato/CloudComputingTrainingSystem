package dataManager;

/**
 * Created by Ying on 5/9/2017.
 */
import entity.User;
import entity.UserDetail;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
        String progress = rs.getString("progress");
        String lastBrowse = rs.getString("lastBrowse");
        String lastLogin = rs.getString("lastLogin");

        user = new UserDetail(userId, userlevel, progress, lastBrowse, lastLogin);
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

    public boolean createUserDetail(String userId, int userlevel, String progress, String lastLogin, String lastBrowse) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "INSERT INTO userdetail(userId, userlevel, progress, lastLogin, lastBrowse) VALUES(?, ?, ?, CURRENT_TIMESTAMP, ?)";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to insert record using executeUpdate method
        try {
            pstmt.setString(1, userId);
            pstmt.setInt(2, userlevel);
            pstmt.setString(3, progress);
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
        dbQuery = "SELECT a.userId, userlevel, progress, lastBrowse, lastLogin FROM userdetail a INNER JOIN user b ON a.userId = b.userId WHERE username = ? GROUP BY a.userId";


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


    public boolean updateUser(String name, String password, String email, String username) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "UPDATE user SET name = ?, password = ?, email = ? WHERE username = ?";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to update record using executeUpdate method
        try {

            pstmt.setString(1, name);
            pstmt.setString(2, password);
            pstmt.setString(3, email);

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

    /*
        The method below is for Admin
     */
    public ArrayList<User> retrieveAllStudent() {
        // declare local variables
        ArrayList<User> list = new ArrayList<User>();
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;

        // Step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT * FROM user WHERE userType = 0";

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
    public static boolean removeUser(int userId) {
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
            pstmt.setInt(1, userId);
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

}
