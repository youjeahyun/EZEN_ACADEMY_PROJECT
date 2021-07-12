<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="bbs.BbsDAO"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="java.io.PrintWriter"%>

<%

	request.setCharacterEncoding("UTF-8");

	//sresponse.setContentType("text/html; charset=UTF-8");

%>

<!DOCTYPE html>

<html>

<head>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>포스트 삭제하기</title>

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
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} 
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}

		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
			
		}
		
		

		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
		if(userID.equals("123")){
			BbsDAO BbsDAO = new BbsDAO();			
			int result = BbsDAO.delete(bbsID);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글삭제에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");

				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글삭제가 정상처리 되었습니다.')");
					script.println("localStorage.setItem('board', 1);");
					script.println("location.href='main.jsp'");
					script.println("</script>");
				}
		}
		if (!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");				

		} else {
			BbsDAO BbsDAO = new BbsDAO();			
			int result = BbsDAO.delete(bbsID);
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글삭제에 실패했습니다')");
					script.println("history.back()");
					script.println("</script>");

				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글삭제가 정상처리 되었습니다.')");
					script.println("localStorage.setItem('board', 1);"); //로그인창 다시 띄우기
					script.println("location.href = 'main.jsp';");
					script.println("</script>");
				}

			}
	%>
</body>

</html>