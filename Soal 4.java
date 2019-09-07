import java.util.ArrayList;
import java.util.List;

public class Kelompok {
    public static void main(String args[]){
        String clean = cleanString("993141 -1 1323 14-232");
        System.out.println(reformat(clean));

    }

    public static String reformat(String string){
        List<String> stringList = new ArrayList<String>();
        String result = "";
        int stringLength = string.length();
        int jmlKelompok = stringLength/3;
        int sisaLength = stringLength%3;
        if(sisaLength == 1){
            jmlKelompok -= 1;
        }
        int startSub = 0;
        int endSub = 3;

        if(stringLength >= 5 ){
            for(int i = 0; i < jmlKelompok; i++){
                if(i == 0){
                    result = string.substring(startSub, endSub);
                    if(i == jmlKelompok-1){
                        startSub += 3;
                        endSub += 2;
                    } else {
                        startSub += 3;
                        endSub += 3;
                    }
                } else if(i == jmlKelompok-1) {
                    result = result + "-" + string.substring(startSub, endSub);
                    startSub += 3;
                    endSub += 2;
                } else {
                    result = result + "-" + string.substring(startSub, endSub);
                    startSub += 3;
                    endSub += 3;
                }
            }
            if(sisaLength == 1){
                for(int i = 0; i < 2; i++){
                    result = result + "-" + string.substring(startSub, endSub);
                    startSub += 2;
                    endSub += 2;
                }
            } else if(sisaLength == 2){
                result = result + "-" + string.substring(startSub, stringLength);
            }
        } else {
            for(int i = 0; i < 2; i++){
                if(i == 0){
                    result = string.substring(startSub, endSub);
                } else {
                    result = result + "-" + string.substring(startSub, endSub);
                }
                startSub += 3;
                endSub = endSub + (stringLength - 3);
            }
        }

        return result;
    }

    public static String cleanString(String string){
        string = string.replaceAll("[-\\s]", "");
        return string;
    }
}
