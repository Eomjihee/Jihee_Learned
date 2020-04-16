package book;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

//도서 관리자 클래스

import java.util.HashMap;

import java.util.Scanner;
import java.util.Set;

public class BookManager {

	Scanner scan = new Scanner(System.in);

	HashMap<String, Book> book_dic = new HashMap<String, Book>();

	public void Run() {

		int key = 0;

		while ((key = selectMenu()) != 0) {

			switch (key) {

			case 1:
				addBook();
				break;

			case 2:
				removeBook();
				break;

			case 3:
				searchBook();
				break;
				
			case 4:
				saveBook();
				break;
				
			case 5:
				loadBook();
				break;
				
			case 6:
				listBook();
				break;
				
			case 7:
				listISBN();
				break;

			default:
				System.out.println("잘못 선택하였습니다.");
				break;

			}

		}

		System.out.println("종료합니다...");

	}

	int selectMenu() {

		System.out.println("1:책 생성\n2:책 삭제 \n3:검색 \n4:책정보 저장 \n5:책정보 읽기 \n6:목록 \n7:ISBN 목록 \n0:종료");

		int key = scan.nextInt();

		scan.nextLine();

		return key;

	}
	
	void saveBook() {
		//Stream , Buffer, 직렬화
		File file = new File("Book.txt");
		FileOutputStream fos = null;
		BufferedOutputStream bos = null;
		ObjectOutputStream oos = null;
				
		try {
			fos = new FileOutputStream(file);
			bos = new BufferedOutputStream(fos);
			oos = new ObjectOutputStream(bos);
					
			oos.writeObject(book_dic);
		} catch (Exception e) {
			System.out.println("에러발생ㅜ");
			e.printStackTrace();
		}finally {
			try {
				oos.close();
				bos.close();
				fos.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		System.out.println("책 txt파일 저장.");
	}
	void loadBook() {
		System.out.println("책을 load합니다.");
		String filename = "Book.txt";
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ObjectInputStream ois = null;
		
		try {
			fis = new FileInputStream(filename);
			bis = new BufferedInputStream(fis);
			ois = new ObjectInputStream(bis);
			
			book_dic = (HashMap)ois.readObject();
			Set <String> set = book_dic.keySet();
			System.out.println("[ISBN 번호]\t[제목]\t[가격]");
			System.out.println("-----------------------------------------");
			for(String books : set) {
				String isbn = book_dic.get(books).isbn;
				String title = book_dic.get(books).title;
				int price  = book_dic.get(books).price;
				System.out.printf("[%s]\t[%s]\t[%d]\n",isbn,title,price);
				System.out.println("-----------------------------------------");
				
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				ois.close();
				bis.close();
				fis.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	void addBook() {
		
		String isbn;
		

		System.out.print("추가할 도서 ISBN:");

		isbn = scan.nextLine();

		if (book_dic.containsKey(isbn)) {

			System.out.println("이미 존재하는 ISBN입니다.");

			return;

		}

		String title;

		int price;

		System.out.print("도서 제목:");

		title = scan.nextLine();

		System.out.print("가격:");

		price = scan.nextInt();

		scan.nextLine();

		Book book = new Book(isbn, title, price);

		book_dic.put(isbn, book);

		System.out.println(book.toString() + " 생성하였습니다.");
		

	}

	void removeBook() {

		String isbn;

		System.out.print("삭제할 도서 ISBN:");

		isbn = scan.nextLine();

		if (book_dic.containsKey(isbn)) {

			book_dic.remove(isbn);

			System.out.println("삭제하였습니다.");

		}

		else {

			System.out.println("존재하지 않습니다.");

		}

	}

	void searchBook() {

		String isbn;

		System.out.print("검색할 도서 ISBN:");

		isbn = scan.nextLine();

		if (book_dic.containsKey(isbn)) {

			Book book = book_dic.get(isbn);

			System.out.println("검색 결과>>" + book.toString());

		}

		else {

			System.out.println("존재하지 않습니다.");

		}

	}

	void listBook() {
		
		System.out.println("**************************");
		System.out.println("도서 목록");
		

		int cnt = book_dic.size();

		System.out.println("도서 수:" + cnt);

		for (Book book : book_dic.values()) {

			System.out.println(book.toString());

		}

	}

	void listISBN() {

		System.out.println("ISBN 목록");

		int cnt = book_dic.size();

		System.out.println("도서 수:" + cnt);

		for (String isbn : book_dic.keySet()) {

			System.out.println(isbn);

		}

	}

}