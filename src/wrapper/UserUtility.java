package wrapper;

import java.util.UUID;

/**
 * Created by Ying on 6/9/2017.
 */
public class UserUtility {
    public static String generateUserId(){
        String uniqueID = UUID.randomUUID().toString();
        return uniqueID;
    }
}
