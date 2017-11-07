package wrapper.utility;

import java.text.DecimalFormat;

/**
 * Created by Ying on 20/10/2017.
 */
public class ExerciseUtility {

/*
    Method Name: computeScorePercentage
    Usage: Used in calculating the total score as well as score of a single exercise.
 */
    public static double computeScorePercentage(double score, int numOfQuestion){
        double scorePercentage = (score/numOfQuestion) * 100;
        System.out.println(scorePercentage);
        return scorePercentage;
    }

    public static String computeGrade(double score, int numOfQuestion){

        double scorePercentage = computeScorePercentage(score,numOfQuestion);
        if(scorePercentage >= 80)
            return "A";
        else if (scorePercentage >= 75 && scorePercentage < 80)
            return "B+";
        else if (scorePercentage >= 70 && scorePercentage < 75)
            return "B";
        else if (scorePercentage >= 65 && scorePercentage < 70)
            return "C+";
        else if (scorePercentage >= 60 && scorePercentage < 65)
            return "C";
        else if (scorePercentage >= 55 && scorePercentage < 60)
            return "D+";
        else if (scorePercentage >= 50 && scorePercentage < 55)
            return "D";
        else
            return "F";

    }

    public static double sumUpScore(double existingDBScore, double newScore){
        double latestScore = existingDBScore + newScore;
        return latestScore;
    }
    public static int sumUpScoreOverall(int existingDBScoreOverall, int newScoreOverall){
        int latestScoreOverall = existingDBScoreOverall + newScoreOverall;
        return latestScoreOverall;
    }

    public static String formatToOneDecimalPlace(double num){
        DecimalFormat df = new DecimalFormat("0");
        String formattedNum = df.format(num);
        return formattedNum;
    }


    public static void main(String []arg){
        //Testing
        String grade = computeGrade(27,27);
        System.out.println(grade);
    }
}
