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






        user = new User(userId, lyFat, curCalories, curProtein, curFat, curCarbo);

        return user;
    }

    public boolean createUser(int userId, String uname, int age, String gender, String intensity, int uheight, double weight, double dailyCalories, double dailyProtein, double dailyCarbo, double dailyFat, double curCalories, double curProtein, double curFat, double curCarbo) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "INSERT INTO user(userId, uname, age, gender,  intensity,  uheight, weight, dailyCalories,  dailyProtein, dailyCarbo, dailyFat, curCalories, curProtein, curFat, curCarbo) VALUES(?, ?, ?, ?, ?,?, ?,?,?,?,?,?,?,?,?)";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to insert record using executeUpdate method
        try {
            pstmt.setInt(1, userId);
            pstmt.setString(2, uname);
            pstmt.setInt(3, age);
            pstmt.setString(4, gender);
            pstmt.setString(5, intensity);
            pstmt.setInt(6, uheight);
            pstmt.setDouble(7, weight);
            pstmt.setDouble(8, dailyCalories);
            pstmt.setDouble(9, dailyProtein);
            pstmt.setDouble(10, dailyCarbo);
            pstmt.setDouble(11, dailyFat);
            pstmt.setDouble(12, curCalories);
            pstmt.setDouble(13, curProtein);
            pstmt.setDouble(14, curFat);
            pstmt.setDouble(15, curCarbo);



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

    public User retrieveUserByUsername(String uname) {
        // declare local variables
        User user = null;
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT uname, age, gender,  intensity,  uheight, weight FROM user WHERE uname = ? ";

        //SELECT loanId,l.itemName,count(*)quantity, loanDate, dueDate,i.id, username FROM loanrecord l inner join inventory i on l.itemName = i.itemName WHERE username = ? group by loanId,itemName,loanDate,dueDate,i.id, username";

        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setString(1, uname);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = convertToUserParticular(rs);
                //   list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return user;
    }


    public User retrieveRecommendIntakeByUsername(String uname) {
        // declare local variables
        User user = null;
        ResultSet rs = null;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT dailyCalories, dailyProtein, dailyCarbo, dailyFat FROM user WHERE uname = ? ";

        //SELECT loanId,l.itemName,count(*)quantity, loanDate, dueDate,i.id, username FROM loanrecord l inner join inventory i on l.itemName = i.itemName WHERE username = ? group by loanId,itemName,loanDate,dueDate,i.id, username";

        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - execute query
        try {
            pstmt.setString(1, uname);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user = convertToUserRecommendIntake(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return user;
    }

    public boolean updateMeasurement(int age, String intensity,int uheight,double weight, double dailyCalories, double dailyProtein, double dailyCarbo, double dailyFat,String uname) {
        // declare local variables
        boolean success = false;
        DBController db = new DBController();
        String dbQuery;
        PreparedStatement pstmt;

        // step 1 - establish connection to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "UPDATE user SET age = ?, intensity = ?, uheight = ?, weight = ?, dailyCalories = ?,  dailyProtein = ?, dailyCarbo = ?, dailyFat = ?  WHERE uname = ?";
        pstmt = db.getPreparedStatement(dbQuery);

        // step 3 - to update record using executeUpdate method
        try {

            pstmt.setInt(1, age);
            pstmt.setString(2, intensity);
            pstmt.setInt(3, uheight);
            pstmt.setDouble(4, weight);
            pstmt.setDouble(5, dailyCalories);
            pstmt.setDouble(6, dailyProtein);
            pstmt.setDouble(7, dailyCarbo);
            pstmt.setDouble(8, dailyFat);
            pstmt.setString(9, uname);

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
