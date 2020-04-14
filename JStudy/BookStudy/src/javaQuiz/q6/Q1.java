package javaQuiz.q6;

import java.util.Arrays;
import java.util.Scanner;

/*
Scanner 사용 (성적 입력)
import java.util.Scanner;
Scanner sc = new Scanner(System.in);
ex) int val = sc.nextInt(); //정수 입력 받기
배열의 크기 : 배열이름.length
선언 할 변수 : 
  arrScore (입력받은 성적을 5개 저장할 수 있는 배열)
  iTotal (성적 총합을 저장할 변수)
  dAverage (성적 평균을 저장할 변수)
평균은 소수점 첫째자리까지만 표현
 */
public class Q1 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int[] arrScore = new int[5];
		int iTotal = 0;

		for(int i = 0; i < arrScore.length; i++) {
			System.out.println((i+1)+"번째 성적 입력하기");
			arrScore[i] = Integer.parseInt(sc.nextLine());
			iTotal += arrScore[i];
		}
		float dAverage = ((float)iTotal)/5;
		System.out.println("입력한 점수 : "+Arrays.toString(arrScore));
		System.out.println("입력한 점수 총 합 : " + iTotal);
		System.out.printf("입력한 점수 평균 : %.1f",dAverage);
	}
}
