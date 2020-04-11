package javaQuiz.q5;

import java.util.Arrays;

public class Q3 {
public static void main(String[] args) {
	int[] answer = {1,4,4,3,1,4,4,2,1,3,2};
	String[]subarr = new String[4];
	int num1 =0;
	int num2 =0;
	int num3 =0;
	int num4 =0;
	
	for(int i = 0; i<answer.length; i++) {
		if (answer[i] ==1) {
			num1++;
		}else if(answer[i] ==2) {
			num2++;
		}else if(answer[i] ==3) {
			num3++;
		}else if(answer[i] ==4) {
			num4++;
		}
		
	}
	
	for(int i = 0; i < subarr.length; i++) {
		System.out.print(i+1+". ");
		
		switch (i) {
		case 0:
			for(int j = 1; j <= num1; j++) {
				System.out.print("*");
			}
			break;
		case 1:
			for(int j = 1; j <= num2; j++) {
				System.out.print("*");
			}
			break;
		case 2:
			for(int j = 1; j <= num3; j++) {
				System.out.print("*");
			}
			break;
		case 3:
			for(int j = 1; j <= num4; j++) {
				System.out.print("*");
			}
			break;
		}
		System.out.println();
	}
	
}
}
