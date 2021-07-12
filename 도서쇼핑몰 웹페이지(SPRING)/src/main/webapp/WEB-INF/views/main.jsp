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
			<span class="dot"></span> <span class="dot"></span> <span class="dot"></span>
		</div>
		<br>
		<div class="goods">
			<h2>이젠문고 운영자 추천 PICK 12선!</h2>
			<div class="content">
				<ul class="goods_list">
					<li><a href="cateDetail?bookId=67">
							<div class="cover">
								<img src="/resources/img/1.jpg">
							</div>
							<div class="category">신작 도서👍</div>
							<div class="title">레전드 과학 탐험대</div>
							<div class="author">윤자영</div>
					</a></li>
					<li><a href="cateDetail?bookId=68">
							<div class="cover">
								<img src="/resources/img/2.jpg">
							</div>
							<div class="category">신작 도서👍</div>
							<div class="title">토지투자 무작정 따라하기</div>
							<div class="author">전은규</div>
					</a></li>
					<li><a href="cateDetail?bookId=69">
							<div class="cover">
								<img src="/resources/img/3.jpg">
							</div>
							<div class="category">신작 도서👍</div>
							<div class="title">비야 , 그만</div>
							<div class="author">이지연</div>
					</a></li>
					<li><a href="cateDetail?bookId=70">
							<div class="cover">
								<img src="/resources/img/4.jpg">
							</div>
							<div class="category">신작 도서👍</div>
							<div class="title">마음은 파란데 체온은 정상입니다</div>
							<div class="author">사예</div>
					</a></li>
					<li><a href="cateDetail?bookId=71">
							<div class="cover">
								<img src="/resources/img/5.jpg">
							</div>
							<div class="category">유명작가😎</div>
							<div class="title">Klara and the Sun</div>
							<div class="author">가즈오 이시구로</div>
					</a></li>
					<li><a href="cateDetail?bookId=72">
							<div class="cover">
								<img src="/resources/img/6.jpg">
							</div>
							<div class="category">유명작가😎</div>
							<div class="title">Wonder</div>
							<div class="author">RJ Palacio</div>
					</a></li>
					<li><a href="cateDetail?bookId=73">
							<div class="cover">
								<img src="/resources/img/7.jpg">
							</div>
							<div class="category">유명작가😎</div>
							<div class="title">The Midnight Library</div>
							<div class="author">매트 헤이그</div>
					</a></li>
					<li><a href="cateDetail?bookId=74">
							<div class="cover">
								<img src="/resources/img/8.jpg">
							</div>
							<div class="category">유명작가😎</div>
							<div class="title">Holes</div>
							<div class="author">루이스 쌔커</div>
					</a></li>
					<li><a href="cateDetail?bookId=75">
							<div class="cover">
								<img src="/resources/img/9.jpg">
							</div>
							<div class="category">이벤트도서🎅</div>
							<div class="title">컴퓨터 속 아이콘 나라</div>
							<div class="author">홍종의</div>
					</a></li>
					<li><a href="cateDetail?bookId=76">
							<div class="cover">
								<img src="/resources/img/10.jpg">
							</div>
							<div class="category">이벤트도서🎅</div>
							<div class="title">브레이킹 던</div>
							<div class="author">스테프니 메이어</div>
					</a></li>
					<li><a href="cateDetail?bookId=77">
							<div class="cover">
								<img src="/resources/img/11.jpg">
							</div>
							<div class="category">이벤트도서🎅</div>
							<div class="title">기억 전달자</div>
							<div class="author">로이스 로리</div>
					</a></li>
					<li><a href="cateDetail?bookId=78">
							<div class="cover">
								<img src="/resources/img/12.jpg">
							</div>
							<div class="category">이벤트도서🎅</div>
							<div class="title">팀장의 탄생</div>
							<div class="author">줄리 주오</div>
					</a></li>

				</ul>
			</div>
		</div>
	</div>

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
	</script>

</body>
</html>