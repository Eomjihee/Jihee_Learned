package javaQuiz.q6;

import java.util.Scanner;

/*
�޸��� �ۼ� : Ex2.java
Scanner ��� (�޴�, �¼� �Է½� ���)
�¼��� ��Ÿ�� �迭 :
boolean[][] isArrSeat = new Boolean[2][5];
���� �޴� ���� ������ �ݺ� �� ��, 
���� �޴� ���ý� �ݺ����� ������������
���� �� ��.
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
		System.out.print("������ ���� �Է��ϼ���. (1,2) : ");
		col = Integer.parseInt(sc.nextLine()) - 1;
		System.out.println("1���� �¼� �� ��ȣ�� �����ϼ��� (1 ~ 5)");
		row = Integer.parseInt(sc.nextLine()) - 1;

		isArrSeat[col][row] = true;
		System.out.println("[" + (col+1) + "],[" + (row+1) + "] �¼� ���� �Ϸ�");

	}

	public static void main(String[] args) {

		Q2 q2 = new Q2();

		while (true) {
			System.out.println("====�¼� ���� ���α׷�====");
			System.out.println();
			System.out.println("1. �¼� Ȯ�� ");
			System.out.println("2. �¼� ����");
			System.out.println("3. ���� ");
			System.out.print("�޴� ���� : ");
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
				System.out.println("�߸��� �Է�");
				break;
			}
		}
	}
}
