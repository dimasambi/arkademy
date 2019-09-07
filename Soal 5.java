import java.util.Arrays;
import java.util.List;

public class Vowel {
    public static void main(String args[]){
        System.out.println(vowelCount("programmer"));
        System.out.println(vowelCount("hmm.."));
    }

    public static Integer vowelCount(String string){
        int vowelCount = 0;
        string = string.toLowerCase();
        List vowels = Arrays.asList("a", "i", "u", "e", "o");
        int stringLength = string.length();
        for(int i = 0; i < stringLength; i++){
            char character = string.charAt(i);
            if(vowels.contains(Character.toString(character))){
                vowelCount++;
            }
        }
        return vowelCount;
    }
}
