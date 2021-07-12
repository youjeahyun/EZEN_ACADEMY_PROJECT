<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Healing Feeling</title>
	<link rel="stylesheet" href="index.css">
	<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<script>
	let viewCls = {}
	viewCls = {
		mainOpen: function(){
			localStorage.setItem('board', 1);
			location.href = 'main.jsp';
		}
	}
</script>

<body>
	<%	//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<!-- 반복이니까 main이나 index참고 -->
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp" style="width: 100%; margin: 20px;">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">
								힐링필링가족한테 여러분의 소식을 알려주세요!</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="bbsTitle" maxlength="50" /></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
							name="bbsContent" maxlength="3000" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>

				</table>
		
				<a href = "#" class="btn btn-primary" onclick="viewCls.mainOpen();">목록</a>
				<input type="submit" class="btn btn-primary pull-right" value="공유하기" >
		
			</form>
		</div>
	</div>

</body>
</html>