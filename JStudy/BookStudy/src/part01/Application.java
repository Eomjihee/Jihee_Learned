package part01;

import java.awt.Menu;

public class Application implements OnClickListener {
	// ���� (������ ���)implements�� OnClickListener�� ���� ����
	private Menu menu1 = new Menu("menu1");
	private Menu menu2 = new Menu("menu2");
	private Button button1 = new Button("button1");

	private ScreenUI currentScreen = null;
	// ���� �������� �ʰ� ���� �Ǿ���.

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
	// �뵵�� �°� �� �� ����ϰ� �и��غ���.

	// ---------------------------�޴� �̺�Ʈ ó�� �޼���---------------------------
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
	//---------------------------��ư �̺�Ʈ ó�� �޼���---------------------------
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