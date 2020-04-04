package javajungsuck.chapter6;
class MyMath {
	long a, b;
	//�ν��Ͻ� ���� a,b���� �̿��ؼ� �۾��ϹǷ� �Ű������� �ʿ����.
	long add() {
		long result = a + b;
		return result;
		//�Ǵ� return a+b;�� ǥ�� ����
	}
	long subtract() {
		return a-b;
	}
	long multiply() {
		return a*b;
	}
	double divide() {
		return a/b;
	}
	
	//�ν��Ͻ� ������ ������� �Ű����������� �۾��� �����ϴ�.
	static long add(long a, long b) {
		long result = a + b;
		return result;
		//�Ǵ� return a+b;�� ǥ�� ����
	}
	static long subtract(long a, long b) {
		//a, b�� ��������
		return a-b;
	}
	static long multiply(long a, long b) {
		return a*b;
	}
	static double divide(double d, double e) {
		return d/e;
	}
}

public class A02_StaticMethod_InstanceMethod {
//����ƽ �޼ҵ�� �ν��Ͻ� �޼ҵ��� ��
	public static void main(String[] args) {
		//Ŭ���� �޼��� ȣ��. �ν��Ͻ� �������� ȣ�� ����
		System.out.println(MyMath.add(100l, 200l));
		System.out.println(MyMath.subtract(100l, 200l));
		System.out.println(MyMath.multiply(100l, 200l));
		System.out.println(MyMath.divide(200.0, 100.0));
		
		MyMath mm = new MyMath();
		mm.a = 200l;
		mm.b = 100l;
		
		//�ν��Ͻ� �޼���� ��ü ���� �Ŀ��� ȣ���� ������
		System.out.println(mm.add());
		System.out.println(mm.subtract());
		System.out.println(mm.multiply());
		System.out.println(mm.divide());
	}

}

