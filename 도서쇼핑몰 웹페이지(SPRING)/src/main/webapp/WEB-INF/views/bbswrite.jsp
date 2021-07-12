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
<link rel="stylesheet" href="resources/css/bbswrite.css">
<script src="https://code.jquery.com/jquery-3.4.1.js">
	integrity = "sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin = "anonymous"
</script>
</head>
<body>
	<%@include file="includes/header.jsp"%>
	<div class="bbs_area">
		<div class="bbs_div">
			<div id="wrap">
				<h2>게시글 작성</h2>
				<br>
				<form role="form" id="writeForm" method="post"
					action="${path}/bbswrite">
					<table>
						<tr>
							<th>작성자</th>
							<td><input class="form-control" id="writer" name="writer"
								value="${member.memberId}" style="width: 646px;" readonly></td>
						</tr>
						<tr>
							<th>제목 *</th>
							<td><input class="form-control" id="title" name="title"
								placeholder="제목을 입력해주세요" style="width: 646px;"
								required="required"></td>
						</tr>
						<tr>
							<th>내용</th>
							<td><textarea cols="100" rows="30" name="content"
									required="required" style="width: 646px;"></textarea></td>
						</tr>
						<tr>
							<th>파일 추가</th>
							<td id="uploadResult"><input type="file" id="fileItem"
								name='uploadFile' style="height: 30px;"></td>
						</tr>
					</table>
					<button onclick="location.href='${path}/bbs'" type="button"
						class="btn btn-primary">
						<i class="fa fa-list"></i> 목록
					</button>

					<button type="reset" class="btn btn-warning">
						<i class="fa fa-reply"></i> 초기화
					</button>
					<button type="submit" class="btn btn-success">
						<i class="fa fa-save"></i> 저장
					</button>
				</form>
				<script type="text/javascript">
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e) {

			/* 이미지 존재시 삭제 */
			if ($(".imgDeleteBtn").length > 0) {
				deleteFile();
			}

			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];

			if (!fileCheck(fileObj.name, fileObj.size)) {
				return false;
			}

			formData.append("uploadFile", fileObj);

			$.ajax({
				url : '/buploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'POST',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadImage(result);
				},
				error : function(result) {
					alert("이미지 파일이 아닙니다.");
				}
			});

		});
		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	

		function fileCheck(fileName, fileSize) {
			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;

		}
		/* 이미지 출력 */
		function showUploadImage(uploadResultArr) {

			/* 전달받은 데이터 검증 */
			if (!uploadResultArr || uploadResultArr.length == 0) {
				return
			}

			let uploadResult = $("#uploadResult");

			let obj = uploadResultArr[0];

			let str = "";

			let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g,
					'/')
					+ "/s_" + obj.uuid + "_" + obj.fileName);
			//replace 적용 하지 않아도 가능
			//let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);

			str += "<div id='result_card'>";
			str += "<img src='/bdisplay?fileName=" + fileCallPath + "'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>❌<div>";
			str += "<input type='hidden' name='bimageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='bimageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='bimageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";

			uploadResult.append(str);

		}
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e) {

			deleteFile();

		});

		/* 파일 삭제 메서드 */
		function deleteFile() {

			let targetFile = $(".imgDeleteBtn").data("file");

			let targetDiv = $("#result_card");

			$.ajax({
				url : '/bdeleteFile',
				data : {
					fileName : targetFile
				},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					console.log(result);

					targetDiv.remove();
					$("input[type='file']").val("");

				},
				error : function(result) {
					console.log(result);

					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
		
		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					location.href = '/bbs'
				}
			}); // ajax 
		});
	</script>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>