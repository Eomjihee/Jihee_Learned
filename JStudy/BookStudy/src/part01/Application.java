package part01;

import java.awt.Menu;

public class Application implements OnClickListener {
	// 현재 (예제에 없어서)implements할 OnClickListener가 없는 상태
	private Menu menu1 = new Menu("menu1");
	private Menu menu2 = new Menu("menu2");
	private Button button1 = new Button("button1");

	private ScreenUI currentScreen = null;
	// 아직 생성되지 않고 선언만 되었다.

	public Application() {
		menu1.setOnClickListener(this);
		menu2.setOnClickListener(this);
		button1.setOnClickListener(this);
	}
	/*
	 * public void clicked(Component eventSource) { String sourceId =
	 * eventSource.getId(); if (sourceId.contentEquals("menu1")) { currentScreen =
	 * new Menu1ScreenUI(); currentScreen.show(); }else if
	 * (sourceId.equals("menu2")) { currentScreen = new Menu2ScreenUI();
	 * currentScreen.show(); }else if(sourceId.equals("button1")) { if(currentScreen
	 * == null) { return; } currentScreen.handleButton1Click(); } }
	 */
	// 용도에 맞게 좀 더 깔끔하게 분리해보자.

	// ---------------------------메뉴 이벤트 처리 메서드---------------------------
	private OnClickListener menuListener = new OnClickListener() {
		public void clicked(Component eventSource) {
			String sourceId = eventSource.getId();
			if(SourceId.equals("menu1")) {
				currentScreen = new Menu1ScreenUI();
			}else if(soruceId.equals("menu2")) {
				currentScreen = new Menu2ScreenUI();
			}	
		currentScreen.show();
		}
	};
	//---------------------------버튼 이벤트 처리 메서드---------------------------
	private OnClickListener buttonListener = new OnClickListener() {
		public void clicked(Component eventSource) {
			if(currentScreen == null) {
				return;
			}
			String sourceId = eventSource.getId();
			if(soruceId.equals("button1")) {
				currentScreen.handleButton1Click();
			}
		}
	};
}