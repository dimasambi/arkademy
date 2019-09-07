import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Login {
    static Pattern usernamePattern = Pattern.compile("^[a-z]{5,9}$");
    static Pattern passwordPattern = Pattern.compile("((?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*\\W).{8,})");
    public static void main(String args[]){
        System.out.println("code3r&:" + isUsernameValid("cod3r&"));
        System.out.println("siska:" + isUsernameValid("siska"));
        System.out.println("p4s$gW:" + isPasswordValid("p4s$gW"));
        System.out.println("codeYourFuture!123:" + isPasswordValid("codeYourFuture!123"));
    }

    public static Boolean isUsernameValid(String username){
        boolean result;
        Matcher matcher = usernamePattern.matcher(username);
        result = matcher.matches();
        return result;
    }

    public static Boolean isPasswordValid(String password){
        boolean result;
        Matcher matcher = passwordPattern.matcher(password);
        result = matcher.matches();
        return result;
    }
}
