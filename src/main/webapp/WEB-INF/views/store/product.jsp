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

<style>
 div.product div.img { float:left; width:400px; }
 div.product div.img img { width:400px; height:auto; }
 
 div.product div.info { float:left; width:500px; font-size:16px; }
 div.product div.info p { margin:0 0 0 0; }
 div.product div.info p span { display:inline-block; width:100px; margin-right:15px; }
 div.product div.info p.Name {font-size: 25px;}
 
 div.product div.info p.cartStock input { text-align:center; font-size:22px; width:50px; padding:5px; margin:0; border:1px solid #eee; }
 div.product div.info p.cartStock button { font-size:26px; border:none; background:none; }
 div.product div.info p.addToCart { text-align:center; }
 div.product div.s_content { font-size:14px; clear:both; padding-top:30px; text-align: center;}
 
</style>
 
</head>
<body>
<br><br>
	<section id="ViewContainer">
	<div id="StoreListContainer">

	<form role="fr" method="post" autocomplete="off">
	<input type="hidden" name="no" value="${vo.s_pno }"/>
	</form>
	
	<div class="product">
	<div class="img"> 
	<span><img src="/resources/photo_upload/${vo.s_thumbnail }"></span><br>
	</div>
	
	<div class="info">
	
	<p class="Name">
	<span>${vo.s_product }</span></p><br>
	<hr>
	
	<p class="price"><label for="s_price">상품가격</label>
	<span><fmt:formatNumber value="${vo.s_price }" pattern="###,###,###"/> 원 </span></p><br>
	
	<p class="amount"><label for="s_amount">재고</label>
	<span><fmt:formatNumber value="${vo.s_amount }" pattern="###,###,###"/> 개</span></p><br>
	
	<p class="option"><label for="s_option">상품옵션</label>
	<span>${vo.s_option }</span></p><br>
	
	<p class="cartStock">
	<label for="s_cartAmount">구매수량</label>
	<span><input type="number" min="1" max="${vo.s_amount }" value="1"/></span><br>
	</p>
	<hr><hr><br><br>	

	<p class="addToCart">
	<input type="button" class="btn btn-warning" value="장바구니"/>
	<input type="button" class="btn btn-warning" value="바로구매"/>
	</p>
	
	</div>
	
	<br><br><br><br><br><br><br><br><br><br>
	
	<div class="s_content">
	<span>${vo.s_content }</span><br>
	
	
	
	</div>

	</div>
	<br><br>
 <input type="button" id="modify_Btn" class="btn btn-warning" value="수정"/>
 <input type="button" id="delete_Btn" class="btn btn-danger" value="삭제"/>
 
 <script>
  var formObj = $("form[role='fr']");
  
  $("#modify_Btn").click(function(){
   formObj.attr("action", "/store/modify");
   formObj.attr("method", "get")
   formObj.submit();
  });

  $("#delete_Btn").click(function(){    
	  var con = confirm("정말로 삭제하시겠습니까?");
	   formObj.attr("action", "/store/delete");
	   formObj.submit();
	  });
	 </script>
	 




 </div>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>