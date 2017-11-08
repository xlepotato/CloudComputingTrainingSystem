package dataManager;

import entity.Exercise;
import entity.User;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class SearchDAO {

    private Exercise convertToSearch(ResultSet rs) throws SQLException{
        Exercise exercise;

        String searchrs = rs.getString("ss");
        int ExId = 0;

        exercise = new Exercise(ExId,searchrs);

        return exercise;
    }

    public ArrayList<Exercise> retrievesearchresults() {

        ArrayList<Exercise> list = new ArrayList<>();
        ResultSet rs ;
        DBController db = new DBController();
        String dbQuery;

        // Step 1 -connect to database
        db.getConnection();

        // step 2 - declare the SQL statement
        dbQuery = "SELECT * FROM exercise";
        // step 3 - using DBControlle readRequest method
        rs = db.readRequest(dbQuery);
        try {
            while (rs.next()) {
                Exercise exercise = convertToSearch(rs);
                list.add(exercise);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // step 4 - close connection
        db.terminate();

        return list;
    }

    public boolean checkforExistingResult(String searchResult){

        boolean searchSuccess = false;
        List<Exercise> list ;
        list = retrievesearchresults();
        for (int i = 0; i < list.size(); i++){
            //  System.out.println("Username does not exist");
            searchSuccess = list.get(i).getexerciseName().equals(searchResult);
        }
        return searchSuccess;
    }

    public String checkforSearchResult(String searchResult)
    {
        String searchResultStatus = "";

        List<Exercise> ExList ;

        ExList = retrievesearchresults();

        for (int i = 0; i < ExList.size(); i++)
        {
            if(ExList.get(i).getexerciseName().equals(searchResult))
            {
                System.out.println("Exercise exists in database");
                searchResultStatus = ExList.get(i).getexerciseName();
            }
            else
            {
                System.out.println("Exercise Does not exist in database");
            }
        }

        return searchResultStatus;
    }
}
