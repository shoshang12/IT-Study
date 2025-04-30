package sec02.exam02;

public class SumDoWhile {
    public static void main(String[] args) {
        int sum = 0;
        int i = 1;

        do {
            sum += i;
            i++;
        } while (i <= 10);

        System.out.println("1부터 10까지의 합은:" + sum);
        }
    }

