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
	
		
		
		String comnum=request.getParameter("comnum");
	
		System.out.println(comnum+"번호");
		ComDAO cd = new ComDAO();
		int result = cd.delete(comnum);
		
		if (result == -1) {
			//session.setAttribute("userID", user.getUserID());
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('댓글이 삭제가 안됬습니다!')");
			script.println("location.href = document.referrer");  
			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('댓글이 삭제되었습니다.')");
			 script.println("location.href = document.referrer");  
			script.println("</script>");
		}
%>
</body>
</html>