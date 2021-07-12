<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area"
			style="color: white; background-color: #424242">
			<ul class="list">
				<c:if test="${member == null}">
					<!-- 로그인 x -->
					<li><a href="/member/login" class="menulink">로그인</a></li>
					<li><a href="/member/join" class="menulink">회원가입</a></li>
				</c:if>
				<c:if test="${member != null }">
					<!-- 로그인 o -->
					<c:if test="${member.adminCk == 1 }">
						<!-- 관리자 계정 -->
						<li><a href="/admin/main" class="menulink">관리자 페이지</a></li>
					</c:if>

					<li><a href="userRoom" class="menulink">마이룸</a></li>
					<li><a id="gnb_logout_button" class="/member/logout.do">로그아웃</a></li>
				</c:if>

			</ul>
		</div>

		<div class="top_area" style="color: white; background-color: gray">
			<!-- 로고영역 -->
			<div class="logo_area">
				<a href="/main"><img src="/resources/img/ezen.JPG"></a>
			</div>
			<div class="search_area">
				<form id="searchForm" action="/search" method="get">
					<div style="margin-top: 50px; margin-left: 60px">
						<input type="text" placeholder="검색어를 입력하세요."
							class="search_area_input" name="keyword"
							value='<c:out value="${pageMaker.cri.keyword}"></c:out>'
							style="font-size: 16px; width: 325px; padding: 10px; border: 0px; online: none;">

						<input type="hidden" name="pageNum"
							value='<c:out value="${pageMaker.cri.pageNum}"></c:out>'>
						<input type="hidden" name="amount"
							value='<c:out value="${pageMaker.cri.amount}"></c:out>'>


						<button class=''
							style="width: 60px; height: 38px; border: 0px; background-color: #424242; outline: none; color: white; font-size: 16px; font-weight: 900;">검색</button>
					</div>
				</form>
			</div>
			<div class="login_area">

				<!-- 로그인 하지 않은 상태 -->
				<c:if test="${member == null }">
					<div>
						<img src="/resources/img/book.jpg" class="login_fail_area">
					</div>
				</c:if>

				<!-- 로그인한 상태 -->
				<c:if test="${ member != null }">
					<div class="login_success_area">
						<span>고객명 : ${member.memberName} 님</span> <span>포인트 : <fmt:formatNumber
								value="${member.point}" pattern="#,###,###" /> P<br> <span>방문
								감사합니다. 😍😘 </span>
						</span> <a href="/member/logout.do" class="logouthover">로그아웃</a>
					</div>
				</c:if>

			</div>
			<div class="clearfix"></div>
		</div>
		<nav class="navi_bar_area">
			<a class="menulink" href="cate1?nationId=01">국내도서</a> <a
				class="menulink" href="cate2?nationId=02">국외도서</a> <a
				class="menulink" href="cate3">장르별</a> <a class="menulink"
				href="cate4">작가별</a> <a class="menulink" href="bbs">회원게시판</a>
		</nav>