<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.ComDAO"%>
<%@ page import="comment.Comment"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");

response.setContentType("text/html; charset=UTF-8");
		String userID = null;
		userID = (String) session.getAttribute("userID");
		String bbsID = request.getParameter("bbsID");
		//String userID = request.getParameter("userID");
		String contents = request.getParameter("comm");
		
		Object tt2 = session.getAttribute("bbsID");
		int bbsIDnum = (Integer)tt2;

		
		
		System.out.println(bbsIDnum+"번호");
		System.out.println(userID+"아이디");
		System.out.println(contents+"내용");
		ComDAO cd = new ComDAO();
		int result = cd.comm(bbsIDnum , userID, contents);
		
		if (result == -1) {
			//session.setAttribute("userID", user.getUserID());
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('댓글이 입력이 안됬습니다!')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('댓글이 입력되었습니다.')");
			script.println("location.href = document.referrer");			
			script.println("</script>");

		}
%>
</body>
</html>