package javaQuiz.q1;

import java.util.Scanner;

public class Q03 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int coke = 600;
		int sprite = 400;
		int hwanta = 900;
		
		System.out.println("===금액을 투입하세요===");
		int money = Integer.parseInt(sc.nextLine());
		while (true) {
			System.out.println("===============");
			System.out.println("1. 콜라 600원");
			System.out.println("2. 사이다 400원");
			System.out.println("3. 환타 900원");
			System.out.println("===============");
			System.out.println();
			System.out.println("음료수를 선택하세요");
			int answer = Integer.parseInt(sc.nextLine());
			
			switch (answer) {
			case 1:
				if(money>coke) {
					money -= coke;
					System.out.println("주문하신 음료는 콜라");
					System.out.println("잔돈 : " + money);
					break;
				}else {
					System.out.println((coke-money)+"원이 모자랍니다.");
					break;
				}
			case 2:
				if(money>sprite) {
					money -= sprite;
					System.out.println("주문하신 음료는 사이다");
					System.out.println("잔돈 : " + money);
					break;
				}else {
					System.out.println((sprite-money)+"원이 모자랍니다.");
					break;
				}
			case 3:
				if(money>hwanta) {
					money -= coke;
					System.out.println("주문하신 음료는 환타");
					System.out.println("잔돈 : " + money);
					break;
				}else {
					System.out.println((hwanta-money)+"원이 모자랍니다.");
					break;
				}

			default:
				System.out.println("잘못 입력하셨습니다.");
				break;
			}
		}
	}
}
