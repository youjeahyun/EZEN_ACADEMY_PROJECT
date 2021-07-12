import javax.swing.*;
public class BusinessMain {
	public static void main(String[] args) {
		MovieEx e = new MovieEx(); // 무비클래스를 실행을위해 인스턴스화시킴
	
		try { //
			//느낌있는 ui를 위해서 lookandfeel을 사용한다. 아래는 약간어두운 테마라고 보면된다.
			UIManager.setLookAndFeel("com.jtattoo.plaf.hifi.HiFiLookAndFeel");
		} catch (ClassNotFoundException e1) { //
			e1.printStackTrace();
		} catch (InstantiationException e1) {
			e1.printStackTrace();
		} catch (IllegalAccessException e1) {
			e1.printStackTrace();
		} catch (UnsupportedLookAndFeelException e1) {
			e1.printStackTrace();
		}
		e.firstMain(); // 무비클래스 인스턴스화시킨 e로 무비클래스 firstMain 메소드 실행
		e.firstClick(); // 무비클래스 인스턴스화시킨 e로 무비클래스 firstClick 메소드 실행

	}
}
