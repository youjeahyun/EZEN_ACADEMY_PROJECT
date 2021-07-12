import java.awt.*;
import java.awt.event.*;
import java.net.*;
import javax.swing.*;

public class firstEx05 extends MovieEx implements test {
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
		setTitle("영화 설명");    
		setLayout(null);
		page1.setLayout(null);
		am10.setBounds(400, 450, 100, 50);
		page1.add(am10);
		add(page1);

		pm15.setBounds(600, 450, 100, 50);
		page1.add(pm15);
		add(page1);

		pm20.setBounds(800, 450, 100, 50);
		page1.add(pm20);
		add(page1);

		try {
			poster.setIcon(new ImageIcon(new URL("https://movie-phinf.pstatic.net/20210218_140/1613615349840eEK4k_JPEG/movie_image.jpg?type=m665_443_2"))); //영화설명의 이미지란 ,
		} catch (MalformedURLException e) {

			e.printStackTrace();
		}		
		page1.add(poster);
		poster.setBounds(50, 30, 500, 500);

		text.setText("리스타트"); 
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

		summary.setText("줄거리:\"나는 매일 부활한다\" 늘 똑같은 아침 7시가 되면  \r\n" + 
				"일어나 정체 모를 킬러들과 숨막히는 추격전을 벌여야하는\r\n" + 
				"남자 '로이'. 무한 타임루프 속에서 매일 죽고 살기를 반복하다\r\n" + 
				"불현듯 자신의 숨겨진 액션 본능에 눈을 뜨게 되는데... \r\n" + 

				"145번째 아침, 오늘부턴 내가 킬러가 된다!\r\n");
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
			backClick();
		}	
		submit = false;
	}

}
