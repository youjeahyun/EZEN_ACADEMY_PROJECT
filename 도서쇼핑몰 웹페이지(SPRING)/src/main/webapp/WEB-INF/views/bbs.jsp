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
<link rel="stylesheet" href="resources/css/bbs.css">
<script src="https://code.jquery.com/jquery-3.4.1.js">
	integrity = "sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin = "anonymous"
</script>
</head>
<body>
	<%@include file="includes/header.jsp"%>
	<div class="bbs_area">
		<div class="bbs_div">
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<tbody>

					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
						<th style="background-color: #eeeeee; text-align: center;">조회수</th>
					</tr>

					<c:set var="count" value="${pageMaker.number}" />
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${count}"></c:out></td>
							<td><a style="color: #1088ed; font-weight: 500;"
								href="${path}/bbsread?boardid=${list.boardid}">${list.title}</a>
							</td>
							<td>${list.writer}</td>
							<td><fmt:formatDate value="${list.regDate}"
									pattern="yyyy-MM-dd" /></td>
							<td>${list.viewCnt}</td>
						</tr>
						<c:set var="count" value="${count-1 }" />
					</c:forEach>
				</tbody>
			</table>


			<div class="card-footer">
				<c:if test="${member.memberId!=null}">
					<div class="float-right" style="text-align:right"">
						<button onclick="location.href='${path}/bbswrite'" type="button"
							class="btn btn-success" id="writeBtn">
							<i class="fa fa-pencil"></i> 글쓰기
						</button>
					</div>
				</c:if>
			</div>



			<!-- 검색 영역 -->
			<div class="search_wrap">
				<form id="searchForm" action="/bbs" method="get">
					<div class="search_input">
						<input type="text" name="keyword"
							value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
						<input type="hidden" name="pageNum"
							value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
						<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
						<button class='btn search_btn'>검 색</button>
					</div>
				</form>
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
						<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":"" }">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<!-- 다음 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageMaker_btn next"><a
							href="${pageMaker.pageEnd + 1}">다음</a></li>
					</c:if>

				</ul>

			</div>
			<form id="moveForm" action="/bbs" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
				<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
				<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
			</form>






		</div>
	</div>
		<script>
		var result = "${msg}";
		if (result == "regSuccess") {
			alert("게시글 등록이 완료 되었습니다.");
		} else if (result == "modSuccess") {
			alert("게시글 수정이 완료 되었습니다.");
		} else if (result == "delSuccess") {
			alert("게시글 삭제가 완료 되었습니다.");

		}

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
		let searchForm = $('#searchForm');
		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();

			moveForm.find("input[name='pageNum']").val($(this).attr("href"));

			moveForm.submit();

		});

		/*  검색 버튼 동작 */
		$("#searchForm2 button").on("click", function(e) {

			e.preventDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});
	</script>

	<%@include file="includes/footer.jsp"%>



</body>
</html>