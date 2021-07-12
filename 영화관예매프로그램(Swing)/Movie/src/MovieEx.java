import java.awt.*; //
import java.awt.event.*;
import java.net.*;
import javax.swing.*;

public class MovieEx extends JFrame{
	/*패널1*/
	static JButton[] btn = new JButton[25]; //5*5좌석의 좌석 25개 배열갯수로 선언
	String [] btntext = {"A1","A2","A3","A4","A5","B1","B2","B3","B4","B5","C1","C2","C3","C4","C5","D1","D2","D3","D4","D5","E1","E2","E3","E4","E5"}; //텍스트 배열
	int [] btnColor = new int[25]; //좌석컬러 구분해 주는 배열
	int [] btnCount = new int[25];//예약후에 클릭하면 안되는걸 세어주는 배열	
	int [] seatCount = {25,25,25};//시간별 남은 좌석 배열

	int count=0;//없어도 됨
	
	//폰트 설정 Font("폰트이름", 폰트 스타일(Font.~), 폰트 크기(Int))
	Font font = new Font("helvitica", Font.BOLD, 50);
	Font font2 = new Font("helvitica", Font.BOLD, 20);
	Font font3 = new Font("helvitica", Font.BOLD, 100);

	//JLabel -> 수정이 불가능한 텍스트나 그림을 삽입할 때 사용한다
	JLabel text = new JLabel();  //각 영화에대한 제목 라벨 생성
	JLabel text2 = new JLabel(); //10시 남은좌석에 대한 라벨 생성
	JLabel text3 = new JLabel(); //15시 남은좌석에 대한 라벨 생성
	JLabel text4 = new JLabel(); //20시 남은좌석에 대한 라벨  생성
	JLabel text5 = new JLabel(); //상영관 내에  "Screen" 에 대한 라벨 생성
	JLabel poster = new JLabel(); //창의 그림을 삽입하는 라벨
	
	//텍스트영역
	JTextArea summary  = new JTextArea(); //줄거리에 대한 텍스트영역 생성

	//JPanel 순수한 컨테이너이며 컴포넌트들을 윈도우에 올리도록 조직화 하는것.
	JPanel page = new JPanel(); // 영화예매 프로그램실행했을때 페이지 패널생성
	JPanel page1 = new JPanel();// 영화리스트 부터의 패널 위로 붙이는식으로할거라 1개생성
	
	//JButton -> 일반적인 버튼이다. (다중선택 불가능)
	JButton am10 = new JButton("10시"); //상영시간 10시에 대한 버튼생성
	JButton pm15 = new JButton("15시"); //상영시간 15시에 대한 버튼생성
	JButton pm20 = new JButton("20시"); //상영시간 20시에 대한 버튼생성
	JButton bt = new JButton("영화표 구매"); //프로그램 실행후 영화표구매 버튼생성
	JButton b = new JButton("예약 취소"); // 영화좌석 영역에서 취소버튼 생성
	JButton b2 = new JButton("뒤로가기"); // 영화좌석 영영에서 뒤로가기 버튼 생성

	//마우스 한번만 클릭하게 해주는 것 submit을 false로 둬서 한번 실행하게 한뒤에 submit을 true로 변경하여 실행되지 않게한다.
	boolean submit = false; 
	boolean clickSubmit() {

		if(submit){
			return submit;
		}else{
			submit = true;
			return false;
		}
	}
	
	//마우스 한번만 클릭하게 해주는 것 submit을 false로 둬서 한번 실행하게 한뒤에 submit을 true로 변경하여 실행되지 않게한다.
	boolean submit2 = false;
	boolean clickSubmit2() {

		if(submit2){
			return submit2;
		}else{
			submit2 = true;
			return false;
		}
	}

	void firstMain() {
		setTitle("영화 예매 프로그램"); //프로그램 실행시 왼쪽상단 제목
		setLayout(null);//위치와 크기 조절 가능하게 해준다.
		page.setLayout(null);//레이아웃 배치관리자값을 null 값으로 준것임(위치와 크기 조절 가능하게 해준다.)
		setSize(600,435);//프레임의 크기
		setResizable(false);//창의 크기를 변경하지 못하게
		setLocationRelativeTo(null);//창이 가운데 나오게
		setVisible(true);//창이 보이게 한다
		page.setBounds(0, 0, 600, 435);//해당 컴포넌트의 절대 위치와 크기 지정 setBounds(x좌표,y좌표,가로길이,세로길이)
		bt.setBounds(182, 140, 245, 100); // bt(영화표구매)버튼 절대 위치와 크기 지정 setBounds(x좌표,y좌표,가로길이,세로길이)
		
		page.add(bt); //패널 붙이겠다~ 영화표구매를
		bt.setBorderPainted(false);//버튼 테두리 설정
		bt.setBackground(new Color(8,18,27));//해당 컴포넌트의 배경의 색깔을 지정
		bt.setForeground(Color.white);//해당 컴포넌트의 글자색을 변경
		add(page); //page 패널에 적용시켜서 화면상에 올린다. ->자바로생각하면 print랑 비슷한개념임.

	
		page.add(poster); //패널에 붙이겠다~ 사진을
		try {
			//setIcon 메소드를 사용하여 해당 이미지를 URL 값으로 가져온다.
			poster.setIcon(new ImageIcon(new URL
					("https://st2.depositphotos.com/1758336/5895/i/600/depositphotos_58955513-stock-photo-empty-movie-theater-with-red.jpg")));
		} catch (MalformedURLException e) {
				e.printStackTrace();
		}		
		poster.setBounds(0, -50, 800, 500); // 사진의 위치와 크기지정
		add(page); //page 패널에 적용시켜서 화면상에 올린다. ->자바로생각하면 print랑 비슷한개념임.
}

	void firstClick() {
		bt.addMouseListener(new MouseAdapter() { // 영화표구매 마우스이벤트
			public void mouseClicked(MouseEvent evt) {
				//리스트 나오는 부분
				dispose(); //기존에 영화관예약프로그램 인트로화면은 사라진다. exit와 다른점은 exit는 프로그램이 꺼지게되고 얘는 화면만.
				//스레드로 스윙 충돌을 막아준다. Runnable이 AWT 이벤트 디스패치 스레드에서 실행한다
				SwingUtilities.invokeLater(new Runnable() { 
					public void run() { //실행메소드
						new MovieList(); // 무비리스트클래스 실행

					}
				});

			}

		});
	}
}
