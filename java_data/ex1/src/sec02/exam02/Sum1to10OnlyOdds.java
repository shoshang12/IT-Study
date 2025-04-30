package sec02.exam02;

public class Sum1to10OnlyOdds {
    public static void main(String[] args) {
        int sum = 0;

        System.out.println("1부터 10 사이의 홀수:");
        for (int i = 1; i <= 10; i++) {
            if (i % 2 != 0) {
                System.out.println(i);
                sum += i;
            }
        }

        System.out.println("1부터 10 사이 홀수의 합계: " + sum);
    }
}