package part01;

public interface ScreenUI {
	public void show();
	public void handleButton1Click();
	// ScreenUI의 show()메서드는 어떤 메뉴 버튼이 클릭될 때 실행되는 메서드로써,
	// 메뉴에 해당하는 알맞은 화면을 보여주기 위해 사용된다.
	// 버튼 1이 눌리면 handleButton1Click() 메서드가 실행된다.
}
