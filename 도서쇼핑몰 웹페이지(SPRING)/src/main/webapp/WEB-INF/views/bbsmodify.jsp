<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="resources/css/bbswrite.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<%@include file="includes/header.jsp"%>
	<div class="bbs_area">
		<div class="bbs_div">
			<div id="wrap">
				<h2>게시글 수정</h2>
				<br>
				<form role="form" id="writeForm" method="post"
					action="${path}/bbsmodify">
					<input type="hidden" value="board_write" name="command"> <input
						type="hidden" name="boardid" value="${list.boardid}">
					<table>
						<tr>
							<th>작성자</th>
							<td><input class="form-control" id="writer" name="writer"
								value="${member.memberId}" style="width: 646px;"></td>
						</tr>
						<tr>
							<th>제목 *</th>
							<td><input class="form-control" id="title" name="title"
								value="${list.title}" placeholder="제목을 입력해주세요"
								style="width: 646px;"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea cols="100" rows="30" name="content"
									style="width: 646px;"></textarea></td>
						</tr>
						<tr>
							<th>이미지 첨부</th>
							<td><img style="width: 500px; height: 500px"
								src="/upload/<c:out value="${list.uploadPath}/"/><c:out value="${list.uuid}_"/><c:out value="${list.fileName}"/> "></td>
						</tr>
					</table>
					<div class="card-footer" style="margin-bottom:15px;">
						<button type="button" class="btn btn-primary listBtn">
							<i class="fa fa-list"></i> 목록
						</button>

						<button type="button" class="btn btn-warning cancelBtn">
							<i class="fa fa-trash"></i> 취소
						</button>
						<button type="submit" class="btn btn-success modBtn">
							<i class="fa fa-save"></i> 수정 저장
						</button>


					</div>
				</form>
			</div>

		</div>

		<script>
			$(document).ready(function() {
				var formObj = $("form[role='form']");
				console.log(formObj);
				$(".modBtn").on("click", function() {
					formObj.submit();
				});
				$(".cancelBtn").on("click", function() {
					history.go(-1);
				});
				$(".listBtn").on("click", function() {
					self.location = "${path}/bbs"
				});
			});
		</script>
		<%@include file="includes/footer.jsp"%>
</body>
</html>