package javaQuiz.q5;

import java.util.Arrays;

public class Q2 {
	public static void main(String[] args) {
		int[] arr = { 45, 20, 63, 2, 71, 38, 86, 99, 12, 54 };
		int min = arr[0];
		int max = arr[0];

		System.out.println(Arrays.toString(arr));
		
		for (int i = 0; i < arr.length; i++) {
			if(arr[i] > max) {
				max = arr[i];
			}
			if(arr[i] < min) {
				min = arr[i];
			}
		}
		System.out.println(min);
		System.out.println(max);
		
		for(int i = 1; i< arr.length; i++) {
			for(int j = 0; j<i; j++) {
				if(arr[i]<arr[j]) {
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}
			}
		}
		
		System.out.println(Arrays.toString(arr));
		
	}
}
