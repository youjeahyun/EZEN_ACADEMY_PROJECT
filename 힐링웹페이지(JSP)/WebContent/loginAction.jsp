<!-- 페이지 지시어 문서 전체에 적용되야할 내용 %@ -->
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<!-- 로그인을 위한 유효성 체크 및 처리 후 이동경로 지정 -->
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<%	// % ~~ % 자바문법이들어감 여기서 선언되는 변수는 지역변수다 반드시 초기화가 필요
		//이미 로긴된 회원들은 페이지에 접속 할 수 없도록
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	
		if (userID != null) { //아이디가 비어있지않고 로그인되있으면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인 되어있습니다.')");
			script.println("location.href = 'main.jsp'");//main.jsp로 이동
			script.println("</script>");
		}

		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if (result == 1) {//로그인 성공
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('힐링필링을 찾아주셔서 감사합니다!')");
			script.println("location.href = 'main.jsp'");//main.jsp로 이동
			script.println("</script>");

		}

		else if (result == 0) {//비밀번호 틀리면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 확인하시기 바랍니다.')");
			script.println("localStorage.setItem('login', 1);"); //로그인창 다시 띄우기
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
		}
		if (result == -1) {//아이디가 공란이거나 틀리면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디를 확인하시기 바랍니다.')");
			script.println("localStorage.setItem('login', 1);"); //로그인창 다시 띄우기
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
		}

		else if (result == -2) { // 데이터를 불러올수가 없으면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다. 관리자에게 문의바랍니다.')");
			script.println("location.href = 'index.jsp'");//index.jsp로 이동
			script.println("</script>");
		}
	%>
</body>
</html>