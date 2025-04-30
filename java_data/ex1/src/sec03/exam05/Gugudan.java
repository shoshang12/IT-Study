package sec03.exam05;

public class Gugudan {
    public static void main(String[] args) {
        // 2단부터 9단까지 구구단 출력
        for (int i = 2; i <= 9; i++) {
            System.out.println(i + "단 출력:");
            // 각 단에 대해 1부터 9까지 곱셈을 출력
            for (int j = 1; j <= 9; j++) {
                System.out.println(i + " x " + j + " = " + (i * j));
            }
            System.out.println(); // 각 단 사이에 공백 줄 추가
        }
    }
}
