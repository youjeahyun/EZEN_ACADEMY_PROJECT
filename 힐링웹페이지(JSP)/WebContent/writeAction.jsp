<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<!-- bbsdao의 클래스 가져옴 -->
<%@ page import="java.io.PrintWriter"%>
<!-- 자바 클래스 사용 -->
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
%>

<!-- 한명의 회원정보를 담는 user클래스를 자바 빈즈로 사용 / scope:페이지 현재의 페이지에서만 사용-->
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" /><!-- bbs.setBbsTitle(request) -->
<jsp:setProperty name="bbs" property="bbsContent" /><!-- bbs.setBbsContent(request) -->

<%	System.out.println(bbs);%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Healing Feeling</title>
</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {//유저아이디이름으로 세션이 존재하는 회원들은 
			userID = (String) session.getAttribute("userID");//유저아이디에 해당 세션값을 넣어준다.
		}

		if (userID == null) {//로그인이 안되어있을 때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주시기 바랍니다.')");
			script.println("localStorage.setItem('login', 1);");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		} else {//
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {  //제목이나 내용이 공란일때
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다')");//경고창출력
				script.println("history.back()"); // 경고창 닫히면 현재페이지 유지
				script.println("</script>");
			} else {
				BbsDAO BbsDAO = new BbsDAO();
				int result = BbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent()); //
				if (result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다')");
					script.println("localStorage.setItem('board', 1);");
					script.println("location.href='main.jsp'");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('포스팅이 완료 되었습니다.')");
					script.println("localStorage.setItem('board', 1);");
					script.println("location.href='main.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>
