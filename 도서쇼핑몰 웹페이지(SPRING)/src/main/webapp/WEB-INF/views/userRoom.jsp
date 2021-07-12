<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome EZEN STORE</title>
<link rel="stylesheet" href="resources/css/userRoom.css">
<script src="https://code.jquery.com/jquery-3.4.1.js">
	integrity = "sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin = "anonymous"
</script>

</head>
<body>
	<%@include file="includes/header.jsp"%>

	<div class="user_wrap">
		<!-- 네비영역 -->
		<div class="user_navi_wrap">
			<ul>
				<li><a class="user_list_01" href="cart">장바구니</a></li>
				<li><a class="user_list_02" href="orderList">구매목록 </a></li>
				<lI><a class="user_list_04" href="memberDetail">내 정보</a></lI>

			</ul>
		</div>

		<section id="content">
			<div class="user_content_subject" style="margin-left:230px">
				<span>마이룸</span>
			</div>
				<br><br><br>
				<h2 style="margin-left:230px">마이룸 페이지 입니다. 원하시는 메뉴를 선택하세요.</h2>
			

		</section>
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
					location.href='main'
				}
			}); // ajax 
		});
	</script>

</body>
</html>