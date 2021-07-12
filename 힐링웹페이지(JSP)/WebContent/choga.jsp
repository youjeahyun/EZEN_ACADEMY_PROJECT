<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="image.ImgDAO"%>
<%@ page import="java.io.PrintWriter"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Object tt = session.getAttribute("test");
	String ttt = (String)tt;
	System.out.println(ttt);
%>
	<form method="post" action="chogaAction.jsp"  enctype="multipart/form-data">이미지
		<input type="file" name="imaPath">
		<input type="submit" value="추가">
	</form>
</body>
</html>