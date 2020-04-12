package javaQuiz.q6;

import java.util.Scanner;

/*
배열 초기화
int[] iArrAnswer = {8, 1, 4};
String[] strArrStrike =
{“”, “원스트라이크”, “투스트라이크”, “아웃“};
String[] strArrBall = {“”, “원볼”, “투볼”, “쓰리볼”};
입력한 숫자가 자리수는 달라도 포함이
   되어있다면 1개당 원볼
입력한 숫자가 자리수까지 맞는다면
   1개당 원스트라이크
- 게임은 정답을 맞출때까지 반복
 */
class Q3 {

	public static void main(String[] args) {
		int[] iArrAnswer = { 8, 1, 4 };
		String[] strArrStrike = { "", "원스트라이크", "투스트라이크", "아웃" };
		String[] strArrBall = {"", "원볼", "투볼", "쓰리볼"};
		
		Scanner sc = new Scanner(System.in);

		int[] answer = new int[3];
		for (int i : answer) {
			System.out.println("숫자를 입력하세요");
			answer[i] = Integer.parseInt(sc.nextLine());

		}

		for (int i = 0; i < answer.length; i++) {
				for (int j = 0; j < answer.length; j++) {
					if(iArrAnswer[i]!= answer[i] && iArrAnswer==answer[j]) {
						
				}
			}
		}

	}
}