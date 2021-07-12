import java.awt.*;
import java.awt.event.*;
import java.net.*;
import javax.swing.*;

public class MovieEx1 extends MovieEx implements test {
	private int reset;
	@Override 
	public void click() {//인터페이스 재정의
	}
	@Override
	public void seat() { //좌석 인터페이스 정의
		for(int i=0;i<btntext.length;i++) { //25개의 좌석을 반복		
			btn[i]=new JButton(btntext[i]);//25개의 버튼을 텍스트로지정했던것으로 초기화
			if(btnColor[i] ==0) { //기본값은 0이므로 좌석은 에초에
				btn[i].setForeground(Color.gray); //회색이다
			}
			else if(btnColor[i]==1) { // 그외에는 기본값이 아니므로
				btn[i].setForeground(Color.red); // 빨강이다.
			}
			btn[i].setVisible(true);//좌석을 보이게 화면에 출력한다.
			
			//최대한 영화포스터를 안가리기 위함.
			btn[i].setBorderPainted(false);// 좌석의 버튼은 테두리 설정 없게한다.
			btn[i].setContentAreaFilled(false);//좌석의 버튼 내용영역 채우기도 없게한다.
			btn[i].setFocusPainted(false);//좌석의 버튼이 선택 되었을때도 생기는 테두리도없게한다. 
			page1.add(btn[i]);//프레임에 버튼 추가
		}
	
		//좌석 정의	
		add(page1); // 프레임에 붙인다
		btn[0].setBounds(100,100, 80, 80); //(x좌표,y좌표,가로길이,세로길이) 이하 동일.	
		btn[1].setBounds(200,100, 80, 80); 
		btn[2].setBounds(300,100, 80, 80); 
		btn[3].setBounds(400,100, 80, 80);
		btn[4].setBounds(500,100, 80, 80);
		
		btn[5].setBounds(100,200, 80, 80);
		btn[6].setBounds(200,200, 80, 80);
		btn[7].setBounds(300,200, 80, 80);
		btn[8].setBounds(400,200, 80, 80);
		btn[9].setBounds(500,200, 80, 80);

		btn[10].setBounds(100,300, 80, 80);
		btn[11].setBounds(200,300, 80, 80);
		btn[12].setBounds(300,300, 80, 80);
		btn[13].setBounds(400,300, 80, 80);
		btn[14].setBounds(500,300, 80, 80);

		btn[15].setBounds(100,400, 80, 80);
		btn[16].setBounds(200,400, 80, 80);
		btn[17].setBounds(300,400, 80, 80);
		btn[18].setBounds(400,400, 80, 80);
		btn[19].setBounds(500,400, 80, 80);
		
		btn[20].setBounds(100,500, 80, 80);
		btn[21].setBounds(200,500, 80, 80);
		btn[22].setBounds(300,500, 80, 80);
		btn[23].setBounds(400,500, 80, 80);
		btn[24].setBounds(500,500, 80, 80);
		
		//예약취소버튼 정의 	
		add(page1);// 프레임에 붙인다
		b.setBounds(200, 570, 100, 80); //(x좌표,y좌표,가로길이,세로길이)
		b.setBorderPainted(false);// 예약취소의 버튼은 테두리 설정 없게한다.
		b.setContentAreaFilled(false);//예약취소의 버튼 내용영역 채우기도 없게한다.
		b.setFocusPainted(false);//예약취소의 버튼이 선택 되었을때도 생기는 테두리도없게한다. 
		b.setVisible(true);//예약취소버튼을 보이게 화면에 출력한다.
		page1.add(b); //page 패널에 적용시켜서 화면상에 올린다. ->자바로생각하면 print랑 비슷한개념임.
		
		//뒤로가기버튼 정의
		add(page1);// 프레임에 붙인다
		b2.setBounds(400, 570, 100, 80);//(x좌표,y좌표,가로길이,세로길이)
		b2.setBorderPainted(false);//뒤로가기 버튼은 테두리 설정 없게한다.
		b2.setContentAreaFilled(false);//뒤로가기 버튼 내용영역 채우기도 없게한다.
		b2.setFocusPainted(false);//뒤로가기 보이게 화면에 출력한다.
		b2.setVisible(true);//뒤로가기 버튼을 보이게 화면에 출력한다.
		page1.add(b2);//page 패널에 적용시켜서 화면상에 올린다. ->자바로생각하면 print랑 비슷한개념임.
		
		//스크린의 위치 정의
		add(page1);// 프레임에 붙인다
		text5.setText("S c r e e n"); // 텍스트로 기입한다.
		text5.setBounds(100, 10, 800, 80); //(x좌표,y좌표,가로길이,세로길이) 설정
		text5.setFont(font3);//("helvitica", Font.BOLD, 100) 정의했던 폰트3을 적용시킨다.
		page1.add(text5);//page 패널에 적용시켜서 화면상에 올린다. ->자바로생각하면 print랑 비슷한개념임.
	}

	@Override
	public void rePaint() { //인터페이스 재정의
		
		//패널 바뀔때 사용
		page1.removeAll(); // 모든 항목 삭제
		page1.revalidate(); //동적변화에서 변화를 주려고 93~94 2줄 기입함
		page1.repaint();	//동적변화에서 변화를 주려고  93~94 2줄 기입함

		setLayout(null);//위치와 크기 조절 가능하게 해준다.
		page1.setLayout(null);//레이아웃 배치관리자값을 null 값으로 준것임(위치와 크기 조절 가능하게 해준다.)
	
		setTitle("영화 좌석"); //프레임의 좌측상단 타이틀을 해당문구로지정한다.
		setSize(700,700);//프레임의 크기
		setLocationRelativeTo(null);//창이 가운데 나오게해준다.
		page1.setBounds(0, 0, 700, 700);//(x좌표,y좌표,가로길이,세로길이)
		setVisible(true);//프레임을 보이게 화면에 출력한다.

		seat(); // 인터페이스 재정의한거 호출
		seatClick(); // 인터페이스 재정의한거 호출 
	}

