package javaQuiz.q6;

import java.util.Scanner;

/*
�迭 �ʱ�ȭ
int[] iArrAnswer = {8, 1, 4};
String[] strArrStrike =
{����, ������Ʈ����ũ��, ������Ʈ����ũ��, ���ƿ���};
String[] strArrBall = {����, ��������, ��������, ����������};
�Է��� ���ڰ� �ڸ����� �޶� ������
   �Ǿ��ִٸ� 1���� ����
�Է��� ���ڰ� �ڸ������� �´´ٸ�
   1���� ����Ʈ����ũ
- ������ ������ ���⶧���� �ݺ�
 */
class Q3 {

	public static void main(String[] args) {
		int[] iArrAnswer = { 8, 1, 4 };
		String[] strArrStrike = { "", "����Ʈ����ũ", "����Ʈ����ũ", "�ƿ�" };
		String[] strArrBall = {"", "����", "����", "������"};
		
		Scanner sc = new Scanner(System.in);

		int[] answer = new int[3];
		for (int i : answer) {
			System.out.println("���ڸ� �Է��ϼ���");
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