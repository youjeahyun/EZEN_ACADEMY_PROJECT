<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠문고 스토어 로그인</title>
<link rel="stylesheet" href="/resources/css/member/login.css">
<script src="https://code.jquery.com/jquery-3.4.1.js">
integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
crossorigin="anonymous"
</script>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>

<div class="wrapper">
	<div class="container">
		<div class="row justify-content-center">
			<div class="wrap">
				<div class="logo_wrap col-12">
					<span>EZEN BOOK STORE</span>
				</div>
				<form id="login_form" method="post" >
				<div class="login_wrap col-lg-12 col-md-12"> 
						<div class="id_wrap">
							<input class="id_input form-control" name="memberId" placeholder="ID를 입력해주세요.">
							<span class="final_id_ck">아이디를 입력해주세요.</span>	
						</div>
						<div class="pw_wrap" >
							<input class="pw_input form-control" name="memberPw" type="password" placeholder="PW를 입력해주세요.">
							<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
						</div>
						
						<c:if test = "${result == 0 }">
							<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
						</c:if>
						
						<div class="login_button_wrap">
							<input type="button" class="login_button form-control" value="로그인">
							<input type="button" class="back_button form-control" value="돌아가기">
							<input type="button" class="join_button form-control" value="회원가입하기" style="font-weight: bold; color: cornflowerblue;">
						</div>			
					</div>
				</form>
			</div>
		</div>	
	</div>
</div>

<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
       
    	/* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/member/login.do");
        $("#login_form").submit();
    });
 
	   /* 돌아가기 버튼 클릭 메서드 */
	   $(".back_button").click(function(){
       
		 $(location).attr('href', "../main");
   });
	   /* 회원가입 버튼 클릭 메서드 */
	   $(".join_button").click(function(){
       
		 $(location).attr('href', "/member/join");
   });
	   
</script>

</body>
</html>