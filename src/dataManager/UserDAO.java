package dataManager;

/**
 * Created by Ying on 5/9/2017.
 */
import entity.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
            pstmt.setString(5, email);



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


}
