<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Welcome EZEN STORE</title>
<link rel="stylesheet" href="resources/css/bbsread.css">
<script src="https://code.jquery.com/jquery-3.4.1.js">
	integrity = "sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin = "anonymous"
</script>
</head>
<body>
	<%@include file="includes/header.jsp"%>
	<div class="bbs_area">
		<div class="bbs_div">
			<div id="wrap">
				<h2>게시글 조회</h2>
				<br>
				<table>
					<tr>
						<th>작성자</th>
						<td>${list.writer}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${list.regDate}" /></td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${list.title}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea cols="100" rows="30" name="content"
								readonly="readonly" style="border: none">${list.content}</textarea></td>
					</tr>
					<tr>
						<th>이미지첨부</th>
						<td><img style="width: 500px; height: 500px"
							src="/upload/<c:out value="${list.uploadPath}/"/><c:out value="${list.uuid}_"/><c:out value="${list.fileName}"/> "></td>
					</tr>
				</table>


				<div>
					<form role="form" method="post">
						<input type="hidden" name="boardid" value="${list.boardid}">
					</form>
					<div style="margin-bottom: 15px">

						<button type="submit" class="btn btn-primary listBtn">
							<i class="fa fa-list"></i> 목록
						</button>
						<c:if test="${member.memberId==list.writer}">
							<button type="submit" class="btn btn-warning modBtn">
								<i class="fa fa-edit"></i> 수정
							</button>
							<button type="submit" class="btn btn-danger delBtn">
								<i class="fa fa-trash"></i> 삭제
							</button>
					</div>
					</c:if>
					<!-- 댓글 -->
					<div id="reply">
						<ol class="replyList" style="list-style: none;">
							<c:forEach items="${replyList}" var="replyList">
								<li>
									<p>
									<hr> 작성자 : ${replyList.replywriter}<br /> 작성 날짜 : <fmt:formatDate
										value="${replyList.regdate}" pattern="yyyy-MM-dd" />
									</p>

									<p>${replyList.replytext}</p> <c:if
										test="${member.memberId==replyList.replywriter}">
										<div style="margin-bottom: 5px">
											<button type="button" class="replyUpdateBtn"
												data-replyno="${replyList.replyno}">수정</button>
											<button type="button" class="replyDeleteBtn"
												data-replyno="${replyList.replyno}">삭제</button>
										</div>
									</c:if>
								</li>
							</c:forEach>
						</ol>
					</div>
					<form name="replyForm" method="post">
						<input type="hidden" id="boardid" name="boardid"
							value="${list.boardid}" /> <input type="hidden" id="pageNum"
							name="pageNum" value="${cri.pageNum}"> <input
							type="hidden" id="amount" name="amount" value="${cri.amount}">
						<input type="hidden" id="type" name="type" value="${cri.type}">
						<input type="hidden" id="keyword" name="keyword"
							value="${cri.keyword}">
						<hr>
						<div style="display: inline-block;">
							<label for="replywriter">댓글 작성자</label> <input type="text"
								id="replywriter" name="replywriter" value="${member.memberId}"
								readonly="readonly" /> <label for="replytext">댓글 내용</label> <input
								type="text" id="replytext" name="replytext" />
						</div>
						<c:if test="${member.memberId!=null}">
							<div style="display: inline-block;">
								<button type="button" class="replyWriteBtn">작성</button>
							</div>
						</c:if>
					</form>
				</div>

			</div>
		</div>
	</div>

	<script>
		$(document)
				.ready(
						function() {
							var formObj = $("form[role='form']");
							console.log(formObj);
							//수정
							$(".modBtn").on("click", function() {
								formObj.attr("action", "${path}/bbsmodify");
								formObj.attr("method", "get");
								formObj.submit();
							});
							//삭제
							$(".delBtn").on("click", function() {
								formObj.attr("action", "${path}/remove");
								formObj.submit();
							});
							//목록	
							$(".listBtn").on("click", function() {
								self.location = "${path}/bbs"
							});

							//댓글 작성
							$(".replyWriteBtn").on("click", function() {
								var formObj = $("form[name='replyForm']");
								formObj.attr("action", "/replyWrite");
								formObj.submit();
							});

							//댓글 수정 View
							$(".replyUpdateBtn")
									.on(
											"click",
											function() {
												location.href = "/replyUpdateView?boardid=${list.boardid}"
														+ "&pageNum=${cri.pageNum}"
														+ "&amount=${cri.amount}"
														+ "&type=${cri.type}"
														+ "&keyword=${cri.keyword}"
														+ "&replyno="
														+ $(this).attr(
																"data-replyno");
											});

							//댓글 삭제 View
							$(".replyDeleteBtn")
									.on(
											"click",
											function() {
												location.href = "/replyDeleteView?boardid=${list.boardid}"
														+ "&pageNum=${cri.pageNum}"
														+ "&amount=${cri.amount}"
														+ "&type=${cri.type}"
														+ "&keyword=${cri.keyword}"
														+ "&replyno="
														+ $(this).attr(
																"data-replyno");
											});
						})
		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			}); // ajax 
		});
	</script>



	<%@include file="includes/footer.jsp"%>
</body>
</html>