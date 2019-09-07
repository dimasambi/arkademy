public class Triangle {
    public static void main(String args[]){
        printTriangle(5);
    }

    public static void printTriangle(int rowCount){
        for(int i = rowCount; i >= 1; i--){
            int jmlBintang = i+(i-1);
            if(jmlBintang % 2 == 0){
                continue;
            }
            if(i != rowCount){
                for(int k = 0; k < rowCount-i; k++){
                    System.out.print(" ");
                }
            }
            for(int j = 1; j <= jmlBintang; j++){
                if(i != rowCount){
                    if(j == 1){
                        System.out.print("*");
                    } else if(j == jmlBintang){
                        System.out.print("*");
                    } else {
                        System.out.print(" ");
                    }

                } else {
                    System.out.print("*");
                }
            }
            System.out.println();
        }
    }
}
