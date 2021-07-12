import java.awt.*;
import java.awt.event.*;
import java.net.*;
import javax.swing.*;

public class firstEx03 extends MovieEx implements test {
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

		pm15.setBounds(600, 450, 100, 50);
		page1.add(pm15);

		pm20.setBounds(800, 450, 100, 50);
		page1.add(pm20);
		add(page1);

		try {
			poster.setIcon(new ImageIcon(new URL("https://movie-phinf.pstatic.net/20210107_160/1609984702837oNdmw_JPEG/movie_image.jpg?type=m665_443_2")));
		} catch (MalformedURLException e) {

			e.printStackTrace();
		}		
		page1.add(poster);
		poster.setBounds(50, 30, 500, 500);

		text.setText("소울");
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

		summary.setText("줄거리:\"뉴욕에서 음악 선생님으로 일하던 ‘조’는\r\n" + 
				"꿈에 그리던 최고의 밴드와 재즈 클럽에서 연주하게 된 그 날, \r\n" + 
				"예기치 못한 사고로 영혼이 되어 ‘태어나기 전 세상’에 떨어진다.\r\n" + 
				"탄생 전 영혼들이 멘토와 함께 자신의 관심사를 발견하면 \r\n" + 

				"지구 통행증을 발급하는 ‘태어나기 전 세상’ ‘조’는 그 곳에서 \r\n" + 
				"유일하게 지구에 가고 싶어하지 않는 시니컬한 영혼 ‘22’의 \r\n" + 

				"멘토가 된다.지구 통행증이 필요한 ‘조’ 그는 다시 \r\n" +
				"지구로 돌아가 꿈의 무대에 설 수 있을까?");
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
		submit =false;
	}

}
