import java.awt.*;
import java.awt.event.*;
import java.net.*;

import javax.swing.*;
public class firstEx02 extends MovieEx implements test {
	MovieEx1 [] ex = {new MovieEx1(1),new MovieEx1(2),new MovieEx1(3)};
	@Override
	public  void seatClick() {
	}	
	@Override
	public void reservationOut() {
	}
	@Override
	public void backClick() {
	}
	@Override
	public void seat() {
	}
	@Override
	public void click() {
		am10.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent evt) {
				dispose();
				ex[0].rePaint();
				ex[0].backClick();
				if(ex[0].clickSubmit2())return;{	
					ex[0].reservationOut();
				}
				ex[0].submit =false;

			}
		}); 

		pm15.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent evt) {

				dispose();
				ex[1].rePaint();
				ex[1].backClick();

				if(ex[1].clickSubmit2())return;{		
					ex[1].reservationOut();
				}

			}
		});

		pm20.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent evt) {

				dispose();
				ex[2].rePaint();
				ex[2].backClick();

				if(ex[2].clickSubmit2())return;{
					
					ex[2].reservationOut();
				}
			}
		});  
	}
	@Override
	public void rePaint() {
		// TODO Auto-generated method stub
		setTitle("영화 설명");    
		setLayout(null);
		page1.setLayout(null);

		am10.setBounds(400, 450, 100, 50);
		page1.add(am10);
		pm15.setBounds(600, 450, 100, 50);
		page1.add(pm15);
		pm20.setBounds(800, 450, 100, 50);
		page1.add(pm20);
		add(page1);

		//페이지에 uml 이미지 가져오는 방법
		try {
			poster.setIcon(new ImageIcon(new URL("https://movie-phinf.pstatic.net/20210303_117/1614748615541W5Yoz_JPEG/movie_image.jpg?type=m665_443_2")));
		} catch (MalformedURLException e) {

			e.printStackTrace();
		}		
		page1.add(poster);
		poster.setBounds(50, 30, 500, 500);

		text.setText("미나리");
		page1.add(text);
		text.setBounds(500, 60, 300, 80);
		text.setFont(font);

		System.out.println(ex[0].seatCount[0]+"의 값");
		text2.setText("남은 좌석:"+ex[0].seatCount[0]);
		page1.add(text2);
		text2.setBounds(410,400,100,50);


		text3.setText("남은 좌석:"+ex[1].seatCount[1]);
		page1.add(text3);
			text3.setBounds(610,400,100,50);

		text4.setText("남은 좌석:"+ex[2].seatCount[2]);
		page1.add(text4);
		text4.setBounds(810,400,100,50);

		summary.setText("줄거리:\"미나리는 어디서든 잘 자라\"낯선 미국,\r\n" + 
				"아칸소로 떠나온 한국 가족. 가족들에게 뭔가 해내는 걸 보여주고\r\n" + 
				"싶은 아빠 '제이콥'은 자신만의 농장을 가꾸기 시작하고\r\n" + 
				"엄마 '모니카'도 다시 일자리를 찾는다.아직 어린 아이들을 위해\r\n" + 

				"‘모니카’의 엄마 ‘순자’가 함께 살기로 하고 가방 가득 \r\n" + 
				"고춧가루,멸치,한약 그리고 미나리씨를 담은 할머니가 도착한다.\r\n" + 

				"함께 있다면 새로 시작할 수 있다는  희망으로 하루하루 \r\n" +
				"뿌리 내리며 살아가는 어느 가족의 아주 특별한 여정이 시작된다!");
		page1.add(summary);
		summary.setBounds(380, 130, 600, 250);
		summary.setFont(font2);
		summary.setBorder(null);		
		summary.setFocusable(false);
		summary.setBackground(null);
		add(page1);

		setSize(1000,600);//프레임의 크기
		setResizable(false);//창의 크기를 변경하지 못하게
		setLocationRelativeTo(null);//창이 가운데 나오게
		setVisible(true);//창이 보이게	
		page1.setBounds(0, 0, 1000, 600);
		if(clickSubmit()) return;{
			click();
		}
		submit =false;
	}


}
