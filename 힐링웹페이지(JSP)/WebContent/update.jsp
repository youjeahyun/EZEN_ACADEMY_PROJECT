<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Healing Feeling</title>
	<link rel="stylesheet" href="index.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<%
		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		} 
		//로그인 안한 경우
		if(userID == null) {//로그인 안하고 수정에 들어가졌으면 해당실행
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 해주시기 바랍니다.')");
			script.println("localStorage.setItem('login', 1);");//j쿼리 login창띄우기
			script.println("location.href='index.jsp'");//index.jsp이동
			script.println("</script>");
		}
		
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) { //글의 상태가 이상할때.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("localStorage.setItem('board', 1);");//j쿼리 board창 띄워주기
			script.println("location.href='main.jsp'");// main.jsp으로 이동
			script.println("</script>");
		}
	
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if (!userID.equals(bbs.getUserID())) { //자신이 작성한 글이 아닐때
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("localStorage.setItem('board', 1);");//j쿼리 board창 띄워주기
			script.println("location.href='main.jsp'");// main.jsp으로 이동
			script.println("</script>");				
		}
	%>
<!-- 반복이니까 모르면 index나 main 확인하기 -->
<div class="container">
	<div class="row">
		<form method="post" action="updateAction.jsp"
			style="width: 100%; margin: 20px;">
			<input type="hidden" value="<%= bbsID %>" name="bbsID" />
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">	글수정</th>
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
			<a href = "#" class="btn btn-primary" onclick="viewCls.mainOpen();">목록</a> <!-- 하단 스크립트에 지정해논 j쿼리창띄우기위한 경로지정 -->
			<input type="submit" class="btn btn-primary pull-right" value="수정하기">
		</form>
	</div>
</div>
</body>

<!--세부게시글에서 자유게시판목록 j쿼리 창으로 이동하는 스크립트 좋은방법은아님. -->
<script>
	let viewCls = {}
	
	viewCls = {
		mainOpen: function(){
			localStorage.setItem('board', 1);
			location.href = 'main.jsp';
		}
	}
</script>

</html>