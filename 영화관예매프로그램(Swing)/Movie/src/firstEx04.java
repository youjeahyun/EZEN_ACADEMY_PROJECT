import java.awt.*;
import java.awt.event.*;
import java.net.*;
import javax.swing.*;

public class firstEx04 extends MovieEx implements test {
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

		//페이지에 uml 이미지 가져오는 방법
		try {
			poster.setIcon(new ImageIcon(new URL("https://movie-phinf.pstatic.net/20210215_30/1613366376318deAa1_JPEG/movie_image.jpg?type=m665_443_2")));
		} catch (MalformedURLException e) {

			e.printStackTrace();
		}		
		page1.add(poster);
		poster.setBounds(50, 30, 500, 500);

		text.setText("라야");
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

		summary.setText("줄거리:\"인간과 드래곤이 평화롭게 공존하던 신비의 땅\r\n" + 
				"쿠만드라 왕국 살아있는 모든 생명을 삼키는 악의 세력 드룬이, \r\n" + 
				"들이닥치자, 드래곤들은 인간을 구하기 위해 스스로를 희생하고\r\n" + 
				"전설 속으로 사라진다. 500년 후 부활한 '드룬'이 또다시 세상을  \r\n" + 

				"공포에 빠뜨리자, 전사 ‘라야’는 분열된 쿠만드라를 구하러 \r\n" + 
				"전설 속 마지막 드래곤을 찾아 모험을 떠난다.그러나, 라야는\r\n" + 

				"험난한 여정을 겪으며 세상을 구하기 위해서는 전설 속 \r\n" +
				"드래곤보다 더 중요한 것이 있다는 것을 깨닫게 되는데…");
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
