<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter"%>
<%@ page import="image.Img"%>
<%@ page import="image.ImgDAO"%>
<%

	request.setCharacterEncoding("UTF-8");


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

	Object tt2 = session.getAttribute("test");
	String ttt = (String)tt2;
	System.out.println(ttt);
	String imgnum = request.getParameter("imgnum");
	System.out.println(imgnum + " gkgk");
	
	ImgDAO img = new ImgDAO();
	
	int result = img.delete(imgnum);
	if (result == -1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미지 삭제에 실패했습니다')");
		script.println("history.back()");
		script.println("</script>");

	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		if(ttt.equals("1")){
		script.println("location.href='category_phrase.jsp'");
		}
		else if(ttt.equals("2")){
			script.println("location.href='category_picture.jsp'");
		}
		else if(ttt.equals("3")){
			script.println("location.href='category_poem.jsp'");
		}
		else if(ttt.equals("4")){
			script.println("location.href='category_say.jsp'");
		}
		
		script.println("</script>");
	}

	%>
	<script>
	localStorage.getItem("de")
	localStorage.removeItem('de');	
	</script>
</body>
</html>