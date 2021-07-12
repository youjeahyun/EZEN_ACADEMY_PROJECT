<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter"%>
<%@ page import="user.User" %>
<%@ page import="user.UserDAO" %>
<%

	request.setCharacterEncoding("UTF-8");

	//sresponse.setContentType("text/html; charset=UTF-8");

%>

<jsp:useBean id="user" class="user.User" scope="page" />

<jsp:setProperty name="user" property="userID" />

<jsp:setProperty name="user" property="userPassword" />

<jsp:setProperty name="user" property="userName" />

<jsp:setProperty name="user" property="userGender" />

<jsp:setProperty name="user" property="userEmail" />

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
			script.println("alert('로z그인을 해주시기 바랍니다.')");
			script.println("localStorage.setItem('login', 1);");//j쿼리 login창띄워주기 
			script.println("location.href='index.jsp'");//index.jsp로 이동
			script.println("</script>");
		} 

		//글의 유효성 체크
	System.out.println(request.getParameter("userID"));
	System.out.println(request.getParameter("userPassword"));
	System.out.println(request.getParameter("userName"));
	System.out.println(request.getParameter("userEmail"));
	
	String userID2 = request.getParameter("userID");
	String userPassword = request.getParameter("userPassword");
	String userName = request.getParameter("userName");
	String userEmail = request.getParameter("userEmail");
	
	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserEmail() == null){

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('입력사항을 정확히 기입해주세요.')");

				script.println("history.back()");

				script.println("</script>");

	}else{
	UserDAO user2 = new UserDAO();
	int result = user2.update(userID2,userPassword,userName,userEmail);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글수정에 실패했습니다')");
		script.println("history.back()");
		script.println("</script>");

	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('글수정이 정상처리 되었습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	}
	%>

</body>
</html>