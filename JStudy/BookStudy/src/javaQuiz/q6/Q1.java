package javaQuiz.q6;

import java.util.Arrays;
import java.util.Scanner;

/*
Scanner ��� (���� �Է�)
import java.util.Scanner;
Scanner sc = new Scanner(System.in);
ex) int val = sc.nextInt(); //���� �Է� �ޱ�
�迭�� ũ�� : �迭�̸�.length
���� �� ���� : 
  arrScore (�Է¹��� ������ 5�� ������ �� �ִ� �迭)
  iTotal (���� ������ ������ ����)
  dAverage (���� ����� ������ ����)
����� �Ҽ��� ù°�ڸ������� ǥ��
 */
public class Q1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int[] arrScore = new int[5];
		int iTotal = 0;

		for(int i = 0; i < arrScore.length; i++) {
			System.out.println((i+1)+"��° ���� �Է��ϱ�");
			arrScore[i] = Integer.parseInt(sc.nextLine());
			iTotal += arrScore[i];
		}
		float dAverage = ((float)iTotal)/5;
		System.out.println("�Է��� ���� : "+Arrays.toString(arrScore));
		System.out.println("�Է��� ���� �� �� : " + iTotal);
		System.out.printf("�Է��� ���� ��� : %.1f",dAverage);
	}
}
