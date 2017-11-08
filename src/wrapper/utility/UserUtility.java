package wrapper.utility;

import java.sql.*;
import java.util.UUID;

import java.io.File;
import java.io.FileOutputStream;

import dataManager.DBController;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * Created by Ying on 6/9/2017.
 */
public class UserUtility {
    public static String generateUserId(){
        String uniqueID = UUID.randomUUID().toString();
        return uniqueID;
    }

    public static void excel(){
        DBController db = new DBController();
        db.getConnection();

        String dbQuery;
        ResultSet rs = null;

        dbQuery = "SELECT * FROM user";
        rs = db.readRequest(dbQuery);

//        Statement statement = connect.createStatement();
//        ResultSet resultSet = statement
//                .executeQuery("select * from emp_tbl");


        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet spreadsheet = workbook
                .createSheet("user db");

        XSSFRow row = spreadsheet.createRow(1);
        XSSFCell cell;
        cell = row.createCell(1);
        cell.setCellValue("USER ID");
        cell = row.createCell(2);
        cell.setCellValue("USERNAME");
        cell = row.createCell(3);
        cell.setCellValue("USER TYPE");
        cell = row.createCell(4);
        cell.setCellValue("NAME");
        cell = row.createCell(5);
        cell.setCellValue("EMAIL");
        int i = 2;

        try {
        while(rs.next()) {
            row = spreadsheet.createRow(i);
            cell = row.createCell(1);
            cell.setCellValue(rs.getString("userId"));
            cell = row.createCell(2);
            cell.setCellValue(rs.getString("username"));
            cell = row.createCell(3);
            cell.setCellValue(rs.getInt("userType"));
            cell = row.createCell(4);
            cell.setCellValue(rs.getString("name"));
            cell = row.createCell(5);
            cell.setCellValue(rs.getString("email"));
            i++;
        }
        } catch (Exception e) {
            e.printStackTrace();
        }


        try{
        FileOutputStream out = new FileOutputStream(new File("catexceldatabase.xlsx"));
        workbook.write(out);
            System.out.println("exceldatabase.xlsx written successfully");
        out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
