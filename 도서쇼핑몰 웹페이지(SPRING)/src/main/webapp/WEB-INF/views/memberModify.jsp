<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/memberDetail.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
	
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
				<lI><a class="user_list_04" href="myPage">내 정보 </a></lI>

			</ul>
		</div>

		<section id="content">

			<div class="user_content_wrap">
				<div class="user_content_subject">
					<span>회원 정보 수정</span>
				</div>
				<div class="user_content_main">
					<form id="modifyForm" action="/member/memberModify" method="post">
						<div class="form_section">
							<div class="form_section_title">
								<label>아이디</label>
							</div>
							<div class="form_section_content">
								<input class="input_block" name="memberId" readonly="readonly"
									value="${memberInfo.memberId}">

							</div>
						</div>
						<div class="form_section">
							<div class="form_section_title">
								<label>이름</label>
							</div>
							<div class="form_section_content">
								<input class="input_block" name="memberName"
									value="${memberInfo.memberName}">
							</div>
						</div>
						<div class="form_section">
							<div class="form_section_title">
								<label>비밀번호</label>
							</div>
							<div class="form_section_content">
								<input class="input_block" name="memberPw"
									value="<c:out value='${memberInfo.memberPw}'></c:out>">
							</div>
						</div>
						<div class="form_section">
							<div class="form_section_title">
								<label>이메일</label>
							</div>
							<div class="form_section_content">
								<input class="input_block" name="memberMail"
									value="<c:out value='${memberInfo.memberMail}'></c:out>">
							</div>
						</div>
						<div class="form_section" style="height: 530px;">
							<div class="form_section">
								<div class="form_section_title">
									<label>우편번호</label>
								</div>
								<div class="form_section_content">
									<input class="input_block" name="memberAddr1"
										value="<c:out value='${memberInfo.memberAddr1}'></c:out>">
								</div>
							</div>

							<div class="form_section">
								<div class="form_section_title">
									<label>기본주소</label>
								</div>
								<div class="form_section_content">
									<input class="input_block" name="memberAddr2"
										value="<c:out value='${memberInfo.memberAddr2}'></c:out>">
								</div>
							</div>
							<div class="form_section">
								<div class="form_section_title">
									<label>상세주소</label>
								</div>
								<div class="form_section_content">
									<input class="input_block" name="memberAddr3"
										value="<c:out value='${memberInfo.memberAddr3}'></c:out>">
								</div>
							</div>
						</div>

						<div class="btn_section">
							<button type="button" class="btn btn-warning cancelBtn">
								<i class="fa fa-trash"></i> 취소
							</button>
							<button type="submit" class="btn btn-success modBtn">
								<i class="fa fa-save"></i> 수정하기
							</button>
							<button id="deleteBtn" class="btn delete_btn">회원 탈퇴</button>
						</div>
					</form>

				</div>
			</div>
		</section>
	</div>
	<form id="moveForm" method="get">
		<input type="hidden" name="memberId"
			value='<c:out value="${memberInfo.memberId }"/>'>

	</form>

	<%@include file="includes/footer.jsp"%>

	<script>
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);
			$(".modBtn").on("click", function() {
				formObj.submit();
				alert("정보수정 성공");
			});
			$(".cancelBtn").on("click", function() {
				history.go(-1);
			});
			
		});

		/* 삭제 버튼 */
		$("#deleteBtn")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							let moveForm = $("#moveForm");
							moveForm.find("input").remove();
							moveForm
									.append('<input type="hidden" name="memberId" value="${memberInfo.memberId}">');
							moveForm.attr("action", "/memberDelete");
							moveForm.attr("method", "post");
							moveForm.submit();
							alert("회원탈퇴 성공");
						});
	</script>
</body>
</html>