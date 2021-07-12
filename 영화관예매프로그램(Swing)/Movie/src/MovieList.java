import java.awt.*;
import java.awt.event.*;
import java.net.*;
import java.util.*;
import javax.swing.*;
public class MovieList{
	// 이미지와 함께 스트링을 가지도록 하고 싶다면 맵을 이용하여 데이터를 관리할 필요가 있다. 제네릭사용.
	private final Map<String, ImageIcon> imageMap; 
	public MovieList() {
		firstEx01 ex = new firstEx01(); //영화1 실행을위해 인스턴스화 시킴
		firstEx02 ex2 = new firstEx02();//영화2 실행을위해 인스턴스화 시킴
		firstEx03 ex3 = new firstEx03();//영화3 실행을위해 인스턴스화 시킴
		firstEx04 ex4 = new firstEx04();//영화4 실행을위해 인스턴스화 시킴
		firstEx05 ex5 = new firstEx05();//영화5 실행을위해 인스턴스화 시킴
		
		String[] nameList = {"귀멸의 칼날", "미나리", "소울", "라야", "리스타트"}; // 5개의 영화 추가
		//위에 선언한 이미지 맵에 createImageMap(String[] list)메소드 값 넣기
		imageMap = createImageMap(nameList); 
		//리스트 생성
		JList list = new JList(nameList);
		//list 셀의 속성을 설정해준다.
		list.setCellRenderer(new MovieListRenderer());

		//우리가 생각하는 마우스휠로 올리고내릴수있는 스크롤바 생성
		JScrollPane scroll = new JScrollPane(list); //스크롤 객체생성
		scroll.setPreferredSize(new Dimension(800, 800)); // 스크롤 사이즈조정

		JFrame frame = new JFrame(); //리스트 프레임 컨테이너 생성
		frame.add(scroll); // 위에서만든 스크롤 붙이기.
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE); // 윈도우 프로세스에서도 깔끔하게 닫아주는역할
		frame.pack(); //jfram의 내용물에맞게 알맞게 윈도우를 맞춰주는 역할
		frame.setLocationRelativeTo(null); // 윈도우즈 가운데로 창을 띄운다.
		frame.setTitle("영화 리스트"); // 좌측상단 타이틀
		frame.setVisible(true); // 화면에 출력 true로해야함. 기본적으로 화면에 안보이게했기때문

		list.addMouseListener(new MouseAdapter() {
			public void mouseClicked(MouseEvent evt) {
				if(list.isSelectedIndex(0)) {	//영화리스트에서 1번째 영화 누를때 이미지출력
					ex.rePaint(); // 해당영화의 상세진입				
					if(ex.clickSubmit()) return;{ //마우스 클릭 이슈잡기
						ex.reservationOut();  //마우스 클릭 이슈잡기
						ex.submit=false; // 마우스 클릭 이슈잡기
						ex.submit2=false;// 마우스 클릭 이슈잡기
					}	
				}
				
				else if(list.isSelectedIndex(1)) { //영화리스트에서 2번째 영화 누를때 이미지출력
					ex2.rePaint();//  해당영화의 상세진입
					if(ex2.clickSubmit()) return;{// 마우스 클릭 이슈잡기
						ex2.reservationOut(); // 마우스 클릭 이슈잡기
					}
					ex2.submit=false; // 마우스 클릭 이슈잡기
					ex2.submit2=false;// 마우스 클릭 이슈잡기
				}
				
				else if(list.isSelectedIndex(2)) {  //영화리스트에서 3번째 영화 누를때 이미지출력
					ex3.rePaint();// 해당영화의 상세진입
					if(ex3.clickSubmit()) return;{
						ex3.reservationOut();
					}
					ex3.submit=false;// 마우스 클릭 이슈잡기
					ex3.submit2=false;// 마우스 클릭 이슈잡기
			
				}	else if(list.isSelectedIndex(3)) {  //영화리스트에서 4번째 영화 누를때 이미지출력	
					ex4.rePaint();// 해당영화의 상세진입
					if(ex4.clickSubmit()) return;{// 마우스 클릭 이슈잡기
						ex4.reservationOut();// 마우스 클릭 이슈잡기
					}
					ex4.submit=false;// 마우스 클릭 이슈잡기
					ex4.submit2=false;// 마우스 클릭 이슈잡기
			
				}	else if(list.isSelectedIndex(4)) {  //영화리스트에서 5번째 영화 누를때 이미지출력
					ex5.rePaint();// 해당영화의 상세진입
					if(ex4.clickSubmit()) return;{// 마우스 클릭 이슈잡기
						ex4.reservationOut();// 마우스 클릭 이슈잡기
					}
					ex5.submit=false;// 마우스 클릭 이슈잡기
					ex5.submit2=false;// 마우스 클릭 이슈잡기
				}

			}
		});   
	}
	//DefaultListCellRenderer 셀 안에 들어가는 데이터의 정렬을 조절
	//즉 리스트내에 항목에 사용하는 디폴트의 렌더링 객체를 구축  구글링해서 했는데 이해는부족하다.
	public class MovieListRenderer extends DefaultListCellRenderer { 

		Font font = new Font("helvitica", Font.BOLD, 50); // 폰트지정

		@Override
		public Component getListCellRendererComponent( //getListCellRendererComponent메서드를 사용하여 지정된 값을 표시하도록 설정된 컴퍼넌트를 리턴한다
				JList list, Object value, int index,
				boolean isSelected, boolean cellHasFocus) {

			JLabel label = (JLabel) super.getListCellRendererComponent(
					list, value, index, isSelected, cellHasFocus);
			label.setIcon(imageMap.get((String) value));
			label.setHorizontalTextPosition(JLabel.RIGHT);//라벨 글자의 수평 위치 변경하기
			label.setFont(font);

			return label;
		}
	}
	//해쉬맵 메소드를 만들어서 사용한다.
	//해쉬맵이란 키값하고 밸류값하고 같으면 밸류값 전송한다.
	private Map<String, ImageIcon> createImageMap(String[] list) {
		Map<String, ImageIcon> map = new HashMap<>(); 	// key 값으로 value값 사용
		try {
			map.put("귀멸의 칼날", new ImageIcon(new URL("https://movie-phinf.pstatic.net/20210126_174/1611638248803840HH_JPEG/movie_image.jpg?type=m665_443_2")));
			map.put("미나리", new ImageIcon(new URL("https://movie-phinf.pstatic.net/20210303_117/1614748615541W5Yoz_JPEG/movie_image.jpg?type=m665_443_2")));
			map.put("소울", new ImageIcon(new URL("https://movie-phinf.pstatic.net/20210107_160/1609984702837oNdmw_JPEG/movie_image.jpg?type=m665_443_2")));
			map.put("라야", new ImageIcon(new URL("https://movie-phinf.pstatic.net/20210215_30/1613366376318deAa1_JPEG/movie_image.jpg?type=m665_443_2")));
			map.put("리스타트", new ImageIcon(new URL("https://movie-phinf.pstatic.net/20210218_140/1613615349840eEK4k_JPEG/movie_image.jpg?type=m665_443_2")));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return map; //정의한 값을 다시 map으로 돌려줌
	}
}