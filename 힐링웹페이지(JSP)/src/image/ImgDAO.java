package image;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import user.User;

public class ImgDAO {

	
	
	private Connection conn; // connection:db에접근하게 해주는 객체

	private PreparedStatement pstmt;

	private ResultSet rs;



	// mysql 처리부분

	public ImgDAO() {

		// 생성자를 만들어준다.

		try {

			Class.forName("com.mysql.jdbc.Driver");
			String dbURL = "jdbc:mysql://localhost:3307/BBS";
			String dbID = "root";
			String dbPassword = "zxc12564!";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace();

		}

	}

	public int imgPath(String imgPath) { 

		String SQL = "INSERT INTO imgdata(imgnum,imgphrase) VALUES(imgnum,?)";

		try {



			PreparedStatement pstmt = conn.prepareStatement(SQL);

			//pstmt.setInt(1, imgnum);
			pstmt.setString(1, imgPath);
			System.out.println(imgPath);
			return pstmt.executeUpdate();



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; //데이터베이스 오류

	}
	
	public int imgPath2(String imgPath) { 

		String SQL = "INSERT INTO imgdata(imgnum,imgpicture) VALUES(imgnum,?)";

		try {



			PreparedStatement pstmt = conn.prepareStatement(SQL);

			//pstmt.setInt(1, imgnum);
			pstmt.setString(1, imgPath);
			System.out.println(imgPath);
			return pstmt.executeUpdate();



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; //데이터베이스 오류

	}
	
	public int imgPath3(String imgPath) { 

		String SQL = "INSERT INTO imgdata(imgnum,imgpoem) VALUES(imgnum,?)";

		try {



			PreparedStatement pstmt = conn.prepareStatement(SQL);

			//pstmt.setInt(1, imgnum);
			pstmt.setString(1, imgPath);
			System.out.println(imgPath);
			return pstmt.executeUpdate();



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; //데이터베이스 오류

	}
	
	public int imgPath4(String imgPath) { 

		String SQL = "INSERT INTO imgdata(imgnum,imgsay) VALUES(imgnum,?)";

		try {



			PreparedStatement pstmt = conn.prepareStatement(SQL);

			//pstmt.setInt(1, imgnum);
			pstmt.setString(1, imgPath);
			System.out.println(imgPath);
			return pstmt.executeUpdate();



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; //데이터베이스 오류

	}

	public List<Img> test() { 
		List<Img> list = null;
		list = new ArrayList<>();
		String SQL = "SELECT * FROM imgdata";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
				while(rs.next()) {
				Img data = new Img();
			
				data.setImgnum(rs.getInt("imgnum"));
				data.setImgphrase(rs.getString("imgphrase"));
				data.setImgpicture(rs.getString("imgpicture"));
				data.setImgpoem(rs.getString("imgpoem"));
				data.setImgsay(rs.getString("imgsay"));
				list.add(data);
			}

	

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;//첫 번째 게시물인 경우

	}
	
	
	public int delete(String imgnum) {

		String SQL = "delete from imgdata WHERE imgnum = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);   

			pstmt.setString(1, imgnum);

			return pstmt.executeUpdate();



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}
}
