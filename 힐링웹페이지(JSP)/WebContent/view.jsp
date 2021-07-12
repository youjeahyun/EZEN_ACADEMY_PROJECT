<%@ page language="java" contentType="text/html; charset=UTF-8"

	pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="bbs.Bbs"%>

<%@ page import="bbs.BbsDAO"%>
<%@ page import="comment.ComDAO"%>
<%@ page import="comment.Comment"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>



<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="index.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<title>포스트 상세보기</title>

</head>

<!--세부게시글에서 자유게시판목록 j쿼리 창으로 이동하는 스크립트 좋은방법은아님. -->
<script>
	let viewCls = {}
	viewCls = {
		mainOpen: function(){
			localStorage.setItem('board', 1);
			location.href = 'main.jsp';
		}
	}
</script>
<body>

	<%

		//로긴한사람이라면	 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값

		String userID = null;

		if (session.getAttribute("userID") != null) {

			userID = (String) session.getAttribute("userID");

	

		}

		int bbsID = 0;

		if (request.getParameter("bbsID") != null) {

			bbsID = Integer.parseInt(request.getParameter("bbsID"));

		}

		if (bbsID == 0) {

			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('유효하지 않은 글 입니다.')");

			script.println("location.href = 'bbs.jsp'");

			script.println("</script>");

		}

		Bbs bbs = new BbsDAO().getBbs(bbsID);

	%>

	<!-- 게시판 -->

	<div class="container"  >

		<div class="row">

			<div class="bbscontainer" style="margin-top:20px; width:100%; height: 775px; overflow:auto">
				<table class="table table-striped"

					style="text-align: center; border: 1px solid #dddddd">

					<thead>

						<tr>

							<th colspan="3"

								style="background-color: #eeeeee; text-align: center;">글 보기 </th>

						</tr>

					</thead>

					<tbody>

						<tr>

							<td style="width: 20%;"> 글 제목 </td>

							<td colspan="2"><%= bbs.getBbsTitle() %></td>

						</tr>

						<tr>

							<td>작성자</td>	

							<td colspan="2"><%= bbs.getUserID() %></td>

						</tr>

						<tr>

							<td>작성일</td>	

							<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"

							+ bbs.getBbsDate().substring(14, 16) + "분"%></td>

						</tr>

						<tr>
						
							<td>내용</td>	

							<td colspan="2"  style="text-align: left;"><%= bbs.getBbsContent() %></td>
							</div>
						</tr>

						

					</tbody>

				</table>	

				<a href = "#" class="btn btn-primary" onclick="viewCls.mainOpen();">목록</a>

				

				

				<%

				//글작성자 본인일시 수정 삭제 가능 

					if(userID != null && userID.equals(bbs.getUserID())){

				%>

						<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>

						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>

				<%					

					}

				%>
				
				
				<%

				//글작성자 본인일시 수정 삭제 가능 

					if(userID != null && userID.equals("123")){

				%>

						<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>

				<%					

					}
				session.setAttribute("bbsID", bbsID);
				%>
			

					
				<%
						ComDAO cd = new ComDAO();
						List<Comment> test=cd.test(bbsID);
						for (int i = 0; i < test.size(); i++) {
						Comment comen = test.get(i);
						if(comen.getCom_num()==bbsID){
				%>
				<div class="card" id="comments" style="margin-top:16px">
					<ul class="list-unstyled" style="padding-left:20px; padding-right:20px; padding-top:0px; padding-bottom:0px;
												margin:0">
				    	<li class="media mt-4">				         
				          <div class="media-body">
				            	<h5 class="mt-0 mb-1"><%=comen.getCom_id() %></h5>
				            	<script>
									function removeCheck(){
										if(confirm("정말 삭제 하시겠습니까?")==true){
											location.href = 'commentDelete.jsp?comnum=<%= comen.getComnum()%>'
										}else{
											return false;
										}
									}
								</script>
								
				           	    <p><%=comen.getCom_contents()%>
				           	  
				           	    <% 
								if(userID != null && userID.equals("123")){
								%>
								<button class="btn btn-primary" onclick="removeCheck();" style="font-size:8px; padding:2px">삭제</button>
								<%
									}else if(userID.equals(comen.getCom_id())){
									
								%>
								<button class="btn btn-primary" onclick="removeCheck();"  style="font-size:8px; padding:2px">삭제</button>
								<% 
									}								
								%>
								</p>
				          </div>
				        </li>
				   
				    </ul>
				 <%
							}
						}
				 %>
					 
							
  					<div class="card-body">    
   						 <form method="post" action="comment.jsp">
   						 	  <div class="form-group">
       						 	 <label for="id" name="userID"><strong>댓글 작성</strong><br>
       						 	 	 현재 로그인되어있는 ID : <%=userID %> 님</label>
        						 <textarea class="form-control" id="comm" name="comm" rows="3"></textarea>
      					 	  </div>
      						  <input type="submit" class="btn btn-primary" id="comment-create-btn" value="댓글추가">
   					 	</form>
  					</div>
				</div>
				
				
			</div>
		</div>
	</div>
</body>

</html>