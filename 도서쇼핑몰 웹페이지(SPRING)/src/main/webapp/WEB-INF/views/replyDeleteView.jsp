<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/bbsread?boardid=${replyDelete.boardid}"
					   + "&pageNum=${cri.pageNum}"
					   + "&amount=${cri.amount}"
					   + "&type=${cri.type}"
					   + "&keyword=${cri.keyword}";
			})
			
		})
		
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1>댓글 삭제</h1>
			</header>
					 
			<div>
				
			</div>
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/replyDelete">
					<input type="hidden" name="boardid" value="${replyDelete.boardid}" readonly="readonly"/>
					<input type="hidden" id="replyno" name="replyno" value="${replyDelete.replyno}" />
					<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}"> 
					<input type="hidden" id="amount" name="amount" value="${cri.amount}"> 
					<input type="hidden" id="type" name="type" value="${cri.type}"> 
					<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
						
					<div>
						<p>삭제 하시겠습니까?</p>
						<button type="submit" class="delete_btn">예 삭제합니다.</button>
						<button type="button" class="cancel_btn">아니오. 삭제하지 않습니다.</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>