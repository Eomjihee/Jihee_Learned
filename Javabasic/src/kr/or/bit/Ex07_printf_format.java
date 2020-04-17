package kr.or.bit;

import java.util.Scanner;

public class Ex07_printf_format {

	public static void main(String[] args) {
		//java : System.out.println();
		//C# : Consol.WriteLine();
		
		System.out.println();//�ٹٲ�
		System.out.print("A");
		System.out.print("B");
		System.out.println("C");
		System.out.println("D");
		
		int num = 100;
		System.out.println(num);
		System.out.println("num���� : " + num + "�Դϴ�."); //+�� ������ �ƴ� ����
		
		//���� format�ؼ� �����Ӱ� ���ڴ�. �ؼ� ���°� printf
		//����Ʈ�� �����ϰ� �ű⿡ ���͵��� ������ �ض�
		System.out.printf("num ���� : %d �Դϴ�. \n",num);//%d��� ������ �վ�� �״� ',����' ���� ����־��.
		//format ���� ����(���)
		//%d : 10���� ������ �������� ����־��. >> d�� �ڸ���
		//%f (�Ǽ�)
		//%s (���ڿ�) >> String�� s
		//%c >> char
		// \t > tab , \n > enter(�ٹٲ�)
		System.out.printf("num ���� [%d] �Դϴ�. �׸��� [%d]�� �־�� \n",num,5555);
		
		float f = 3.14f;
		System.out.println(f);
		System.out.printf("f �������� %f�Դϴ�.\n",f);
		
		//�ݴ�� cmd (�ܼ�â consol) â���� ������ �Է� �ޱ�
		//�̷��� �������� util�̶�� �Ѵ�
		Scanner sc = new Scanner(System.in);
		//�Լ��� Ŭ�����̸��� ���� ���� ����Ʈ���� = �����ڶ�� �Ѵ�. ��ü�� �����ɶ� ȣ��Ǵ� �Լ�.
		//�޼ҵ� �����ε� : Ÿ���� ������ ��ü�� �̸��� �ٸ� ��?? �ٽþ˾ƺ���
		
		//import ���� �ڵ����� ����Ű
		//ctrl + shift + O : ��� import���� ���� ��θ� �˾Ƽ� import���ش�.
		//input read!! output write!!
		//System.out.println("���� �Է��ϼ���.");
		//String value = sc.nextLine(); //�Է°��� ��ٸ��� �����·� ���°�. 
		//���� �Է����� ������ ���α׷��� ������� �ʴ´�.
		//System.out.println(value + "��� �ϼ̳׿�.");
		
		//int number = sc.nextInt();
		//System.out.println("������ : " + number); //�������� �ƴ� ���ڿ��� ������ �����߻�
		
		//float fnumber = sc.nextFloat();
		//System.out.println("�Ǽ��� : " + fnumber);
		
		//������� : nextInt, nextFloat���� ���� ���ڸ� �ޱ⺸�ٴ� ���� nextLine() ��� ����
		//Today Point ������ �ϱ��ϱ�
		//������ �Է��ϴ� ��� ���� �� ���ڿ��̴�. ���� ���� ���ڷ� ��ȯ�Ѵٰ� ��. �׷��� �����͸� ��ȯ�ϴ� ���� ���ٰ� ��
		
		//�� �� ��!! ���ڸ� > ���ڷ� (����, �Ǽ�) �ٲ��־����.
		//Integer.parseInt("11"); ���ڿ��� ������
		//Integer.parseFloat("3.111"); ���ڿ��� �Ǽ���
		
		System.out.println("���� �Է��ϼ���.");
		int num2 = Integer.parseInt(sc.nextLine());
		System.out.println("���� �� : " + num2);
		
		//Tip
		//���ڸ� >���ڷ�
		String data = String.valueOf(100000);

	}

}
