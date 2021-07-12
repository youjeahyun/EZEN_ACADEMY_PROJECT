<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!doctype html>
<html lang='ko'>
<head>
	<meta charset="utf-8">
	<title>Healing Feeling</title>
	<link rel="stylesheet" href="index.css">
	<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<div class="hero-section"><!--컨텐츠 묶음-->
		<div class="about-text hover-target">About</div><!--css에서 .about-text로시작하는곳 다 연결됨 hover-target은 -->
		<div class="contact-text hover-target">Contact</div><!--css에서 .contact-text:hover:before 연결됨-->
		<div class="section-center"><!--css에서 .section-center 연결됨 -->
			<div class="container-fluid"><!--부트스트랩 태그 가로해상도 상관없이 100% width임-->
				<div>
					<div>
						<h1 class="hover-target">HealingFeelling</h1><!--해당타겟에에 마우스커서 근접하면 지정된오버효과나옴 이하 똑같은사유임.-->
						<br>
					</div>

					<div>
						<div class="teamname hover-target">Team The6</div><!--.hero-section .teamname으로 css 연결-->
					</div>

					<div>
						<p>
							<!--j쿼리랑 연결시켜야되서 class만들어놈 맨밑에 j쿼리있음-->
							<span class="category hover-target">Category</span>
							<span class="bestpost hover-target">Best Post</span>
							<span class="signup hover-target">Sign Up</span> 
							<span class="login hover-target">Login</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="about-section"><!--어바웃구역 묶음-->
		<div class="about-close"></div><!--제이쿼리로 켜진창 닫는 X버튼 css에서 .about-close로 시작하는곳 다 연결됨--> 
		<div class="section-center"><!--css에서 .section-center 연결됨 -->	
			<div class="container"> <!-- 부트스트랩 태그 고정레이아웃 좌우여백이있음 fluid랑은 다름 -->
				<div>
					<div>
						<img src="index\about.JPG" alt="aboutopen" class="hover-target"><br>
					</div>

					<div id="about-text" class="hover-target"><!--위에 클래스 어바웃텍스트가있기때문에 id값으로 부여-->
						<p>인생을 살다 보면 자연스럽게 누구나 지치고 힘든 시기가 지나갑니다.</p>
						<p>예를 들어, 좋아하는 사람과 이별을 하거나, 사회생활을 하다 누군가와 마찰이 생기기도 하고</p>
						<p>코로나 바이러스로 인해, 바깥활동이 자제된 현재 코로나 블루 증상을 겪는다던가,</p>
						<p>취업으로 인한 스트레스, 갑자기 비가 올 때 울적함 등 인간에겐 지치는 순간이 항상 생깁니다.</p>
						<p>하지만 자연스럽게 오는 당연한 일처럼, 안일하게 지나치다 보면</p>
						<p>어느 순간 우울증이라는 감정의 병이 본인에게 찾아올 수 있습니다.</p>
						<p>개발자의 웹제작 목적은 누군가 지칠 때 힐링필링이라는 페이지가 힘든시기를 공감해주고</p>
						<p>활력을 넣어줄수 있는 웹페이지가 되었으면 하는 바램에 제작하게되었습니다.</p>
					</div>

					<div>
						<p class="hover-target">
							<span>Team The6</span>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>

	<div class="contact-section"><!--켄택트 구역 묶음-->
		<div class="contact-close"></div><!--제이쿼리로 켜진창 닫는 X버튼 css에서 .about-close로 시작하는곳 다 연결됨--> 
		<div class="section-center"><!--css에서 .section-center 연결됨 -->
			<div class="container"><!--부트스트랩 태그 따로 css에서 별도지정안함-->
				<div>
					<div>
						<a href="#" class="hover-target">팀장 유재현 wogusdl9747@naver.com</a>
						<a href="#" class="hover-target">팀원 박민상 alstkd2864@naver.com</a> <a
							href="#" class="hover-target">팀원 신호연 shinhoyeon94@naver.com</a>
					</div>
					<br>
					<div class="link">
						<a href="https://sb.ezenac.co.kr/" class="hover-target">EzenAcademy</a>
						<a href="https://blog.naver.com/wogusdl9747" class="hover-target">팀장's	blog</a>
					</div><br>

					<div>
						<p class="hover-target">
							<span>Team The6</span>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="category-section"><!--카테고리 구역 묶음-->
		<div class="category-close"></div><!--제이쿼리로 켜진창 닫는 X버튼 css에서 .category-close로 시작하는곳 다 연결됨--> 
		<div class="container"><!--부트스트랩 태그 따로 css에서 별도지정안함 부트스트랩 contatiner 검색 후 이해-->
			<div class="row justify-content-center"><!--부트스트랩태그 row는 가로 한줄을 넣을때 필요 / justinfy-content 는 정렬된 요소들은 배치해줄수있는데 우린 중앙으로준거임-->
				<div class="col-12"><!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해-->
					<h3 class="hover-target">Post Category</h3>
				</div>
				
				<div class="col-12"><!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해-->
					<p class="hover-target">
						<span>It's a gift for you. Look and feel!</span>
					</p>
				</div>
				
				<div class="col-12 hover-target"><!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해 마우스오버는 내가줌-->
					<p>힐링하는 방법은 많고, 다양합니다!</p>
				</div>
				
				<div class="col-md-6 col-lg-4"><!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해 , index.css에 photot추가해서 마우스오버시 투명도추가-->
					<a href="category_poem.jsp">
						<p id='explain'>마음의 평안을 찾아주는 "시"</p> <img src="index/시.jfif"
						alt="" class="photot hover-target">
					</a>
				</div>
				
				<div class="col-md-6 col-lg-4"><!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해 , index.css에 photot추가해서 마우스오버시 투명도추가-->
					<a href="category_say.jsp">
						<p id='explain'>자존감 뿜뿜 "명언"</p> <img src="index/명언.jfif" alt=""
						class="photot hover-target">
					</a>
				</div>
				
				<div class="col-md-6 col-lg-4"><!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해 , index.css에 photot추가해서 마우스오버시 투명도추가-->
					<a href="category_phrase.jsp">
						<p id='explain'>지친 나를 다독여주는 "글귀"</p> <img src="index/글귀.jfif"
						alt="" class="photot hover-target">
					</a>
				</div>
				
				<div class="col-md-6 col-lg-4"><!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해 , index.css에 photot추가해서 마우스오버시 투명도추가-->
					<a href="category_picture.jsp">
						<p id='explain'>직접보고 느끼는 것 같은 "사진"</p> <img src="index/사진.jfif"
						alt="" class="photot hover-target">
					</a>
				</div>
			</div>
		</div>
	</div>

	 <!-- 주석지저분해서 겹치는 부분이니 위에참고  -->
   <div class="bestpost-section"><!--추천게시글 구역 묶음-->
      <div class="bestpost-close"></div>
      <div class="container">
         <div class="row justify-content-center">
            <div class="col-12">
               <h3 class="hover-target">Best Post No.12</h3>
            </div>
            <div class="col-12">
               <p class="hover-target">
                  <span>HealingFeeling Performance!</span>
               </p>
               <p>이미지 클릭시 이미지가 바뀝니다! </p>
            </div>
   			
   			<script>
       		 var files = ["best/1.JPG", 
             "best/2.JPG",
             "best/3.JPG",
             "best/4.JPG",
             "best/5.JPG",
             "best/6.JPG",
             "best/7.JPG",
             "best/8.JPG",
             "best/9.JPG",
             "best/10.JPG",
             "best/11.JPG",
             "best/12.JPG",
             ];
        
     	     var imgs = new Array();
      		 for(i = 0; i < files.length; i++){
             imgs[i] = new Image(); // 이미지 객체 생성
             imgs[i].src = files[i]; // 페이지 로딩 될때 이미지가 미리 로딩
       	    	 }

        	 var next = 1;
        	 function change(obj){
          	 obj.src = imgs[next].src;
             next++;
             next %= imgs.length;
        	 }
   			 </script>
   			
   			 <div class="col-md-8 col-lg-6">
             <img src="best/1.JPG"
             onclick="change(this)">
        	 </div>
         </div>
      </div>
   </div>
	
	<!-- 주석지저분해서 겹치는 부분이니 위에참고  -->
	<div class="signup-section"><!--회원가입 구역 묶음-->
		<div class="signup-close hover-target"></div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12">
					<h3 class="hover-target">HealingFeelling Sign Up</h3>
				</div>
			
				<div class="col-12">
					<p class="hover-target">
						<span>Please be our family!</span>
					</p>
				</div>
				
				<div class="col-12">
					<p class="hover-target">힐링필링의 가족이 되어주세요.</p>
					<p class="hover-target">회원가입 완료되면 로그인이 자동으로 진행되며, 자유게시판이 활성화 됩니다.</p>
				</div><br> <br> <br>
			
				<div class="col-md-6 col-lg-4">
					<div class="jumbotron" style="padding: 20px;">  <!-- 점보트론도 부트스트랩 클래스임 인터넷검색 하고 이해 -->
						<form method="post" action="joinAction.jsp">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디"
								name="userID" maxlength="20">
							</div>

							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호"
								name="userPassword" maxlength="20">
							</div>

							<div class="form-group">
								<input type="text" class="form-control" placeholder="이름"
								name="userName" maxlength="20">
							</div>

							<div class="form-group" style="text-align: center;">
								<div class="btn-group" data-toggle="buttons">
									<label class="btn btn-primary active"> <input type="radio" name="userGender" autocomplete="off" value="남자">
									남자</label>
									<label class="btn btn-primary"> <input type="radio" name="userGender" autocomplete="off" value="여자">
									여자</label>
								</div>
							</div>

							<div class="form-group">
								<input type="email" class="form-control" placeholder="이메일"
									name="userEmail" maxlength="50">
							</div>
							<input type="submit" class="btn btn-primary form-control" value="회원가입">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 주석지저분하니 위에참고 -->
	<div class="login-section"> <!-- 로그인구역 묶음 -->
		<div class="login-close"></div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12">
					<h3 class="hover-target">HealingFeeling Login</h3>
				</div>
				
				<div class="col-12">
					<p class="hover-target">
						<span>Please sign in.</span>
					</p>
				</div>
				
				<div class="col-12">
					<p class="hover-target">로그인을 진행해 주시기 바랍니다.</p>
					<p class="hover-target">회원들과 소통 해보시는건 어떤가요? 이 모든 순간은 필연일지도(?!)</p>
				</div><br> <br> <br>
				
				<div class="col-md-6 col-lg-4">
					<div class="jumbotron" style="padding: 32px;">
						<form method="post" action="loginAction.jsp">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="아이디"
								name="userID" maxlength="20">
							</div>

							<div class="form-group">
								<input type="password" class="form-control" placeholder="비밀번호"
								name="userPassword" maxlength="20">
							</div>
							<input type="submit" class="btn btn-primary form-control"	value="로그인">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--마우스 커서 따라오는 효과 마우스오버 클래스랑 id지정-->
	<div class='cursor' id="cursor"></div>
	<div class='cursor2' id="cursor2"></div>
	<div class='cursor3' id="cursor3"></div>

	<script>
		/*자바스크립트 분석 및 공부필요함*/
		(function($) {
			"use strict";
			//Page cursors
			document.getElementsByTagName("body")[0].addEventListener(
					"mousemove", function(n) {
						t.style.left = n.clientX + "px",
								t.style.top = n.clientY + "px",
								e.style.left = n.clientX + "px",
								e.style.top = n.clientY + "px",
								i.style.left = n.clientX + "px",
								i.style.top = n.clientY + "px"
					});
			var t = document.getElementById("cursor"), e = document
					.getElementById("cursor2"), i = document
					.getElementById("cursor3");
			function n(t) {
				e.classList.add("hover"), i.classList.add("hover")
			}
			function s(t) {
				e.classList.remove("hover"), i.classList.remove("hover")
			}
			s();
			for (var r = document.querySelectorAll(".hover-target"), a = r.length - 1; a >= 0; a--) {
				o(r[a])
			}
			function o(t) {
				t.addEventListener("mouseover", n), t.addEventListener(
						"mouseout", s)
			}

			
			//모달창 띄우는 j쿼리 문법
			//About page
			$(".about-text").on('click', function() {
				$("body").addClass("about-on");
			});
			$(".about-close").on('click', function() {
				$("body").removeClass("about-on");
			});

			//Contact page
			$(".contact-text").on('click', function() {
				$("body").addClass("contact-on");
			});
			$(".contact-close").on('click', function() {
				$("body").removeClass("contact-on");
			});

			//category page
			$(".category").on('click', function() {
				$("body").addClass("category-on");
			});
			$(".category-close").on('click', function() {
				$("body").removeClass("category-on");
			});

			//bestpost  page
			$(".bestpost").on('click', function() {
				$("body").addClass("bestpost-on");
			});
			$(".bestpost-close").on('click', function() {
				$("body").removeClass("bestpost-on");
			});

			//signup  page
			$(".signup").on('click', function() {
				$("body").addClass("signup-on");
			});
			$(".signup-close").on('click', function() {
				$("body").removeClass("signup-on");
			});

			//login page
			$(".login").on('click', function() {
				$("body").addClass("login-on");
			});
			$(".login-close").on('click', function() {
				$("body").removeClass("login-on");
			});
		
			if(localStorage.getItem("login") == 1){
				$("body").addClass("login-on");
				localStorage.removeItem('login');
			} //로그인 유효성 확인때 창다시 띄워주는거
			if(localStorage.getItem("sign") == 1){
				$("body").addClass("signup-on");
				localStorage.removeItem('sign');
			} //회원가입 유효성 확인때 창다시 띄워주는거
			
			//모달창 띄우는 j쿼리 문법끝
			
		})(jQuery);
	</script>
</body>
<html>