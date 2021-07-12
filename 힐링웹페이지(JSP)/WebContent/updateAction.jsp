<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="java.io.PrintWriter"%>
<%	request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>포스트 수정하기</title>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주시기 바랍니다.')");
			script.println("localStorage.setItem('login', 1);");//j쿼리 login창띄워주기 
			script.println("location.href='index.jsp'");//index.jsp로 이동
			script.println("</script>");
		} 
		//글의 유효성 체크
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}

		if (bbsID == 0) { //글이없을때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("localStorage.setItem('board', 1);");//j쿼리 board창 띄워주기
			script.println("location.href='main.jsp'");// main.jsp으로 이동
			script.println("</script>");
		}

		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())) { //본인의 글을 수정하려할때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("localStorage.setItem('board', 1);");//j쿼리 board창 띄워주기
			script.println("location.href='main.jsp'");// main.jsp으로 이동
			script.println("</script>");				
		} else {//제목 및 내용을 안적었을때
			if (request.getParameter("bbsTitle") == null || request.getParameter("bbsContent") == null
			|| request.getParameter("bbsTitle").equals("") || request.getParameter("bbsContent").equals("") ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");
				script.println("history.back()"); //수정창 유지
				script.println("</script>");
			} else {
				BbsDAO BbsDAO = new BbsDAO();
				int result = BbsDAO.update(bbsID, request.getParameter("bbsTitle"), request.getParameter("bbsContent"));
				
				if (result == -1) {  //데이터데이스 응답을 못할때
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다')");
					script.println("localStorage.setItem('board', 1);");//j쿼리 board창 띄워주기
					script.println("location.href='main.jsp'");// main.jsp으로 이동
					script.println("</script>");

				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정이 정상처리 되었습니다.')");
					script.println("localStorage.setItem('board', 1);");//j쿼리 board창 띄워주기
					script.println("location.href='main.jsp'");// main.jsp으로 이동
					script.println("</script>");
				}

			}

		}

	%>

</body>

</html>