<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome EZEN STORE</title>
<link rel="stylesheet" href="resources/css/orderList.css">
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
		 <div class="user_content_subject"><span>구매 목록</span></div>
			<hr>
			<ul style="list-style: none;">
				<c:forEach items="${orderList}" var="orderList">
					<li>
						<div class="gdsInfo" style="display: contents;">
							<p style="padding-top: 40px; padding-bottom: 40px;">
								<span style="margin-right: 0px">주문번호 : </span><a href="/orderView?n=${orderList.orderId}" style="color:blue;">${orderList.orderId}</a><br>
								<span style="width:73px; margin-right: 5px">수령인 : </span>${orderList.orderRec} <br>
								<span style="width:60px; margin-right: 0px">주소 : </span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}<br>
								<span style="width:60px; margin-right: 0px">가격 : </span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원
							</p>

						</div>


					</li>
					<hr>
					<c:set var="sum"
						value="${sum + (cartList.bookPrice * cartList.cartStock)}" />
				</c:forEach>


			</ul>




		</section>
	</div>
	<br>
	<%@include file="includes/footer.jsp"%>

	<script>
		$(".orderOpne_bnt").click(function() {
			$(".orderInfo").slideDown();
			$(".orderOpne_bnt").slideUp();
		});

		$(".cancel_btn").click(function() {
			$(".orderInfo").slideUp();
			$(".orderOpne_bnt").slideDown();
		});

		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					location.href='/main' 
				}
			}); // ajax 
		});
	</script>


</body>
</html>