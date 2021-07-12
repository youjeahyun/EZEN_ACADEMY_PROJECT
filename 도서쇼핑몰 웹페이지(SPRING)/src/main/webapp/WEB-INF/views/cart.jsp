<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome EZEN STORE</title>
<link rel="stylesheet" href="resources/css/cart.css">
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
				<lI><a class="user_list_04" href="memberDetail">내 정보 </a></lI>

			</ul>
		</div>

		<section id="content">
		 <div class="user_content_subject"><span>장바구니</span></div>
			<li id="checkLi">
				<div class="allCheck">
					<input type="checkbox" name="allCheck" id="allCheck" /><label
						for="allCheck">전체선택</label>
					<script>
						$("#allCheck").click(function() {
							var chk = $("#allCheck").prop("checked");
							if (chk) {
								$(".chBox").prop("checked", true);
							} else {
								$(".chBox").prop("checked", false);
							}
						});
					</script>
				</div>

				<div class="delBtn">
					<button type="button" class="selectDelete_btn">선택 삭제</button>

				</div> <script>
					$(".selectDelete_btn").click(function() {
						var confirm_val = confirm("정말 삭제하시겠습니까?");

						if (confirm_val) {
							var checkArr = new Array();

							$("input[class='chBox']:checked").each(function() {
								checkArr.push($(this).attr("data-cartid"));
							});

							$.ajax({
								url : "/deleteCart",
								type : "post",
								data : {
									chbox : checkArr
								},
								success : function(result) {

									location.href = "/cart";

								}
							});
						}
					});
				</script>

			</li> <br>
			<hr>



			<ul style="list-style: none;">


				<c:set var="sum" value="0" />
				<c:forEach items="${cartList}" var="cartList">
					<li>
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox"
								data-cartid="${cartList.cartid}" />
							<script>
								$(".chBox").click(function() {
									$("#allCheck").prop("checked", false);
								});
							</script>
						</div>
						<div class="thumb" style="display: inline-block;">
							<img src="${cartList.uuid}">

						</div>
						<div class="gdsInfo" style="display: contents;">
							<p
								style="padding-top: 40px; padding-bottom: 40px; margin-left: 280px;">
								<span style="width: 350px;">도서명 : ${cartList.bookName} </span><span
									style="width: 350px;">개당 가격 : <fmt:formatNumber
										pattern="###,###,###" value="${cartList.bookPrice}" />원
								</span> <span style="width: 350px;">구매 수량 : <fmt:formatNumber
										pattern="###,###,###" value="${cartList.cartStock}" />EA
								</span> <span style="width: 350px;">합계 가격 : <fmt:formatNumber
										pattern="###,###,###"
										value="${cartList.bookPrice * cartList.cartStock}" />원
								</span> <span class="delete">
									<button type="button" class="delete_${cartList.cartid}_btn"
										data-cartid="${cartList.cartid}"
										data-cartid="${cartList.cartid}">삭제</button>
								</span>
								<script>
									$(".delete_${cartList.cartid}_btn")
											.click(
													function() {
														var confirm_val = confirm("정말 삭제하시겠습니까?");

														if (confirm_val) {
															var checkArr = new Array();

															checkArr
																	.push($(
																			this)
																			.attr(
																					"data-cartid"));

															$
																	.ajax({
																		url : "/deleteCart",
																		type : "post",
																		data : {
																			chbox : checkArr
																		},
																		success : function(
																				result) {

																			location.href = "/cart";

																		}
																	});
														}
													});
								</script>


							</p>

						</div>


					</li>
					<hr>
					<c:set var="sum"
						value="${sum + (cartList.bookPrice * cartList.cartStock)}" />
				</c:forEach>


			</ul>
			<div class="listResult">
				<div class="sum">
					총 합계 :
					<fmt:formatNumber pattern="###,###,###" value="${sum}" />
					원
				</div>
				<div class="orderOpne">
					<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
				</div>
			</div>

			<div class="orderInfo">
				<form role="form" method="post" autocomplete="off">

					<input type="hidden" name="amount" value="${sum}" />

					<div class="inputArea">
						<label for="">수령인</label> <input type="text" name="orderRec"  style="width:300px;"
							id="orderRec" required="required"  placeholder="받으시는 분 성함을 입력하세요."/>
					</div>

					<div class="inputArea">
						<label for="orderPhon">수령인 연락처</label> <input type="text"  style="width:300px;"
							name="orderPhon" id="orderPhon" required="required" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자만 입력하세요."  />
					</div>

					<div class="inputArea">
						<label for="userAddr1">우편번호</label> <input type="text"  style="width:300px;"
							name="userAddr1" id="userAddr1" required="required" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" placeholder="숫자만 입력하세요."/>
					</div>

					<div class="inputArea">
						<label for="userAddr2">기본 주소</label> <input type="text"  style="width:300px;"
							name="userAddr2" id="userAddr2" required="required" placeholder="기본 주소를 적어주세요."/>
					</div>

					<div class="inputArea">
						<label for="userAddr3">상세 주소</label> <input type="text"  style="width:300px;"
							name="userAddr3" id="userAddr3" required="required" placeholder="상세 주소를 적어주세요" />
					</div>

					<div class="inputArea" style="text-align: right;">
						<button type="submit" class="order_btn">주문</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>

				</form>
			</div>

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