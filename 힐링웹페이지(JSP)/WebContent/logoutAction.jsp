<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Logout</title>
</head>

<body>
	<%session.invalidate(); // 접속한 회원의 세션을 빼앗음%>

	<script>//인덱스으로 이동
		location.href = 'index.jsp';
	</script>

</body>
</html>