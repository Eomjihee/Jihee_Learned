package javaQuiz.q5;

import java.util.Scanner;

/*
메모장 작성 : Ex1.java
Scanner 사용 (찾을 값 입력)import java.util.Scanner;Scanner sc = new Scanner(System.in);//선언ex) int val = sc.nextInt(); //정수 입력 받기
배열 초기화
   {10, 21, 32, 43, 54, 65, 76, 87, 98, 109}
배열의 크기 : 배열이름.length
Boolean 변수 사용하여 탐색할 값이
    있으면 몇번째에 있는지 출력,
    탐색할 값이 없으면
    “탐색할 값이 배열에 없습니다.” 출력 
*/
public class Q1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int[] iArr = { 10, 21, 32, 43, 54, 65, 76, 87, 98, 109 };

		System.out.print("탐색할 숫자 입력 : ");
		int answer = Integer.parseInt(sc.nextLine());
		int arri = 0;
		for (int i = 0; i < iArr.length; i++) {
			if (iArr[i] == answer) {
				arri = i + 1;
			}
		}
		if(arri==0) {
			System.out.println("탐색할 값이 배열에 없습니다.");
		}else {
			System.out.println("탐색한 값은" + arri + "번째에 있습니다."); 
		}

	}
}
