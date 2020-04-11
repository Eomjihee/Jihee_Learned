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
		
		/*
		스태틱을 언제 붙여야하는가
		
		1. 클래스를 설계할 때 멤버변수 중 모든 인스턴스에 공통으로 사용하는 것에 static을 붙인다
		생성된 각 인스턴스는 서로 독립적이기 때문에 각 인스턴스의 변수(iv)는 서로 다른 값을 유지한다.
		그러나 모든 인스턴스에서 같은 값이 유지되어야하는 벼수는 static을 붙여서 클래스 변수로 정의해야한다.
		
		2. 클래스 변수(static변수)는 인스턴스를 생성하지 않아도 사용할 수 있다.
		static이 붙은 변수는 클래스가 메모리에 올라갈 때 이미 자동적으로 생성되기 때문
		
		3. 클래스 메서드는 인스턴스 변수를 사용할 수 없다.
		반대로 인스턴스 변수나 인스턴스 메서드에서는 static이 붙은 멤버들을 사용하는것이 언제나 가능하다
		인스턴스 변수가 존재한다는 것은 static변수가 이미 메모리에 존재한다는 것을 의미하기 때문
		
		4. 메서드 내에서 인스턴스 변수를 사용하지 않는다면, static을 붙이는 것을 고려한다.
		메서드의 작업 내용중에서 인스턴스 변수를 필요로 한다면, static을 붙일 수 없다.
		반대로 인스턴스 변수를 필요로 하지 않는다면 static을 붙이는 것을 고려한다.
		메서드 호출 시간이 짧아지므로 성능이 향상된다.
		static을 안붙인 메서드(인스턴스 메서드)는 실행시 호출되어야할 메서드를 찾는 과정이 추가적으로 필요하여 시간이 더 걸린다.
		
		**클래스의 멤버 변수 중 모든 인스턴스에 공통된 값을 유지해야 하는 것이 있는지 살펴보고, 있다면 static을 붙여준다.
		**작성한 메서드 중에 인스턴스 변수나 인스턴스 메소드를 사용하지 않는 메서드에 static을 붙이는 것을 고려한다
		
		
		 */
	}

}

