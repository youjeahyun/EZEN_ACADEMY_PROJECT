<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%

	request.setCharacterEncoding("UTF-8");

	//sresponse.setContentType("text/html; charset=UTF-8");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			script.println("localStorage.setItem('login', 1);");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		} 

		//글의 유효성 체크

	UserDAO user = new UserDAO();
	Object userid = session.getAttribute("userID");
	String user2 = (String)userid;
	
	System.out.println(user2);
	int result = user.delete(user2);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('아이디 삭제에 실패했습니다')");
		script.println("history.back()");
		script.println("</script>");

	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('회원탈퇴가 정상적으로 되었습니다.')");
		script.println("location.href='index.jsp'");
		script.println("</script>");
		session.removeAttribute("userID");
	}

	%>

</body>
</html>