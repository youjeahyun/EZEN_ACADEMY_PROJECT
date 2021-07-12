<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="image.Img"%>
<%@ page import="image.ImgDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.PrintWriter"%>


<!doctype html>
<html lang='ko'>
<head>
<meta charset="utf-8">
<title>Heal with Phrase</title>
<link rel="stylesheet" href="category.css">
</head>
<body>
	<nav role="navigation">
		<div id="menuToggle">
			<input type="checkbox" /> <span></span> <span></span> <span></span>

			<ul id="menu">
				<a href="category_poem.jsp"><li>마음의 평안을 찾아주는 "시"</li></a>
				<a href="category_picture.jsp"><li>직접보고 느끼는 것 같은 "사진"</li></a>
				<a href="category_say.jsp"><li>자존감 뿜뿜 "명언"</li></a>
				
				<% //유효성검사 로그인이 되어있으면 main으로 로그인이안되있으면 index로
					String userID = null;
					if (session.getAttribute("userID") != null) {
						userID = (String) session.getAttribute("userID");
				%>
						<a href="main.jsp"><li>힐링필링 메인으로 돌아가기</li></a>
				<% 
					}else{
				%>
						<a href="index.jsp"><li>힐링필링 메인으로 돌아가기</li></a>
				<%
					}
				%>
			</ul>
		</div>
	</nav>

	<h1>지친 나를 다독여주는 "글귀"</h1>
	<h2>
		It's a gift for you. Look and feel! <br> 너를 위한 선물이야. 힐링을 느껴봐!
	</h2>
<!-- 데이터베이스로 사진추가 삭제 123계정으로만 -->
<%
	ImgDAO ii = new ImgDAO();	
	List<Img> test = ii.test();
	for(int i=0; i<test.size();i++){
		int j = i;
		Img tt = test.get(i);
		if(tt.getImgphrase()!=null){
		
		
%>
	<img src="${pageContext.request.contextPath}\<%=tt.getImgphrase()%>" id="<%=j%>" alt="오류발생! 클릭하여 삭제 후 재진행 필요합니다.">
	
	<%
	if(userID != null && userID.equals("123")){
	%>
	<script>
		var div1 = new Array(100); 
     	div1[<%=j%>] = document.getElementById('<%=j%>');
	
		//if(userID != null && userID.equals("123")){
			  div1[<%=j%>].addEventListener('click', function(e){
		        //  console.log('ㅎㅎ');		  
		    	//var number2 = <%=tt.getImgnum()%>;
		    	//console.log(number2);	
		    	
		    	//localStorage.setItem('de', number2);
		    	if(confirm('정말 삭제 하시겠습니까?')==true){
		    		location.href = 'imgDelete.jsp?imgnum=<%=tt.getImgnum()%>';
		    	}
		    	else{
		    		return false;
		    	}
		    	 
		      });
		//}
	
	</script>
<%
		}
	
		}
	}
	
	
%>

 <%
 	if(userID != null && userID.equals("123")){
 
 	session.setAttribute("test", "1");
 %>
 		<a href="choga.jsp">추가</a>	
 <%
 	}
 %>
 
</body>
<html>