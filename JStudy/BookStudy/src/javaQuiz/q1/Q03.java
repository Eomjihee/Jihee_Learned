package javaQuiz.q1;

import java.util.Scanner;

public class Q03 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int coke = 600;
		int sprite = 400;
		int hwanta = 900;
		
		System.out.println("===�ݾ��� �����ϼ���===");
		int money = Integer.parseInt(sc.nextLine());
		while (true) {
			System.out.println("===============");
			System.out.println("1. �ݶ� 600��");
			System.out.println("2. ���̴� 400��");
			System.out.println("3. ȯŸ 900��");
			System.out.println("===============");
			System.out.println();
			System.out.println("������� �����ϼ���");
			int answer = Integer.parseInt(sc.nextLine());
			
			switch (answer) {
			case 1:
				if(money>coke) {
					money -= coke;
					System.out.println("�ֹ��Ͻ� ����� �ݶ�");
					System.out.println("�ܵ� : " + money);
					break;
				}else {
					System.out.println((coke-money)+"���� ���ڶ��ϴ�.");
					break;
				}
			case 2:
				if(money>sprite) {
					money -= sprite;
					System.out.println("�ֹ��Ͻ� ����� ���̴�");
					System.out.println("�ܵ� : " + money);
					break;
				}else {
					System.out.println((sprite-money)+"���� ���ڶ��ϴ�.");
					break;
				}
			case 3:
				if(money>hwanta) {
					money -= coke;
					System.out.println("�ֹ��Ͻ� ����� ȯŸ");
					System.out.println("�ܵ� : " + money);
					break;
				}else {
					System.out.println((hwanta-money)+"���� ���ڶ��ϴ�.");
					break;
				}

			default:
				System.out.println("�߸� �Է��ϼ̽��ϴ�.");
				break;
			}
		}
	}
}
