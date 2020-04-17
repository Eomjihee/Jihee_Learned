package kr.or.bit;

import java.util.Scanner;

public class Ex07_printf_format {

	public static void main(String[] args) {
		//java : System.out.println();
		//C# : Consol.WriteLine();
		
		System.out.println();//줄바꿈
		System.out.print("A");
		System.out.print("B");
		System.out.println("C");
		System.out.println("D");
		
		int num = 100;
		System.out.println(num);
		System.out.println("num값은 : " + num + "입니다."); //+는 연산이 아닌 결합
		
		//형식 format해서 자유롭게 쓰겠다. 해서 나온게 printf
		//프린트를 포맷하고 거기에 들어갈것들을 나열을 해라
		System.out.printf("num 값은 : %d 입니다. \n",num);//%d라는 구멍을 뚫어둘 테니 ',변수' 값을 집어넣어라.
		//format 형식 문자(약속)
		//%d : 10진수 형식의 정수값을 집어넣어라. >> d의 자리에
		//%f (실수)
		//%s (문자열) >> String의 s
		//%c >> char
		// \t > tab , \n > enter(줄바꿈)
		System.out.printf("num 값은 [%d] 입니다. 그리고 [%d]도 있어요 \n",num,5555);
		
		float f = 3.14f;
		System.out.println(f);
		System.out.printf("f 변수값은 %f입니다.\n",f);
		
		//반대로 cmd (콘솔창 consol) 창에서 데이터 입력 받기
		//이런걸 읽을때는 util이라고 한다
		Scanner sc = new Scanner(System.in);
		//함수가 클래스이름과 같은 것을 컨스트럭터 = 생성자라고 한다. 객체가 생성될때 호출되는 함수.
		//메소드 오버로딩 : 타입은 같은데 객체의 이름이 다른 것?? 다시알아볼것
		
		//import 구문 자동생성 단축키
		//ctrl + shift + O : 모든 import되지 않은 경로를 알아서 import해준다.
		//input read!! output write!!
		//System.out.println("값을 입력하세요.");
		//String value = sc.nextLine(); //입력값을 기다리며 대기상태로 가는것. 
		//값을 입력하지 않으면 프로그램은 종료되지 않는다.
		//System.out.println(value + "라고 하셨네요.");
		
		//int number = sc.nextInt();
		//System.out.println("정수값 : " + number); //정수값이 아닌 문자열이 들어오면 에러발생
		
		//float fnumber = sc.nextFloat();
		//System.out.println("실수값 : " + fnumber);
		
		//권장사항 : nextInt, nextFloat으로 직접 숫자를 받기보다는 전부 nextLine() 사용 권장
		//Today Point 무조건 암기하기
		//웹에서 입력하는 모든 값은 다 문자열이다. 받은 다음 숫자로 변환한다고 함. 그래서 데이터를 변환하는 일이 많다고 함
		
		//그 래 서!! 문자를 > 숫자로 (정수, 실수) 바꿔주어야함.
		//Integer.parseInt("11"); 문자열을 정수로
		//Integer.parseFloat("3.111"); 문자열을 실수로
		
		System.out.println("숫자 입력하세요.");
		int num2 = Integer.parseInt(sc.nextLine());
		System.out.println("정수 값 : " + num2);
		
		//Tip
		//숫자를 >문자로
		String data = String.valueOf(100000);

	}

}
