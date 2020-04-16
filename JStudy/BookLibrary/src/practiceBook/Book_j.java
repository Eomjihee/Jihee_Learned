package practiceBook;

public class Book_j {
	final private String isbn;
	private String title;
	private int price;
	
	public Book_j(String isbn, String title, int price) {
		this.isbn = isbn;
		this.title = title;
		this.price = price;
	}
	
	public String Isbn() {
		return isbn;
	}

	@Override
	public String toString() {
		return String.format("ISBN : %s / 이름 : %s / 가격 : %d ", isbn, title, price);
	}
	
	
	
}
