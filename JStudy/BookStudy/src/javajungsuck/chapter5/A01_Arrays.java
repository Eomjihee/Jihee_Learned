package javajungsuck.chapter5;

import java.util.Arrays;

/*
�迭 ��� ��,
char �迭�� ������ System.out.println(chArr)�̷��� ���� ����� �����ϴ�.

�ٸ� Ÿ���� ���
System.out.println(Arrays.toString(iArr)); �̷��� ���·� �迭�� ������ ��°�����
*/
public class A01_Arrays {

	public static void main(String[] args) {
		int[] iArr = {100, 95, 80, 70, 60};
		System.out.println(iArr); //�ǵ���� ��� �ȵ�. I@15db9742
		
		//for���� ���� ���
		for(int i = 0; i< iArr.length; i++) {
			System.out.println(iArr[i]);
		}
		
		//Arrays�� toString ��� �̿�
		System.out.println(Arrays.toString(iArr));

	}

}
