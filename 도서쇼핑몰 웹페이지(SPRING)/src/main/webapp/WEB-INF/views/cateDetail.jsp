<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome EZEN STORE</title>
<link rel="stylesheet" href="resources/css/cate.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous">
</script>

</head>
<body>
	<%@include file="includes/header.jsp"%>

	<div style="margin-left: 150px; margin-right: 150px;">
		<div class="goods" style="margin-top: 30px;">
			<h2>상품 상세</h2>
			<div class="goodsImg"
				style="margin-bottom: 30px; margin-left: 50px; padding: 10px">
				<img id="image"
					src="/upload/${list.uploadPath}/${list.uuid}_${list.fileName}">
			</div>

			<div class="goodsInfo" style="margin-top: 40px; padding: 10px">


				<p class="gdsName">
					<span style="width: 80px; margin-right: 5px;">도서명 : </span>${list.bookName}</p>
				<input id="bookId" type="hidden" value="${list.bookId} ">

				<p class="cateName">
					<span style="width: 60px; margin-right: 5px;">작가 : </span>${list.authorName}</p>

				<p class="gdsPrice">
					<span style="width: 60px; margin-right: 5px;">가격 : </span>
					<fmt:formatNumber pattern="###,###,###" value="${list.bookPrice}" />
					원
				</p>

				<p class="gdsStock">
					<span style="width: 60px; margin-right: 5px;">재고 :</span>
					<fmt:formatNumber pattern="###,###,###" value="${list.bookStock}" />
					EA
				</p>
                  <c:if test="${list.bookStock !=0}">
				<p class="cartStock">
					<span style="width: 110px; margin-right: 5px;">구입 수량 : </span>
					<button type="button" class="minus">-</button>
					<input type="number" class="numBox" min="1" max="${list.bookStock}"
						value="1" readonly="readonly" />

					<button type="button" class="plus">+</button>
				</p>

				<p class="addToCart" style="text-align: center;">
					<button type="button" class="cart_btn">카트에 담기</button>
					<button type="button" class="cart_btn2">즉시 구매하기</button>
				</p>
				</c:if>
				<c:if test="${list.bookStock==0 }">
				     <p>상품 수량이 부족합니다.</p>  
				       </c:if>
			</div>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>

	<script>
	
   
		/* gnb_area 로그아웃 버튼 작동 */
		$("#gnb_logout_button").click(function() {
			//alert("버튼 작동");
			$.ajax({
				type : "POST",
				url : "/member/logout.do",
				success : function(data) {
					alert("로그아웃 성공");
					document.location.reload();
				}
			}); // ajax 
		});
		
		$(".plus").click(function(){
            var num = $(".numBox").val();
            var plusNum = Number(num) + 1;
            
            if(plusNum > ${list.bookStock}) {
             $(".numBox").val(num);
            } else {
             $(".numBox").val(plusNum);          
            }
           });
           
           $(".minus").click(function(){
            var num = $(".numBox").val();
            var minusNum = Number(num) - 1;
            
            if(minusNum <= 0) {
             $(".numBox").val(num);
            } else {
             $(".numBox").val(minusNum);          
            }
           });
			//장바구니 담기
	            $(".cart_btn").click(function(){
	                  
	                  var cartid=${list2.cartid}+1;
	                  var bookId = $("#bookId").val();
	                  var cartStock = $(".numBox").val();
	                  var  uuid= $("#image").attr("src");
	                 
	               if(cartid == 1){
	                  cartid=1;
	               }else{
	                  cartid=${list2.cartid}+1;
	               }
	               
	                  
	                  
	                 console.log(cartid);
	                  var data = {
	                  cartid : cartid,
	                    bookId : bookId,
	                    cartStock : cartStock,
	                 uuid:uuid
	                    };
	                  $.ajax({
	                      url : "/cateDetail/addCart",
	                      type : "post",
	                      data : data,
	                      success : function(result){
	                       alert("카트 담기 성공");
	                       $(".numBox").val("1");
	                      },
	                      error : function(){
	                       alert("카트 담기 실패");
	                       console.log(bookId);
	                       console.log(cartStock);
	                       console.log(uuid);
	                      }
	                     });
	                  
	                  location.href = "cateDetail?bookId=" + ${list.bookId};
	                    });
	                  
			
	            //즉시구매
	               $(".cart_btn2").click(function(){
	                     
	                     var cartid=${list2.cartid}+1;
	                     var bookId = $("#bookId").val();
	                     var cartStock = $(".numBox").val();
	                     var  uuid= $("#image").attr("src");
	                    
	                  if(cartid == 1){
	                     cartid=1;
	                  }else{
	                     cartid=${list2.cartid}+1;
	                  }
	                  
	                    console.log(cartid);
	                     var data = {
	                     cartid : cartid,
	                       bookId : bookId,
	                       cartStock : cartStock,
	                    uuid:uuid
	                       };
	                     $.ajax({
	                         url : "/cateDetail/addCart",
	                         type : "post",
	                         data : data,
	                         success : function(result){
	                         
	                          $(".numBox").val("1");
	                         },
	                         error : function(){
	                          alert("카트 담기 실패");
	                          console.log(bookId);
	                          console.log(cartStock);
	                          console.log(uuid);
	                         }
	                        });
	                     
	                     location.href = "/cart";
	                 
	                       });
						
	</script>
</body>
</html>