<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="image.ImgDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<!--<jsp:useBean id="image" class="image.Img" scope="page" />
<jsp:setProperty name="image" property="imgPath" />-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String imgs = request.getParameter("gg");
	System.out.println(imgs);
	response.setContentType("text/html; charset=UTF-8"); //set으로쓰는습관들이세오.
    // 실제로 서버에 저장되는 path
    String path = request.getRealPath("File");
    //out.println("절대 경로 : " + path + "<br/>");

    
    int size = 1024 * 1024 * 10; // 파일 사이즈 설정 : 10M
    String fileName = "";    // 업로드한 파일 이름
    String originalFileName = "";    //  서버에 중복된 파일 이름이 존재할 경우 처리하기 위해
    
    // cos.jar라이브러리 클래스를 가지고 실제 파일을 업로드하는 과정
    try{
        // DefaultFileRenamePolicy 처리는 중복된 이름이 존재할 경우 처리할 때
        // request, 파일저장경로, 용량, 인코딩타입, 중복파일명에 대한 정책
        MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
        
        // 전송한 전체 파일이름들을 가져온다.
        Enumeration files = multi.getFileNames();
        String str = (String)files.nextElement();
        
        //파일명 중복이 발생했을 때 정책에 의해 뒤에 1,2,3 처럼 숫자가 붙어 고유 파일명을 생성한다.
        // 이때 생성된 이름을 FilesystemName이라고 하여 그 이름 정보를 가져온다. (중복 처리)
        fileName = multi.getFilesystemName(str);
        //실제 파일 이름을 가져온다.
        originalFileName = multi.getOriginalFileName(str);
        
       
       // out.print(fileName);
      //  out.print("파일의 진짜 이름"+originalFileName);
      
   
    	
    }catch(Exception e){
        e.printStackTrace();
    }


   // String realJpg = path + "\\" + fileName;
	String realJpg = "File\\"+fileName;
	System.out.println(realJpg);
	


	//String[] imgs = request.getParameterValues("gg");
	//System.out.println(gg);
	Object tt2 = session.getAttribute("test");
	String ttt = (String)tt2;
	System.out.println(ttt);
	
			
	ImgDAO tt = new ImgDAO();
	int result =0;
	
	if(ttt.equals("1")){
		result = tt.imgPath(realJpg);
		if(result == -1){
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('실패!')");

			script.println("history.back()");

			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미지가 정상적으로 추가되었습니다.')");
			script.println("localStorage.setItem('delete', 1);");
			script.println("location.href='category_phrase.jsp'");
			script.println("</script>");
		}
	}else if(ttt.equals("2")){
		result = tt.imgPath2(realJpg);	
		if(result == -1){
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('실패!')");

			script.println("history.back()");

			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미지가 정상적으로 추가되었습니다.')");
			script.println("localStorage.setItem('delete', 1);");
			script.println("location.href='category_picture.jsp'");
			script.println("</script>");
		}
	}else if(ttt.equals("3")){
		result = tt.imgPath3(realJpg);	
		if(result == -1){
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('실패!')");

			script.println("history.back()");

			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미지가 정상적으로 추가되었습니다.')");
			script.println("localStorage.setItem('delete', 1);");
			script.println("location.href='category_poem.jsp'");
			script.println("</script>");
		}
	}else if(ttt.equals("4")){
		result = tt.imgPath4(realJpg);
		if(result == -1){
			PrintWriter script = response.getWriter();

			script.println("<script>");

			script.println("alert('실패!')");

			script.println("history.back()");

			script.println("</script>");
		}else{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미지가 정상적으로 추가되었습니다.')");
			script.println("localStorage.setItem('delete', 1);");
			script.println("location.href='category_say.jsp'");
			script.println("</script>");
	}
	}
	
	
	
	

%>
</body>
</html>