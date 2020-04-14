package practiceBook;

import java.util.HashMap;
import java.util.Scanner;

public class BookManager_j {
	Scanner sc = new Scanner(System.in);
	HashMap<String, Book_j> bookDic = new HashMap<String, Book_j>();

	// 메뉴 선택 기능

	public void menuUi() {
		int key = 0;

		while ((key = selectMenu()) != 0) {
			switch (key) {
			case 1:
				
				break;

			default:
				break;
			}
		}
	}

	public int selectMenu() {
		System.out.println("=======서점 오신 것을 환영=======");

		System.out.println("1. 책 검색하기");
		System.out.println("2. 책 추가하기");
		System.out.println("3. 책 삭제하기");
		System.out.println("0. 종료");

		int key = Integer.parseInt(sc.nextLine());
		return key;

	}

	public void addBook() {
		String isbn;
		System.out.print("추가할 도서의 ISBN을 입력하세요 : ");
		isbn = sc.nextLine();
		
		if(bookDic.containsKey(isbn)) {
			System.out.println("이미 존재하는 ISBN입니다.");
			return;
		}
		
		//만약 존재하지 않는 ISBN이라면 계속해서 진행
		String title;
		int price;
		
		System.out.print("도서 제목을 입력하세요 : ");
		title = sc.nextLine();
		
		System.out.print("도서 가격을 입력하세요 : ");
		price = Integer.parseInt(sc.nextLine());
		
		//받은 값을 인자로 하여 Book_j 생성
		Book_j book = new Book_j(isbn, title, price);
		bookDic.put(isbn, book);
		
		//DB로 만들어줘야함--------------
		
		
		
		//--------------------------
		
		
		System.out.println(book.toString() + "생성하였습니다.");
		
	}
}
