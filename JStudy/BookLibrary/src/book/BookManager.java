package book;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

//���� ������ Ŭ����

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
				System.out.println("�߸� �����Ͽ����ϴ�.");
				break;

			}

		}

		System.out.println("�����մϴ�...");

	}

	int selectMenu() {

		System.out.println("1:å ����\n2:å ���� \n3:�˻� \n4:å���� ���� \n5:å���� �б� \n6:��� \n7:ISBN ��� \n0:����");

		int key = scan.nextInt();

		scan.nextLine();

		return key;

	}
	
	void saveBook() {
		//Stream , Buffer, ����ȭ
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
			System.out.println("�����߻���");
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
		System.out.println("å txt���� ����.");
	}
	void loadBook() {
		System.out.println("å�� load�մϴ�.");
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
			System.out.println("[ISBN ��ȣ]\t[����]\t[����]");
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
		

		System.out.print("�߰��� ���� ISBN:");

		isbn = scan.nextLine();

		if (book_dic.containsKey(isbn)) {

			System.out.println("�̹� �����ϴ� ISBN�Դϴ�.");

			return;

		}

		String title;

		int price;

		System.out.print("���� ����:");

		title = scan.nextLine();

		System.out.print("����:");

		price = scan.nextInt();

		scan.nextLine();

		Book book = new Book(isbn, title, price);

		book_dic.put(isbn, book);

		System.out.println(book.toString() + " �����Ͽ����ϴ�.");
		

	}

	void removeBook() {

		String isbn;

		System.out.print("������ ���� ISBN:");

		isbn = scan.nextLine();

		if (book_dic.containsKey(isbn)) {

			book_dic.remove(isbn);

			System.out.println("�����Ͽ����ϴ�.");

		}

		else {

			System.out.println("�������� �ʽ��ϴ�.");

		}

	}

	void searchBook() {

		String isbn;

		System.out.print("�˻��� ���� ISBN:");

		isbn = scan.nextLine();

		if (book_dic.containsKey(isbn)) {

			Book book = book_dic.get(isbn);

			System.out.println("�˻� ���>>" + book.toString());

		}

		else {

			System.out.println("�������� �ʽ��ϴ�.");

		}

	}

	void listBook() {
		
		System.out.println("**************************");
		System.out.println("���� ���");
		

		int cnt = book_dic.size();

		System.out.println("���� ��:" + cnt);

		for (Book book : book_dic.values()) {

			System.out.println(book.toString());

		}

	}

	void listISBN() {

		System.out.println("ISBN ���");

		int cnt = book_dic.size();

		System.out.println("���� ��:" + cnt);

		for (String isbn : book_dic.keySet()) {

			System.out.println(isbn);

		}

	}

}