<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="user.UserDAO"%>
<%@ page import="user.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<!doctype html>
<html lang='ko'>
<head>
	<meta charset="utf-8">
	<title>Healing Feeling</title>
	<link rel="stylesheet" href="index.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<div class="hero-section"> <!--컨텐츠 묶음-->
		<div class="about-text hover-target">About</div> <!--css에서 .about-text로시작하는곳 다 연결됨 hover-target은 -->
		<div class="contact-text hover-target">Contact</div> <!--css에서 .contact-text:hover:before 연결됨-->
		<div class="section-center"><!--css에서 .section-center 연결됨 -->
			<div class="container-fluid"><!--부트스트랩 태그 따로 css에서 별도지정안함 구글링후 이해-->
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
							<span class="category hover-target">Category</span> <span
								class="bestpost hover-target">Best Post</span> <span
								class="freeboard hover-target">FreeBoard</span> <span
								class="login hover-target">Logout</span>
								<span class="myinfo hover-target">My Info</span>    
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="about-section">	<!--어바웃구역 묶음-->
		<div class="about-close"></div><!--제이쿼리로 켜진창 닫는 X버튼 css에서 .about-close로 시작하는곳 다 연결됨--> 
		<div class="section-center"> <!--css에서 .section-center 연결됨 -->	
			<div class="container">
				<div>
					<div>
						<img src="index\about.JPG" alt="aboutopen" class="hover-target"><br>
					</div>

					<div id="about-text" class="hover-target">
						<!--위에 클래스 어바웃텍스트가있기때문에 id값 부여-->
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
						<p class="hover-target"><span>Team The6</span></p>
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
					</div>
					<br>

					<div>
						<p class="hover-target"><span>Team The6</span></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="category-section"><!--카테고리 구역 묶음-->
		<div class="category-close"></div><!--제이쿼리로 켜진창 닫는 X버튼 css에서 .category-close로 시작하는곳 다 연결됨--> 
		<div class="container"><!--부트스트랩 태그 따로 css에서 별도지정안함 부트스트랩 contatiner 검색 후 이해-->
			<div class="row justify-content-center"><!--row랑 justify-contetnt-center 부트스트랩 검색 후 이해-->
				<div class="col-12"> <!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해-->
					<h3 class="hover-target">Post Category</h3>
				</div>
			
				<div class="col-12"><!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해-->
					<p class="hover-target">
						<span>It's a gift for you. Look and feel!</span>
					</p>
				</div>
			
				<div class="col-12 hover-target"><!--부트스트랩 태그임 구글에 부트스트랩 12그리드 검색 후 이해-->
					<!--부트스트랩 태그 따로 css에서 별도지정안함-->
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
               <p>이미지 클릭시 다른이미지가 출력됩니다! </p>
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


	<div class="freeboard-section"><!-- 자유게시판영역 -->
		<div class="freeboard-close hover-target"></div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12">
					<h3 class="hover-target">User FreeBoard</h3>
				</div>
			
				<div class="col-12">
					<p class="hover-target">
						<span>talk to us!</span>
					</p>
				</div>
			
				<div class="col-12">
					<p class="hover-target">자유롭게 회원들과 게시글을 올려보세요.</p>
				</div>

					
					<% //페이징처리를 위한 자바언어
					
					
					String searchWord = request.getParameter("searchWord");
					String keyword = request.getParameter("keyword");
								
					String userID = null;
						if (session.getAttribute("user ID") != null) {
						userID = (String) session.getAttribute("userID");
						}
					int pageNumber = 1;
					if (request.getParameter("pageNumber") !=null) {
					pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
					}
					
					int pageSize = 10;
					String pageNum = request.getParameter("pageNum");
					if (pageNum == null){ // 클릭한게 없으면 1번 페이지
						pageNum = "1";
					}
					// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
					int currentPage = Integer.parseInt(pageNum);
					
					int startRow = (currentPage - 1) * pageSize;
					int endRow = 10;		
					//검색 시작
					if(searchWord == null){
					int count = 0;
					BbsDAO manager = new BbsDAO();
					count = manager.getCount(); // 데이터베이스에 저장된 총 갯수
					
					List<Bbs> list = null;
					if (count > 0) {
						// getList()메서드 호출 / 해당 레코드 반환
						list = manager.getList(startRow, endRow);
					}
					
					
					%>
		
				<div class="container">
					<div class="row">
						<table class="table table-striped "
							style="text-align: center; border: 1px solid #dddddd">
							<thead>
										
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">번호</th>
									<th style="background-color: #eeeeee; text-align: center;">제목</th>
									<th style="background-color: #eeeeee; text-align: center;">작성자</th>
									<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								</tr>
							</thead>

							<tbody style="color: white;">
								<%
									if (count > 0) { // 데이터베이스에 데이터가 있으면
									int number = count - (currentPage - 1) * pageSize; // 글 번호 순번 
		
									
									
									for (int i = 0; i < list.size(); i++) {
									Bbs board = list.get(i); // 반환된 list에 담긴 참조값 할당
																		
								%>
								<tr>
									<td><%=number--%></td>
									<td><a href="view.jsp?bbsID=<%=board.getBbsID()%>"><%=board.getBbsTitle()%></a></td>
									<td><%=board.getUserID()%></td>
									<td><%=board.getBbsDate().substring(0, 11) + board.getBbsDate().substring(11, 13) + "시"
										+ board.getBbsDate().substring(14, 16) + "분"%></td>
								</tr>
								<%
									}
								}
								%>

								<tr>
							
								<td colspan="4">
									<div style="display:inline-block; float:left" >
									<%	// 페이징  처리
										if(count > 0){
										// 총 페이지의 수
										int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
										// 한 페이지에 보여줄 페이지 블럭(링크) 수
										int pageBlock = 5;
										// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
										int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
										int endPage = startPage + pageBlock - 1;
							
										// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
										if(endPage > pageCount){
											endPage = pageCount;
										}
								
										if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
									%>
										
									<%		
										}
								
										for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
										if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
									%>
										[<%=i %>]
									<%									
									}else{ // 현재 페이지가 아닌 경우 링크 설정
									%>
									<script type="text/javascript">
									let viewCls = {}
									
									viewCls = {
										mainOpen: function(){
										localStorage.setItem('board', 1);
										location.href = 'main.jsp?pageNum=<%=i%>';
										}
									}
									</script>
								
									<a href="main.jsp?pageNum=<%=i%>" class="tt"  onclick="viewCls.mainOpen();">[<%=i %>]</a>
									<%	
										}
									} // for end
									if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
									%>
									<a href="main.jsp?pageNum=<%=startPage + 10 %>" onclick="viewCls.mainOpen();">[다음]</a>
									<%			
										}
									}
								}
							else{
								System.out.println("-----------");
								System.out.println("실행");
								System.out.println(searchWord+"!!");
								int count2 = 0;
								BbsDAO manager2 = new BbsDAO();
								count2 = manager2.getCount(keyword,searchWord); // 데이터베이스에 저장된 총 갯수
								System.out.println("총갯수"+count2);
								List<Bbs> list2 = null;
								if (count2 > 0) {
									// getList()메서드 호출 / 해당 레코드 반환
									list2 = manager2.getList(startRow, endRow,keyword,searchWord);
								}
								
							%>
							<div class="container">
								<div class="row">
									<table class="table table-striped "
										style="text-align: center; border: 1px solid #dddddd">
										<thead>
											<tr>
												<th style="background-color: #eeeeee; text-align: center;">번호</th>
												<th style="background-color: #eeeeee; text-align: center;">제목</th>
												<th style="background-color: #eeeeee; text-align: center;">작성자</th>
												<th style="background-color: #eeeeee; text-align: center;">작성일</th>
											</tr>
										</thead>

										<tbody style="color: white;">
											<%	
												if (count2 > 0) { // 데이터베이스에 데이터가 있으면
												int number = count2 - (currentPage - 1) * pageSize; // 글 번호 순번 
												for (int i = 0; i < list2.size(); i++) {
												Bbs board = list2.get(i); // 반환된 list에 담긴 참조값 할당
											%>
											<tr>
												<td><%=number--%></td>
												<td><a href="view.jsp?bbsID=<%=board.getBbsID()%>"><%=board.getBbsTitle()%></a></td>
												<td><%=board.getUserID()%></td>
												<td><%=board.getBbsDate().substring(0, 11) + board.getBbsDate().substring(11, 13) + "시"
													+ board.getBbsDate().substring(14, 16) + "분"%></td>
											</tr>
											<%
												}
												}
											%>
				
											<tr>
												<td colspan="4">
													<div style="display:inline-block; float:left" >
													<%	// 페이징  처리
														if(count2 > 0){
															// 총 페이지의 수
															int pageCount = count2 / pageSize + (count2%pageSize == 0 ? 0 : 1);
															// 한 페이지에 보여줄 페이지 블럭(링크) 수
															int pageBlock = 5;
															// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
															int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
															int endPage = startPage + pageBlock - 1;
															
															// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
															if(endPage > pageCount){
																endPage = pageCount;
															}
															
															if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
													%>
															
													
																<a href="main.jsp?keyword=<%=keyword%>&searchWord=<%=searchWord%>&pageNum=<%=startPage - 10%>" onclick="viewCls.mainOpen();" >[이전]</a>	
													<%		
															}
															
															for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
																if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
																	//int pageNo = i;
																
													%>
																	[<%=i %>]
													<%									
																}else{ // 현재 페이지가 아닌 경우 링크 설정
													%>
															
																	
													<script type="text/javascript">
														let viewCls = {}
																	
														viewCls = {
															mainOpen: function(){
																localStorage.setItem('board', 1);
																location.href = 'main.jsp?searchWord=<%=searchWord%>pageNum=<%=i%>';
																}
															}
													</script>
													<a href="main.jsp?keyword=<%=keyword%>&searchWord=<%=searchWord%>&pageNum=<%=i%>" class="tt"  onclick="viewCls.mainOpen();" >[<%=i %>]</a>
					
													<%	
																}
															} // for end
															
															if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
													%>
																<a href="main.jsp?keyword=<%=keyword%>&searchWord=<%=searchWord%>&pageNum=<%=startPage + 10 %>" onclick="viewCls.mainOpen();">[다음]</a>
																
													<%			
															}
														}
													
													}
													%>
													</div>
													
													<div style="display:inline-block; float:center">
														<form action="main.jsp">
															<select name="keyword"  >
																<option value="bbsTitle">제목(Title)</option>
																<option value="bbsContent">내용(Content)</option>
																<option value="userID">작성자(Name)</option>		
															</select>
					   										<input type="text" name="searchWord" style="width:250px" ><input type="submit" value="검색" style="font-weight: bolder;" onclick="viewCls.mainOpen();" >
					   									</form>
													</div>
					   								
					   								<div style="display:inline-block; float:right">
														<form method="post" action="write.jsp">
					   										<input type="submit" value="글쓰기" style="font-weight: bolder;">
					   									</form>
													</div>
					   							</td>
											</tr>
										</tbody>
										</table>
									</div>
								</div>
							</div>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 주석지저분해서 겹치는 부분이니 위에참고  -->
	<div class="login-section">
		<div class="login-close"></div>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12">
					<h3 class="hover-target">HealingFeeling Logout</h3>
				</div>
				
				<div class="col-12">
					<p class="hover-target">
						<span>Are you going to end it?</span>
					</p>
				</div>
				
				<div class="col-12">
					<p class="hover-target">버튼을 누르면 로그아웃 됩니다.</p>
				</div><br> <br> <br>
				
				<div class="col-md-6 col-lg-4">
					<div class="jumbotron" style="padding: 32px;"> <!-- 점보트론도 부트스트랩 클래스임 인터넷검색 하고 이해 -->
						<form method="post" action="logoutAction.jsp">
							<input type="submit" class="btn btn-primary form-control" value="로그아웃">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

      <!-- 주석지저분해서 겹치는 부분이니 위에참고  -->
   <div class="myinfo-section">
      <div class="myinfo-close"></div>
      <div class="container">
         <div class="row justify-content-center">
				<div class="col-12">
					<h3 class="hover-target">My Information</h3>
				</div>
			
				<div class="col-12">
					<p class="hover-target">
						<span>Take care of your security.</span>
					</p>
				</div>
				
				<div class="col-12">
					<p class="hover-target">회원님의 정보를 수정,탈퇴 하실 수 있습니다.</p>
				</div><br> <br> <br>
			
				<div class="jumbotron" style="padding: 20px;">
						<%
							Object user = session.getAttribute("userID");
							String user2 = (String)user;
							
							UserDAO up = new UserDAO();
							
							List<User> test = up.test(user2);
							User tt = test.get(0);
							
						%>
						<form method="post" action="userUpdateAction.jsp">
						<div class="form-group"> <!-- ID는 DEAFAULT로 값만 그냥 데이터베이스로 뿌려주면될것같음. 성별하고 나머지는 그냥 수정가능하게 열어놓던가 폼내에 placeholer값에 현재값 뿌릴수있으면 뿌리는방식으로 진행하면될듯함  -->
							<input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20" value=<%=tt.getUserID()%> readonly> 
						</div>
						<div class="form-group">
							<input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20" value=<%=tt.getUserPassword()%> >
						</div>
						<div class="form-group">
							<input type="text" class="form-control" placeholder="이름" name="userName" maxlength="20" value=<%=tt.getUserName()%>>
						</div>
						<div class="form-group">
						<input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="50" value=<%=tt.getUserEmail() %>>
						</div>
						
						<div class="form-group">
						<input type="submit" class="btn btn-primary form-control" value="수정하기">
						</div>
						
						<script>
							function removeCheck(){ //자바스크립트 
								if(confirm("회원탈퇴를 진행 하시겠습니까?")==true){
									location.href = 'userDelete.jsp'
								}else{
									return false;
								}
							}
						</script>
					    <input type="button" class="btn btn-primary form-control" value="회원탈퇴하기" onclick="removeCheck();"> <!-- 자바스크립트 -->
					</form>
				</div>
			</div>
		</div>
	</div>


	<!--마우스 커서 따라오는 효과 마우스오버 생성-->
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

			//CATEGORY page
			$(".category").on('click', function() {
				$("body").addClass("category-on");
			});
			$(".category-close").on('click', function() {
				$("body").removeClass("category-on");
			});

			//BESTPOST page
			$(".bestpost").on('click', function() {
				$("body").addClass("bestpost-on");
			});
			$(".bestpost-close").on('click', function() {
				$("body").removeClass("bestpost-on");
			});

			//freeboard page
			$(".freeboard").on('click', function() {
				$("body").addClass("freeboard-on");		
			});				 
			$(".freeboard-close").on('click', function() {
				$("body").removeClass("freeboard-on");
			});
			
			//logout portfolio page 로그인과 동일함 로직은같음.
			$(".login").on('click', function() {
				$("body").addClass("login-on");
			});
			$(".login-close").on('click', function() {
				$("body").removeClass("login-on");
			});
			
			   //myInfo
	         $(".myinfo").on('click', function() {
	            $("body").addClass("myinfo-on");
	         });
	         $(".myinfo-close").on('click', function() {
	            $("body").removeClass("myinfo-on");
	         });
	      
		
			if(localStorage.getItem("board") == 1){
				$("body").addClass("freeboard-on");
				localStorage.removeItem('board');
			}//게시판 내에 기능으로인해 목록이나 돌아가기 수정완료 등 j쿼리로 생긴 창이 새로고침될때때 창다시 띄워주는거
			
		})(jQuery);
	</script>
</body>
<html>