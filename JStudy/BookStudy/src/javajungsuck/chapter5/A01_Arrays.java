package javajungsuck.chapter5;

import java.util.Arrays;

/*
배열 출력 시,
char 배열일 때에만 System.out.println(chArr)이렇게 직접 출력이 가능하다.

다른 타입인 경우
System.out.println(Arrays.toString(iArr)); 이러한 형태로 배열의 내용을 출력가능함
*/
public class A01_Arrays {

	public static void main(String[] args) {
		int[] iArr = {100, 95, 80, 70, 60};
		System.out.println(iArr); //의도대로 출력 안됨. I@15db9742
		
		//for문을 통한 출력
		for(int i = 0; i< iArr.length; i++) {
			System.out.println(iArr[i]);
		}
		
		//Arrays의 toString 기능 이용
		System.out.println(Arrays.toString(iArr));

	}

}
