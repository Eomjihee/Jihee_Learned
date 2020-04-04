package javajungsuck.chapter6;
class MyMath {
	long a, b;
	//인스턴스 변수 a,b만을 이용해서 작업하므로 매개변수가 필요없다.
	long add() {
		long result = a + b;
		return result;
		//또는 return a+b;로 표현 가능
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
	
	//인스턴스 변수와 관계없이 매개변수만으로 작업이 가능하다.
	static long add(long a, long b) {
		long result = a + b;
		return result;
		//또는 return a+b;로 표현 가능
	}
	static long subtract(long a, long b) {
		//a, b는 지역변수
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
//스태틱 메소드와 인스턴스 메소드의 예
	public static void main(String[] args) {
		//클래스 메서드 호출. 인스턴스 생성없이 호출 가능
		System.out.println(MyMath.add(100l, 200l));
		System.out.println(MyMath.subtract(100l, 200l));
		System.out.println(MyMath.multiply(100l, 200l));
		System.out.println(MyMath.divide(200.0, 100.0));
		
		MyMath mm = new MyMath();
		mm.a = 200l;
		mm.b = 100l;
		
		//인스턴스 메서드는 객체 생성 후에만 호출이 가능함
		System.out.println(mm.add());
		System.out.println(mm.subtract());
		System.out.println(mm.multiply());
		System.out.println(mm.divide());
	}

}

