<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome EZEN STORE</title>
<link rel="stylesheet" href="resources/css/cate.css">
<script src="https://code.jquery.com/jquery-3.4.1.js">
	integrity = "sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin = "anonymous"
</script>
</head>
<body>
	<%@include file="includes/header.jsp"%>
	<div class="content_area">
		<br>
		<div class="goods">
			<h2>국내 도서</h2>
			<div class="content">
				<ul class="goods_list">
					<c:forEach items="${list}" var="list">
						<li><a href="/cateDetail?bookId=${list.bookId}">
								<div class="cover">
									<img
										src="/upload/${list.uploadPath}/${list.uuid}_${list.fileName}"
										width="100" height="100">
								</div> <!-- 국내 외국 책제목 작가 -->
								<div class="category">
									<c:out value="${list.bookPrice}원"></c:out>
								</div>
								<div class="title">
									<c:out value="${list.bookName}"></c:out>
								</div>
								<div class="author">
									<c:out value="${list.authorName}"></c:out>
								</div>
						</a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
	<!-- 페이지 이동 인터페이스 영역 -->
	<div class="pageMaker_wrap">

		<ul class="pageMaker">

			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev}">
				<li class="pageMaker_btn prev"><a
					href="${pageMaker.pageStart - 1}">이전</a></li>
			</c:if>

			<!-- 페이지 번호 -->
			<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}"
				var="num">
				<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<!-- 다음 버튼 -->
			<c:if test="${pageMaker.next}">
				<li class="pageMaker_btn next"><a
					href="${pageMaker.pageEnd + 1 }">다음</a></li>
			</c:if>

		</ul>
	</div>

	<form id="moveForm" action="/cate1" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="nationId" value="01">
	</form>




	<%@include file="includes/footer.jsp"%>







	<script>
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
			let moveForm = $('#moveForm');

			/* 페이지 이동 버튼 */
			$(".pageMaker_btn a").on(
					"click",
					function(e) {

						e.preventDefault();

						moveForm.find("input[name='pageNum']").val(
								$(this).attr("href"));

						moveForm.submit();

					});
		</script>
</body>
</html>