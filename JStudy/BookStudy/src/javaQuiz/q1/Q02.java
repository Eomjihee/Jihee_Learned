package javaQuiz.q1;

import java.util.Scanner;

public class Q02 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		while (true) {
			System.out.println("=====�����Է�=====");
			int answer = Integer.parseInt(sc.nextLine());

			if(answer == 0) {
				System.out.println("�Է��� ���ڴ� 0 �Դϴ�.");
			}else if (answer % 2 == 0) {
				System.out.println("�Է��� ����" + answer + "�� ¦�� �Դϴ�.");
			} else if (answer % 2 != 0) {
				System.out.println("�Է��� ����" + answer + "�� Ȧ�� �Դϴ�.");
			} 
		}
		
		//-----------------% ������ ���� �غ���µ� �� ���ϰڼ�
	}
}
