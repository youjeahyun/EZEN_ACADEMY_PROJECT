package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

public class BbsDAO {

	private Connection conn; 

	private ResultSet rs;

	public BbsDAO() {

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

		public String getDate() { 

			String SQL = "SELECT NOW()";

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				rs = pstmt.executeQuery();

				if(rs.next()) {

					return rs.getString(1);

				}

			} catch (Exception e) {

				e.printStackTrace();

			}

			return ""; //데이터베이스 오류

		}



		//bbsID 게시글 번호 가져오는 함수

		public int getNext() { 

			String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				rs = pstmt.executeQuery();

				if(rs.next()) {

					return rs.getInt(1) + 1;

				}

				return 1;//첫 번째 게시물인 경우

			} catch (Exception e) {

				e.printStackTrace();

			}

			return -1; //데이터베이스 오류

		}



		//실제로 글을 작성하는 함수

		public int write(String bbsTitle, String userID, String bbsContent) { 

			String SQL = "INSERT INTO BBS VALUES(?, ?, ?, ?, ?, ?)";

			try {



				PreparedStatement pstmt = conn.prepareStatement(SQL);

				pstmt.setInt(1, getNext());

				pstmt.setString(2, bbsTitle);

				pstmt.setString(3, userID);

				pstmt.setString(4, getDate());

				pstmt.setString(5, bbsContent);

				pstmt.setInt(6,1);



				return pstmt.executeUpdate();



			} catch (Exception e) {

				e.printStackTrace();

			}

			return -1; //데이터베이스 오류

		}
		
		
		public ArrayList<Bbs> getList(int pageNumber){ 
			String SQL = "SELECT * FROM bbs"; 
			ArrayList<Bbs> list = new ArrayList<Bbs>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(SQL);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					Bbs bbs = new Bbs();
					bbs.setBbsID(rs.getInt(1));
					bbs.setBbsTitle(rs.getString(2)); 
					bbs.setUserID(rs.getString(3));
					bbs.setBbsDate(rs.getString(4));
					bbs.setBbsContent(rs.getString(5));
					bbs.setBbsAvailable(rs.getInt(6));
					list.add(bbs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list; 
		}
		
		//게시글 상세 뷰 화면 만들기
		public Bbs getBbs(int bbsID) {

			String SQL = "SELECT * FROM BBS WHERE bbsID = ?";

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				pstmt.setInt(1, bbsID);

				rs = pstmt.executeQuery();

				if (rs.next()) {

					Bbs bbs = new Bbs();

					bbs.setBbsID(rs.getInt(1));

					bbs.setBbsTitle(rs.getString(2));

					bbs.setUserID(rs.getString(3));

					bbs.setBbsDate(rs.getString(4));

					bbs.setBbsContent(rs.getString(5));

					bbs.setBbsAvailable(rs.getInt(6));



					return bbs;

				}

			} catch (Exception e) {

				e.printStackTrace();

			}

			return null;



		}
		//글 수정 함수 업데이트

		public int update(int bbsID, String bbsTitle, String bbsContent) {

			String SQL = "UPDATE BBS SET bbsTitle = ?, bbsContent = ? WHERE bbsID = ?";

			try {

				PreparedStatement pstmt = conn.prepareStatement(SQL);

				pstmt.setString(1, bbsTitle);

				pstmt.setString(2, bbsContent);

				pstmt.setInt(3, bbsID);

				return pstmt.executeUpdate();



			} catch (Exception e) {

				e.printStackTrace();

			}

			return -1; // 데이터베이스 오류

		}

		
		//삭제 함수
			public int delete(int bbsID) {

				String SQL = "delete from bbs WHERE bbsID = ?";

				try {

					PreparedStatement pstmt = conn.prepareStatement(SQL);   

					pstmt.setInt(1, bbsID);

					return pstmt.executeUpdate();



				} catch (Exception e) {

					e.printStackTrace();

				}

				return -1; // 데이터베이스 오류

			}
			
			
			public List<Bbs> getList(int startRow,int endRow){
				//select @rownum:=@rownum+1 as no,dic.* from bbs dic WHERE (@rownum:=0)=0  ORDER BY bbsID desc;
				//SELECT no from(select @rownum:=@rownum+1 as no,dic.* from bbs dic WHERE (@rownum:=0)=0  ORDER BY bbsID desc);

				//set @rownum:=0;select @rownum:=@rownum+1 as no,dic.* from bbs dic  ORDER BY bbsID desc limit 10,10;
				String sql ="SELECT A.* from(select @rownum:=@rownum+1 as num,dic.* from bbs dic WHERE (@rownum:=0)=0  ORDER BY bbsID desc limit ?,?)A";
				
				List<Bbs> list = null;
				
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, startRow);
					pstmt.setInt(2, endRow);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						list = new ArrayList<>();
						do {
							Bbs board = new Bbs();
							board.setNum( rs.getInt("num"));
							board.setBbsID(rs.getInt("BbsID"));
							board.setBbsTitle(rs.getString("BbsTitle"));
							board.setUserID(rs.getString("UserID"));
							//board.setBbsDate(rs.getTimestamp("BbsDate"));
							board.setBbsDate(rs.getString("BbsDate"));
							board.setBbsContent(rs.getString("bbsContent"));

							
							list.add(board);
						}while(rs.next());
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return list;
				
			}
			
			public int getCount() {
				int count =0;
				String sql = "select count(*) from bbs";
				
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					if(rs.next()) {
						count =rs.getInt(1);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return count;
			}

			public List<Bbs> getList(int startRow,int endRow,String keyWord,String searchWord){
				String sql ="select * from bbs where " +keyWord+ " like ? order by bbsID desc limit ?,?";
					//select * from bbs where bbstitle like ? order by  bbsID desc limit ?,?
				System.out.println("키워드"+keyWord);
				System.out.println("값"+searchWord);
				List<Bbs> list = null;
				
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1,"%"+searchWord +"%");
					pstmt.setInt(2, startRow);
					pstmt.setInt(3, endRow);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						list = new ArrayList<>();
						do {
							Bbs board = new Bbs();
						//	board.setNum( rs.getInt("num"));
						//	System.out.println(rs.getInt("num"));
							board.setBbsID(rs.getInt("BbsID"));
							board.setBbsTitle(rs.getString("BbsTitle"));
							board.setUserID(rs.getString("UserID"));
							//board.setBbsDate(rs.getTimestamp("BbsDate"));
							board.setBbsDate(rs.getString("BbsDate"));
							board.setBbsContent(rs.getString("bbsContent"));

							
							list.add(board);
							System.out.println(list);
						}while(rs.next());
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return list;
				
			}
			
			public int getCount(String keyWord,String searchWord) {
				int count =0;
				String sql = "select count(*) as count from bbs where "+keyWord+" like ?";
				
				PreparedStatement pstmt;
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, "%" + searchWord + "%");
					rs = pstmt.executeQuery();
					if(rs.next()) {
						count =rs.getInt("count");
						//System.out.println(count);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return count;
			}
	}





