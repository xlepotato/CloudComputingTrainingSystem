package wrapper.utility;

/**
 * Created by Ying on 20/10/2017.
 */
public class ExerciseUtility {

    public static String computeGrade(double score, int numOfQuestion){

        double scorePercentage = (score/numOfQuestion) * 100;
        System.out.println(scorePercentage);
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
    public static void main(String []arg){
        //Testing
        String grade = computeGrade(5,27);
        System.out.println(grade);
    }
}
