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
			<h2 style="display: inline-block">장르별 도서</h2>
			<div class="form_section" style="display: inline-block; float: right; margin-right: 200px;">
				<div class="form_section_content">
					<div class="cate_wrap" style="display: inline-block;">
						<span>대분류</span> <select class="cate1" id="cate1">
							<option selected value="">선택</option>

						</select>
					</div>
					<div class="cate_wrap" style="display: inline-block;">
						<span>중분류</span> <select class="cate2" id="cate2">
							<option selected value="">선택</option>

						</select>
					</div>
					<div class="cate_wrap" style="display: inline-block;">
						<span>소분류</span> <select class="cate3" name="cateCode" id="cate3">
							<option selected value="">선택</option>

						</select>
					</div>
					<button class='btn search_btn' id="catebtn" onclick="search();">검
						색</button>
				</div>
			</div>
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



	<form id="moveForm" action="/cate3" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="cateCode" id="test">
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

				/* 카테고리 */
				let cateList = JSON.parse('${cateList}');
				let cate1Array = new Array();
				let cate2Array = new Array();
				let cate3Array = new Array();
				let cate1Obj = new Object();
				let cate2Obj = new Object();
				let cate3Obj = new Object();

				let cateSelect1 = $(".cate1");
				let cateSelect2 = $(".cate2");
				let cateSelect3 = $(".cate3");

				/* 카테고리 배열 초기화 메서드 */
				function makeCateArray(obj, array, cateList, tier) {
					for (let i = 0; i < cateList.length; i++) {
						if (cateList[i].tier === tier) {
							obj = new Object();

							obj.cateName = cateList[i].cateName;
							obj.cateCode = cateList[i].cateCode;
							obj.cateParent = cateList[i].cateParent;

							array.push(obj);

						}
					}
				}

				/* 배열 초기화 */
				makeCateArray(cate1Obj, cate1Array, cateList, 1);
				makeCateArray(cate2Obj, cate2Array, cateList, 2);
				makeCateArray(cate3Obj, cate3Array, cateList, 3);

				/*
				$(document).ready(function(){
					console.log(cate1Array);
					console.log(cate2Array);
					console.log(cate3Array);
				});
				 */

				/* 대분류 <option> 태그 */
				for (let i = 0; i < cate1Array.length; i++) {
					cateSelect1
							.append("<option value='"+cate1Array[i].cateCode+"'>"
									+ cate1Array[i].cateName + "</option>");
				}

				/* 중분류 <option> 태그 */
				$(cateSelect1)
						.on(
								"change",
								function() {

									let selectVal1 = $(this).find(
											"option:selected").val();

									cateSelect2.children().remove();
									cateSelect3.children().remove();

									cateSelect2
											.append("<option value='none'>선택</option>");
									cateSelect3
											.append("<option value='none'>선택</option>");

									for (let i = 0; i < cate2Array.length; i++) {
										if (selectVal1 === cate2Array[i].cateParent) {
											cateSelect2
													.append("<option value='"+cate2Array[i].cateCode+"'>"
															+ cate2Array[i].cateName
															+ "</option>");
										}
									}// for

								});

				/* 소분류 <option>태그 */
				$(cateSelect2)
						.on(
								"change",
								function() {

									let selectVal2 = $(this).find(
											"option:selected").val();

									cateSelect3.children().remove();

									cateSelect3
											.append("<option value='none'>선택</option>");

									for (let i = 0; i < cate3Array.length; i++) {
										if (selectVal2 === cate3Array[i].cateParent) {
											cateSelect3
													.append("<option value='"+cate3Array[i].cateCode+"'>"
															+ cate3Array[i].cateName
															+ "</option>");
										}
									}// for		

								});

				function search() {
					let tb = document.getElementById("cate3");
					let tbIndex = document.getElementById("cate3").options.selectedIndex;

					sessionStorage
							.setItem("mission", tb.options[tbIndex].value);

					console.log("tb value:" + tb.options[tbIndex].value);
					console.log("tb value2:"
							+ sessionStorage.getItem("mission"));

					location.href = "cate3?cateCode="
							+ tb.options[tbIndex].value;

				}

				let moveForm = $('#moveForm');

				$('#test').val(sessionStorage.getItem("mission"));
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