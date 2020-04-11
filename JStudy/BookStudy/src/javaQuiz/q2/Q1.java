package javaQuiz.q2;

import java.util.Scanner;

public class Q1 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("==己利 涝仿==");
		int score = sc.nextInt();
		String grade = null;
		
		if(score >= 90) {
			grade = "A";
		}else if (score >= 80 && score < 90) {
			grade = "B";
		}else if (score >= 70 && score < 80) {
			grade = "C";
		}else if (score >= 60 && score < 70) {
			grade = "D";
		}else if (score <60) {
			grade = "F";
		}

		switch (grade) {
		case "A":
			System.out.println("丛 己利 : " + grade);
			break;
		case "B":
			System.out.println("丛 己利 : " + grade);
			break;
		case "C":
			System.out.println("丛 己利 : " + grade);
			break;
		case "D":
			System.out.println("丛 己利 : " + grade);
			break;
		case "F":
			System.out.println("丛 己利 : " + grade);
			break;
		}
	}

}
