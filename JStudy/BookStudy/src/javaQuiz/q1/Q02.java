package javaQuiz.q1;

import java.util.Scanner;

public class Q02 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		while (true) {
			System.out.println("=====숫자입력=====");
			int answer = Integer.parseInt(sc.nextLine());

			if(answer == 0) {
				System.out.println("입력한 숫자는 0 입니다.");
			}else if (answer % 2 == 0) {
				System.out.println("입력한 숫자" + answer + "은 짝수 입니다.");
			} else if (answer % 2 != 0) {
				System.out.println("입력한 숫자" + answer + "은 홀수 입니다.");
			} 
		}
		
		//-----------------% 연산자 없이 해보라는데 난 못하겠소
	}
}
