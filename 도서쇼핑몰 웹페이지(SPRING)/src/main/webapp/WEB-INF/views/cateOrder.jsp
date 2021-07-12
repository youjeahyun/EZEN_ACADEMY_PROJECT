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


	<div class="goods">
		<div class="goodsImg">
			<img src="/resources/img/어린왕자.jpg">
		</div>

		<div class="goodsInfo">
			<p class="gdsName">
				<span style="width: 350px;">도서명 : 어린왕자</span>
			</p>

			<p class="cateName">
				<span style="width: 350px;">작가 : 유재현</span>
			</p>

			<p class="gdsPrice">
				<span style="width: 350px;">개당 가격 : <fmt:formatNumber
						pattern="###,###,###" value="30000" />원
				</span>

			</p>

			<p class="gdsStock">
				<span style="width: 350px;">구매 수량 : <fmt:formatNumber
						pattern="###,###,###" value="5" />EA
				</span>



			</p>

			<p class="cartStock">
				<span style="width: 350px;">합계 가격 : <fmt:formatNumber
						pattern="###,###,###" value="150000" />원
				</span>




			</p>

			<div class="orderInfo">
				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="amount" value="${sum}" />

					<div class="inputArea">
						<label for="">수령인</label> <input type="text" name="orderRec"
							id="orderRec" required="required" />
					</div>

					<div class="inputArea">
						<label for="orderPhon">수령인 연락처</label> <input type="text"
							name="orderPhon" id="orderPhon" required="required" />
					</div>

					<div class="inputArea">
						<label for="userAddr1">우편번호</label> <input type="text"
							name="userAddr1" id="userAddr1" required="required" />
					</div>

					<div class="inputArea">
						<label for="userAddr2">1차 주소</label> <input type="text"
							name="userAddr2" id="userAddr2" required="required" />
					</div>

					<div class="inputArea">
						<label for="userAddr3">2차 주소</label> <input type="text"
							name="userAddr3" id="userAddr3" required="required" />
					</div>

					<div class="inputArea">
						<button type="submit" class="order_btn">주문</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>

				</form>
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
		</script>
</body>
</html>