	@Override
	public  void seatClick() {
		int i; //필드
		for(i=0;i<btn.length;i++) {  //0으로 초기화 , 좌석개수만큼 반복
			int j = i;	//임의의 값이 눌리면  그값을 j에넣겠다 

			btn[i].addMouseListener(new MouseAdapter() { // 특정좌석을 클릭했을떄
				public void mouseClicked(MouseEvent evt) {//실행이되는 메소드
					int gubun; //색깔구분을위해
					gubun=1; // 구분이1이면 색깔이 변한다 빨강으로
					
					btnCount[j]++; //기본값이 0이기때문에 예약이되면 증가를 시켜 경고창을 띄움을 위해서.

					if(btnCount[j]>1) { //기본값이 0이기때문에 예약이되면 증가를 시켜 경고창을 띄움을 위한 조건
						JOptionPane.showMessageDialog(null,"이미 예약되어있는 자리입니다."); // 경고창 출력
					}
					else{	//그외엔
						String reservation =JOptionPane.showInputDialog("예약하실 이름을 입력해 주세요"); //예약이가능.
						if((reservation != null)&&(reservation.length()>0)) {//예약자명이 있어야하고, 배열길이가 0보다커야된다.
							btn[j].setText(reservation);//텍스트배열에 들어가있는것을 화면에 띄워준다.
							btntext[j] = reservation; //텍스트에넣어준다.
							btn[j].setForeground(Color.red);//넣어진 텍스트는 빨강으로변한다.
							btnColor[j] = gubun; // 구분이 1이되어 빨강되었으므로 j에넣어준다.

							if(reset == 1 ) { //10시에 대한 상영관이 예약이 되었으면.
								seatCount[0]-=1; // 남은좌석 기본값 25에서 한좌석을 차감시킨다.
								
							}
							else if(reset == 2) {//15시에 대한 상영관이 예약이 되었으면.
								seatCount[1]-=1;// 남은좌석 기본값 25에서 한좌석을 차감시킨다.
								
							}
							else if(reset == 3) {//20시에 대한 상영관이 예약이 되었으면.
								seatCount[2]-=1;// 남은좌석 기본값 25에서 한좌석을 차감시킨다.
								
							}

						}
						else{//예약이안되었으면
							btn[j].setText(btntext[j]);// 고대로
							btnCount[j]= 0;// 기본값을 준다.
						}

					}	
				}

			});
		}
	}	

	@Override
	public void reservationOut() { //예약취소
		b.addMouseListener(new MouseAdapter() {//예약취소 버튼을 누르게 되면
			public void mouseClicked(MouseEvent evt) {//해당 메소드실행
				boolean run2 = false; //boolean 조건은 false로 준다.

				String reservation2 =JOptionPane.showInputDialog("예약을 취소하실 이름을 입력해주세요"); //예약취소하는 이름의 창을 보여줌
				for(int i =0;i<btntext.length;i++) {  //좌석의 개수만큼 반복을준다
					if(btntext[i].equals(reservation2)) {			
						btnCount[i]= 0; //기본값인 0으로 변경하기위함
						btnColor[i]=0;//기본값인 0으로 변경하기위함
						btntext[i] = "취소"; //좌석의 텍스트를 취소로 변경하기 위함
						btn[i].setText(btntext[i]);//취소 텍스트 출력
						btn[i].setForeground(Color.gray);//빨강색에서  기본인 회색으로 변경
						run2=true; // 취소가 완료되면 정상적으로 돌아오기위해
						submit =false;//마우스 한번만 클릭하게 해주는 것 submit을 false로 둬서 한번 실행하게 한뒤에 submit을 true로 변경하여 실행되지 않게한다.
						System.out.println(submit);//마우스 한번만 클릭하게 해주는 것 submit을 false로 둬서 한번 실행하게 한뒤에 submit을 true로 변경하여 실행되지 않게한다.
						if(reset == 1 ) { //10시에 대한 상영관이 예약취소가 완료 되었으면.
							seatCount[0]+=1; // 남은좌석의 갯수를 1증가시킨다.
						
						}
						else if(reset == 2) {//15시에 대한 상영관이 예약취소가 완료 되었으면.
							seatCount[1]+=1; // 남은좌석의 갯수를 1증가시킨다.
						
						}
						else if(reset == 3) {//20시에 대한 상영관이 예약취소가 완료 되었으면.
							seatCount[2]+=1; // 남은좌석의 갯수를 1증가시킨다.
					
						}
					} 
				}
				if(!run2){ //예약취소중 예약자명을 쓰지않거나, 오타가 날경우
					JOptionPane.showMessageDialog(null,"예약자명을 잘못입력하셨거나 아무것도 입력하지 않으셨습니다."); // 해당 경고창 출력
					submit =false;//마우스 한번만 클릭하게 해주는 것 submit을 false로 둬서 한번 실행하게 한뒤에 submit을 true로 변경하여 실행되지 않게한다.
					System.out.println(submit);//마우스 한번만 클릭하게 해주는 것 submit을 false로 둬서 한번 실행하게 한뒤에 submit을 true로 변경하여 실행되지 않게한다.
				}
			}         
		});
	}

	@Override
	public void backClick() {

		b2.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent evt) {
		
				dispose();

			}         
		});
	}
	public MovieEx1(int reset) {
		this.reset = reset;
	}

}
