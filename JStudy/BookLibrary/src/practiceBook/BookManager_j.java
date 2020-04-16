package practiceBook;

import java.util.HashMap;
import java.util.Scanner;

public class BookManager_j {
	Scanner sc = new Scanner(System.in);
	HashMap<String, Book_j> bookDic = new HashMap<String, Book_j>();

	// �޴� ���� ���

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
		System.out.println("=======���� ���� ���� ȯ��=======");

		System.out.println("1. å �˻��ϱ�");
		System.out.println("2. å �߰��ϱ�");
		System.out.println("3. å �����ϱ�");
		System.out.println("0. ����");

		int key = Integer.parseInt(sc.nextLine());
		return key;

	}

	public void addBook() {
		String isbn;
		System.out.print("�߰��� ������ ISBN�� �Է��ϼ��� : ");
		isbn = sc.nextLine();
		
		if(bookDic.containsKey(isbn)) {
			System.out.println("�̹� �����ϴ� ISBN�Դϴ�.");
			return;
		}
		
		//���� �������� �ʴ� ISBN�̶�� ����ؼ� ����
		String title;
		int price;
		
		System.out.print("���� ������ �Է��ϼ��� : ");
		title = sc.nextLine();
		
		System.out.print("���� ������ �Է��ϼ��� : ");
		price = Integer.parseInt(sc.nextLine());
		
		//���� ���� ���ڷ� �Ͽ� Book_j ����
		Book_j book = new Book_j(isbn, title, price);
		bookDic.put(isbn, book);
		
		//DB�� ����������--------------
		
		
		
		//--------------------------
		
		
		System.out.println(book.toString() + "�����Ͽ����ϴ�.");
		
	}
}
