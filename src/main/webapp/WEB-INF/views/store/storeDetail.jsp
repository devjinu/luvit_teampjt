<%@page import="java.util.List"%>
<%@page import="com.luvit.domain.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


</head>
<body>
<br><br>
	<section id="ViewContainer">
	<div id="StoreDetailContainer">

		<form role="fr" method="post" autocomplete="off">
	<input type="hidden" id="no" name="no" value="${vo.s_pno }"/>
	</form>

	<div class="header_button">
	 <!-- 아이디 있으면서, 이름이랑 아이디랑 같은경우 -->
 <c:if test="${(id ne null && id eq vo.s_id)||(id eq 'admin')}">  
	 <button type="button" id="modify_Btn" value="수정">수정</button>
 	<button type="button" id="delete_Btn" value="삭제">삭제</button>
 </c:if>	
 <script>
  var formObj = $("form[role='fr']");
  
  $("#modify_Btn").click(function(){
   formObj.attr("action", "/store/storeModify");
   formObj.attr("method", "get")
   formObj.submit();
  });

  $("#delete_Btn").click(function(){    
	  var con = confirm("정말로 삭제하시겠습니까?");
	  if(con){
		   formObj.attr("action", "/store/storeDelete");
		   formObj.submit();
		  }
	  });
	 </script>
	 
	 </div>

	<div class="product">
	<div class="img"> 
	<span><img src="/resources/photo_upload/${vo.s_thumbnail }"></span><br>
	</div>
	
	<div class="infoTable">
	<div class="info">
	
	<p class="cate">
	<span>${vo.s_cate }</span></p>
	
	<p class="subject">
	<span>${vo.s_subject}</span></p><br>
	
	<p class="product">
	<span>${vo.s_product }</span></p><br>
	<hr>
	
	<p class="price"><label for="s_price"></label>
	<span><fmt:formatNumber value="${vo.s_price }" pattern="###,###,###"/> 원 </span></p><br>
	
	<hr>
	<%-- <p class="amount"><label for="s_amount">재고</label>
	<span><fmt:formatNumber value="${vo.s_amount }" pattern="###,###,###"/> 개</span></p><br> --%>
	
	<p class="option"><label for="s_option">옵션</label>
	  <select name="option">
	  <option value="">옵션을 선택하세요.</option>
	  <c:forTokens var="option" items="${vo.s_option }" delims=",">
	  <option>${option }</option> </c:forTokens>
	  </select></p>
	
	<p class="cartStock">
	<span>구매수량</span>
	<button type="button" class="minus">-</button>
	<input type="number" class="numBox" min="1" max="${vo.s_amount }" value="1" readonly="readonly" />
	<button type="button" class="plus">+</button>
	</p>
	
	<p class="cartStock"><span>배송비 3,500원</span></p>
	
	</div>

	<script>

	
	 $(".plus").click(function(){
		   var num = $(".numBox").val();
		   var plusNum = Number(num) + 1;
		   
		   if(plusNum >= ${vo.s_amount}) {
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

	</script>
	
	
	<br>

	<p class="addToCart">
	<input type="button" class="addCart_btn" value="장바구니"/>
	<input type="button" class="buy_btn" value="바로구매"/>
	</p>
	
	</div>
	
	<script>

	$(".addCart_btn").click(function(){
		   var c_pno = $("#no").val();
		   var c_amount = $(".numBox").val();

		   console.log("c_pno : "+ c_pno);
		   console.log("c_amount: "+c_amount);
		      
	   var data = {
			   c_pno : c_pno,
			   c_amount : c_amount
		     };
		   
		   $.ajax({
		    url : "/cart/addCart",
		    type : "post",
		    data : data,
		    success : function(result){

			    
				
			    if(result == 1){
				    alert("상품이 장바구니에 담겼습니다.");
					$(".numBox").val("1");
				
		    }else{
			    alert("회원만 사용할 수 있습니다.")
				$(".numBox").val("1");
			    }
		   },
		   
		    error : function(){
		     alert("카트 담기 실패");
		    }
    
		   }); 
		  });



	$(".buy_btn").click(function(){
		   var c_pno = $("#no").val();
		   var c_amount = $(".numBox").val();

		   console.log("c_pno : "+ c_pno);
		   console.log("c_amount: "+c_amount);
		      
	   var data = {
			   c_pno : c_pno,
			   c_amount : c_amount
		     };
		   
		   $.ajax({
		    url : "/cart/addCart",
		    type : "post",
		    data : data,
		    success : function(result){

			    
				
			    if(result == 1){
					$(".numBox").val("1");
					window.location.href = "/cart/payment";

		    }else{
			    alert("회원만 사용할 수 있습니다.")
				$(".numBox").val("1");
			    }
		   },
		   
		    error : function(){
		     alert("주문 실패");
		    }
 
		   }); 
		  });

	</script>
	
	<br><br><br><br><br><br>
	
		
	<div class="s_content">
	<p>DETAIL</p><br>
	<hr><br>
	</div>
	<div class="clear"></div>
	
	
	
	${vo.s_content }<br>
	


	</div>
	<br><br>
 
 


<a href = "/store_review/finsert?no=${vo.s_pno }"><input type="button" value="리뷰등록"/></a>
<a href = "/store_review/listPage?num=1&no=${vo.s_pno }"><input type="button" value="리뷰목록"/></a> 

 </div>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>