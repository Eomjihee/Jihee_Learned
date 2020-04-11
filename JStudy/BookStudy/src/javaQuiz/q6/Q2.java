package javaQuiz.q6;

import java.util.Scanner;

/*
메모장 작성 : Ex2.java
Scanner 사용 (메뉴, 좌석 입력시 사용)
좌석을 나타낼 배열 :
boolean[][] isArrSeat = new Boolean[2][5];
종료 메뉴 선택 전까지 반복 할 것, 
종료 메뉴 선택시 반복문을 빠져나가도록
구현 할 것.
 */
public class Q2 {
	static Scanner sc = new Scanner(System.in);
	int col;
	int row;

	boolean[][] isArrSeat = new boolean[2][5];

	public void printSeat() {
		for (int i = 0; i < isArrSeat.length; i++) {
			for (int j = 0; j < isArrSeat[i].length; j++) {
				if (isArrSeat[i][j] == true) {
					System.out.print(" O ");
				} else {
					System.out.print(" - ");
				}
			}
			System.out.println();
		}
	}

	public void reservation() {
		System.out.print("예약할 열을 입력하세요. (1,2) : ");
		col = Integer.parseInt(sc.nextLine()) - 1;
		System.out.println("1열의 좌석 중 번호를 선택하세요 (1 ~ 5)");
		row = Integer.parseInt(sc.nextLine()) - 1;

		isArrSeat[col][row] = true;
		System.out.println("[" + (col+1) + "],[" + (row+1) + "] 좌석 예약 완료");

	}

	public static void main(String[] args) {

		Q2 q2 = new Q2();

		while (true) {
			System.out.println("====좌석 예약 프로그램====");
			System.out.println();
			System.out.println("1. 좌석 확인 ");
			System.out.println("2. 좌석 예약");
			System.out.println("3. 종료 ");
			System.out.print("메뉴 선택 : ");
			System.out.println();
			int answer = Integer.parseInt(sc.nextLine());

			switch (answer) {
			case 1:
				q2.printSeat();
				break;
			case 2:
				q2.reservation();
				;
				break;
			case 3:
				System.exit(0);
				;

			default:
				System.out.println("잘못된 입력");
				break;
			}
		}
	}
}
