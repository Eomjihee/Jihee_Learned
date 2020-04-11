package javaQuiz.q1;
/*
출력이 되지않는 변수를 수정하고
이유를 주석으로 설명하세요.
*/
public class Q01 {
	public static void main(String[] args) {
		int num = 1;
		
		float sample = 10.0f;
		//float sample = 10.0;
		//기본 타입이 double이므로 뒤에 f를 붙여야 정상 출력 가능
		
		int val = 10;
		
		int i = 0;
		//int int = 0;
		//int는 예약어 이므로 쓸 수 없는 변수명. 다른것으로 수정해야함
		
		String hellow = "world";
		//long hellow = "world";
		//long은 숫자타입이므로 문자열을 받을 수 없다.
		
		char hellow2 = '자';
		//char hellow2 = "자바";
		//char는 문자열은 담을 수 없고, 문자만 담을 수 있다.
		
		float value = 100;
		char ch = 'J';
		
		double d = 10.0;
		//Double double = 10.0;
		//double타입의 double (예약어 겹침 및 대문자 안됨)

		boolean b = (3 < 1 ? true : false);
		//boolean b = (3 < 1 ? 1 : 2);
		//boolean 타입은 true 또는 false만 가능
		/*
		*/
		System.out.println("1번 : " + num);
		System.out.println("2번 : " + sample);
		System.out.println("3번 : " + val);
		System.out.println("4번 : " + i);
		System.out.println("5번 : " + hellow);
		System.out.println("6번 : " + hellow2);
		System.out.println("7번 : " + value);
		System.out.println("8번 : " + ch);
		System.out.println("9번 : " + d);
		System.out.println("10번 : " + b);
	}
}
