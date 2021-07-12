<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome EZEN STORE</title>
<link rel="stylesheet" href="resources/css/main.css">
<script src="https://code.jquery.com/jquery-3.4.1.js">
	integrity = "sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin = "anonymous"
</script>
</head>
<body>
	<%@include file="includes/header.jsp"%>
	<div class="content_area">
		<div style="margin-bottom:30px; height:700px">
			<div>

				<div class="slideshow-container">

					<div class="mySlides fade">
						<img src="/resources/img/bn1.JPG"
							style="width: 100%; height: 300px;" class="slide">

					</div>

					<div class="mySlides fade">

						<img src="/resources/img/bn2.JPG"
							style="width: 100%; height: 300px;" class="slide">

					</div>

					<div class="mySlides fade">

						<img src="/resources/img/bn3.JPG"
							style="width: 100%; height: 300px;" class="slide">

					</div>

				</div>
				<br>

				<div style="text-align: center">
					<span class="dot"></span> <span class="dot"></span> <span
						class="dot"></span>
				</div>
				<br>
				<div class="goods">
					<h2>통합검색</h2>
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
											<c:out value="${list.bookPrice}"></c:out>
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
					<c:forEach begin="${pageMaker.pageStart}"
						end="${pageMaker.pageEnd}" var="num">
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


			<form id="moveForm" action="/main" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>
		</div>
		<%@include file="includes/footer.jsp"%>

	</div>
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

		/* 광고 슬라이드 */

		var slideIndex = 0;
		showSlides();

		function showSlides() {
			var i;
			var slides = document.getElementsByClassName("mySlides");
			var dots = document.getElementsByClassName("dot");
			for (i = 0; i < slides.length; i++) {
				slides[i].style.display = "none";
			}
			slideIndex++;
			if (slideIndex > slides.length) {
				slideIndex = 1
			}
			for (i = 0; i < dots.length; i++) {
				dots[i].className = dots[i].className.replace(" active", "");
			}
			slides[slideIndex - 1].style.display = "block";
			dots[slideIndex - 1].className += " active";
			setTimeout(showSlides, 2000); // Change image every 2 seconds
		}

		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');
		/* 작거 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			e.preventDefault();

			searchForm.submit();

		});

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});
	</script>

</body>
</html>