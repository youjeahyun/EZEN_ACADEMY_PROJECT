package user;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
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
	// 濡�洹몄�몄�� �������� �⑥��****

	public int login(String userID, String userPassword) {

		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";

		try {

			// pstmt : prepared statement 정해진 sql문장을 db에 삽입하는 형식으로 인스턴스가져옴

			pstmt = conn.prepareStatement(SQL);

			// sql인젝션 같은 해킹기법을 방어하는것... pstmt을 이용해 하나의 문장을 미리 준비해서(물음표사용)

			// 물음표해당하는 내용을 유저아이디로, 매개변수로 이용.. 1)존재하는지 2)비밀번호무엇인지

			pstmt.setString(1, userID);

			// rs:result set 에 결과보관

			rs = pstmt.executeQuery();

			// 결과가 존재한다면 실행

			if (rs.next()) {

				// 패스워드 일치한다면 실행

				if (rs.getString(1).equals(userPassword)) {

					return 1; // 라긴 성공

				} else

					return 0; // 비밀번호 불일치

			}

			return -1; // 아이디가 없음 오류



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -2; // 데이터베이스 오류를 의미

	}



	public int join(User user) {

		String SQL = "INSERT INTO USER VALUES (?,?,?,?,?)";

		try {

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, user.getUserID());

			pstmt.setString(2, user.getUserPassword());

			pstmt.setString(3, user.getUserName());

			pstmt.setString(4, user.getUserGender());

			pstmt.setString(5, user.getUserEmail());

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // DB 오류

	}
	
	
	
	
	public List<User> test(String userID) { 
		System.out.println(userID);
		List<User> list = null;
		String SQL = "SELECT userID,userPassword,userName,userEmail FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userID);
				
			rs = pstmt.executeQuery();
			
		
			
			if(rs.next()) {
				list = new ArrayList<>();
				
				User data = new User();
				data.setUserID(rs.getString("userID"));
				data.setUserPassword(rs.getString("userPassword"));
				data.setUserName(rs.getString("userName"));
				data.setUserEmail(rs.getString("userEmail"));
				//return rs.getInt(1) + 1;
				//String id = rs.getString("userID");
				//String pass = rs.getString("userPassword");
				//String name = rs.getString("userName");
				//String Email = rs.getString("userEmail");
				list.add(data);
			}

	

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;//첫 번째 게시물인 경우

	}
	
	
	public int update(String userID, String userPassword, String userName,String userEmail) {
		
		
		System.out.println(userID);
		System.out.println(userPassword);
		System.out.println(userName);
		System.out.println(userEmail);
		
		String SQL = "UPDATE user SET userpassword = ?, username = ?, userEmail = ? WHERE userid = ?";
		

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, userPassword);

			pstmt.setString(2, userName);

			pstmt.setString(3, userEmail);
			pstmt.setString(4, userID);

			return pstmt.executeUpdate();



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}

	public int delete(String userID) {

		String SQL = "delete from user WHERE userid = ?";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);   

			pstmt.setString(1, userID);

			return pstmt.executeUpdate();



		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}
	

}
