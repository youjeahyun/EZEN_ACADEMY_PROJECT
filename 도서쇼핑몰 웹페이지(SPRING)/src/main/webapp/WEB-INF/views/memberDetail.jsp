<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/memberDetail.css">

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
				<lI><a class="user_list_04" href="memberDetail">내 정보 </a></lI>

			</ul>
		</div>

		<section id="content">

			<div class="user_content_wrap">
				<div class="user_content_subject">
					<span>회원 정보 조회</span>
				</div>
				<div class="user_content_main">
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
							<input class="input_block" name="memberName" readonly="readonly"
								value="${memberInfo.memberName}">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>비밀번호</label>
						</div>
						<div class="form_section_content">
							<input class="input_block" name="memberPw" readonly="readonly"
								value="<c:out value='${memberInfo.memberPw}'></c:out>">
						</div>
					</div>
					<div class="form_section">
						<div class="form_section_title">
							<label>이메일</label>
						</div>
						<div class="form_section_content">
							<input class="input_block" name="memberMail" readonly="readonly"
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
									readonly="readonly"
									value="<c:out value='${memberInfo.memberAddr1}'></c:out>">
							</div>
						</div>

						<div class="form_section">
							<div class="form_section_title">
								<label>기본주소</label>
							</div>
							<div class="form_section_content">
								<input class="input_block" name="memberAddr2"
									readonly="readonly"
									value="<c:out value='${memberInfo.memberAddr2}'></c:out>">
							</div>
						</div>
						<div class="form_section">
							<div class="form_section_title">
								<label>상세주소</label>
							</div>
							<div class="form_section_content" >
								<input class="input_block" name="memberAddr3"
									readonly="readonly"
									value="<c:out value='${memberInfo.memberAddr3}'></c:out>">
							</div>
						</div>



					</div>
				</div>

				<form id="moveForm" method="get">
					<input type="hidden" name="memberId"
						value='<c:out value="${memberInfo.memberId }"/>'>

				</form>
				<div class="btn_section">
					<button id="cancelBtn" class="btn"
						onclick="location.href='/userRoom'">취소</button>
					<button class="btn modify_btn"
						onclick="location.href='/memberModify'">수정 및 탈퇴</button>
						
				</div>
			</div>

		</section>
	</div>
	<%@include file="includes/footer.jsp"%>

	<script>
		
	</script>
</body>
</html>