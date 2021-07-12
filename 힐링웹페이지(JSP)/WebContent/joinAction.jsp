<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%><!-- userdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter"%><!-- 자바 클래스 사용 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="user" class="user.User" scope="page" />
<!-- 로그인을 위한 유효성 체크 및 처리 후 이동경로 지정 -->
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Sign up</title>
</head>

<body>
	<%// % ~~ % 자바문법이들어감 여기서 선언되는 변수는 지역변수다 반드시 초기화가 필요
		String userID = null;
		//이미 로긴된 회원들은 페이지에 접속 할 수 없도록
		if(session.getAttribute("userID") != null ){
			userID = (String) session.getAttribute("userID");
		}
		if(userID != null){//아이디가 로그인되어있으면
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다.')");
			script.println("location.href = 'main.jsp'"); //main.jsp로 이동
			script.println("</script>");	
		}
		//기입사항을 입력안했을경우
		if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserGender() == null || user.getUserEmail() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력사항을 정확히 기입하시기 바랍니다.')");
			script.println("localStorage.setItem('sign', 1);"); //j쿼리로 켜진 가입창 다시띄우기
			script.println("location.href = 'index.jsp';");
			script.println("</script>");
		} else{
			UserDAO userDAO = new UserDAO(); //인스턴스생성
			int result = userDAO.join(user);				

			if(result == -1){ // 아이디를  중복되게 가입되면 오류.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('중복되는 아이디입니다.')");
				script.println("localStorage.setItem('sign', 1);");//j쿼리로 켜진 가입창 다시띄우기
				script.println("location.href = 'index.jsp';");
				script.println("</script>");
			}
			
			else {//가입성공
				session.setAttribute("userID", user.getUserID()); 
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('환영합니다! 회원가입이 완료 되었습니다.')");
				script.println("location.href = 'main.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>
