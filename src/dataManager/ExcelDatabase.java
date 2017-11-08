package dataManager;

/**
 * Created by Ying on 8/11/2017.
 */

import java.io.File;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
public class ExcelDatabase {

        public static void main(String[] args) throws Exception {

            Class.forName("com.mysql.jdbc.Driver");
            Connection connect = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/cloudcomputesystem" ,
                    "root" ,
                    "IT1639"
            );

            Statement statement = connect.createStatement();
            ResultSet resultSet = statement
                    .executeQuery("select * from userdetail");
            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet spreadsheet = workbook
                    .createSheet("userdetail db");

            XSSFRow row = spreadsheet.createRow(1);
            XSSFCell cell;
            cell = row.createCell(1);
            cell.setCellValue("USER ID");
            cell = row.createCell(2);
            cell.setCellValue("USER LEVEL");
            cell = row.createCell(3);
            cell.setCellValue("PROGRESS");
            cell = row.createCell(4);
            cell.setCellValue("LAST LOGIN");
            cell = row.createCell(5);
            cell.setCellValue("LAST BROWSE");
            cell = row.createCell(6);
            cell.setCellValue("TOTAL SCORE");
            cell = row.createCell(7);
            cell.setCellValue("TOTAL SCORE OVERALL");
            int i = 2;

            while(resultSet.next()) {
                row = spreadsheet.createRow(i);
                cell = row.createCell(1);
                cell.setCellValue(resultSet.getString("userId"));
                cell = row.createCell(2);
                cell.setCellValue(resultSet.getInt("userlevel"));
                cell = row.createCell(3);
                cell.setCellValue(resultSet.getString("progress"));
                cell = row.createCell(4);
                cell.setCellValue(resultSet.getString("lastLogin"));
                cell = row.createCell(5);
                cell.setCellValue(resultSet.getString("lastBrowse"));
                cell = row.createCell(6);
                cell.setCellValue(resultSet.getDouble("totalScore"));
                cell = row.createCell(7);
                cell.setCellValue(resultSet.getInt("totalScoreOverall"));
                i++;
            }

            FileOutputStream out = new FileOutputStream(new File("exceldatabase.xlsx"));
            workbook.write(out);
            out.close();
            System.out.println("exceldatabase.xlsx written successfully");

    }

}
