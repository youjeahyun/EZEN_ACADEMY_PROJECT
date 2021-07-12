package comment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import comment.Comment;

public class ComDAO {

	private Connection conn; // connection:db에접근하게 해주는 객체

	private PreparedStatement pstmt;

	private ResultSet rs;



	// mysql 처리부분

	public ComDAO() {

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
	
	public int comm(int com_num,String com_id,String com_contents) { 

		String SQL = "INSERT INTO comment(comnum,com_num,com_id,com_contents) VALUES(comnum,?,?,?)";

		try {



			PreparedStatement pstmt = conn.prepareStatement(SQL);

			
			pstmt.setInt(1, com_num);
			pstmt.setString(2, com_id);
			pstmt.setString(3, com_contents);
			return pstmt.executeUpdate();



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; //데이터베이스 오류

	}

	public List<Comment> test(int com_num) { 
		List<Comment> list = null;
		list = new ArrayList<>();
		String SQL = "SELECT * FROM comment where ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, com_num);
			
			rs = pstmt.executeQuery();
				while(rs.next()) {
					Comment data = new Comment();
				//data.setImgPath(rs.getString("imgPath"));
				data.setComnum(rs.getInt("comnum"));
				data.setCom_num(rs.getInt("com_num"));
				data.setCom_id(rs.getString("com_id"));
				data.setCom_contents(rs.getString("com_contents"));
				
				list.add(data);
			}

	

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;//첫 번째 게시물인 경우

	}
	
	
	public int delete(String comdelete) {

		String SQL = "delete from comment WHERE comnum = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);   

			pstmt.setString(1, comdelete);

			return pstmt.executeUpdate();



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}
	
}
