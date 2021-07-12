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
				location.href = "/bbsread?boardid=${replyUpdate.boardid}"
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
				<h1> 댓글 수정</h1>
			</header>
		
			 
			<div>
				
			</div>
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/replyUpdate">
					<input type="hidden" name="boardid" value="${replyUpdate.boardid}" readonly="readonly"/>
					<input type="hidden" id="replyno" name="replyno" value="${replyUpdate.replyno}" />
					<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}"> 
					<input type="hidden" id="amount" name="amount" value="${cri.amount}"> 
					<input type="hidden" id="type" name="type" value="${cri.type}"> 
					<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}"> 
					<table>
						<tbody>
							<tr>
								<td>
									<label for="replytext">댓글 내용</label>
									<input type="text" id="replytext" name="replytext" value="${replyUpdate.replytext}"/>
								</td>
							</tr>	
							
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>