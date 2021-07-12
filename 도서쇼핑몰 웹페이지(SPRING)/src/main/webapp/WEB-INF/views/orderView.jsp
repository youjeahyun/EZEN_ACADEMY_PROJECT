<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome EZEN STORE</title>
<link rel="stylesheet" href="resources/css/orderView.css">
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
				<lI><a class="user_list_04" href="myPage">내 정보수정 </a></lI>

			</ul>
		</div>

		<section id="content">
			<div class="user_content_subject">
				<span>구매 목록 상세</span>
			</div>
			<hr>
			<ul style="list-style: none;">
				<div class="thumb">
					<img src="/upload/img.jpg"  style="height: 254px;"/>
				</div>
				<c:forEach items="${orderView}" var="orderView" varStatus="status">
					<li>

						<div class="gdsInfo" style="display: contents;">
							<c:if test="${status.first}">
								<p style="padding-top: 30px; margin-left: 280px;">
								<h2>수령자 정보</h2>
								<span style="width: 73px; margin-right: 5px">수령인 : </span>${orderView.orderRec}
									<br>
								<span style="width: 60px; margin-right: 0px">주소 : </span>(${orderView.userAddr1}) ${orderView.userAddr2}
									${orderView.userAddr3}<br>
								<span style="width: 103px; margin-right: 0px">구매 가격 : </span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderView.amount}" />
									원

								</p>
							</c:if>
						</div>


					</li>
					

				</c:forEach>


			</ul>

			<ul style="list-style: none;">
				<c:forEach items="${orderView}" var="orderView">
					<li>
					<hr>
						<div class="thumb">
							<img
								src="/upload/${orderView.uploadPath}/${orderView.uuid}_${orderView.fileName}" />
						</div>
						<div class="gdsInfo" style="display: contents;">
						
							<p style="padding-top: 10px; margin-left: 280px;">
							
							<h2>구매 상품 기본 정보</h2>
							<span style="width: 73px; margin-right: 5px">상품명 : </span>${orderView.bookName}<br />
							<span style="width: 103px; margin-right: 0px">개당 가격 : </span>
							<fmt:formatNumber pattern="###,###,###"
								value="${orderView.bookPrice}" />
							원<br /> <span style="width: 103px; margin-right: 0px">구입
								수량 : </span>${orderView.cartStock} 개<br /> <span
								style="width: 103px; margin-right: 0px">최종 가격 : </span>
							<fmt:formatNumber pattern="###,###,###"
								value="${orderView.bookPrice * orderView.cartStock}" />
							원                 

						</div>
					</li>
				</c:forEach>
			</ul>
			<hr>




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