<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>

	<section id="ViewContainer">
	<div id="CartListContainer">
	<br><br>
	<h1>장바구니</h1>
	
	<section id="content">
  <ul>
 <li>
  <div class="allCheck">
   <input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label> 
 
  <script>
$("#allCheck").click(function(){
 var chk = $("#allCheck").prop("checked");
 if(chk) {
  $(".chBox").prop("checked", true);
 } else {
  $(".chBox").prop("checked", false);
 }
});
</script>
  
  </div>
 
  <div class="delBtn">
  
   
   <button type="button" class="selectDelete_btn">선택 삭제</button> 
   
 			  <script>
			 $(".selectDelete_btn").click(function(){
 			 var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  			if(confirm_val) {
  			 var checkArr = [];
   
  			 $("input[class='chBox']:checked").each(function(){
  			  checkArr.push($(this).attr("data-cartNum"));
  			 });
    
  			 $.ajax({
  			  url : "/cart/cartDelete",
 			   type : "post",
  			  data : { chbox : checkArr },
  			  success : function(result){

  		      if(result==1){
  		      	location.href = "/cart/cartList";
    	    	}else {
            	alert("삭제 실패")
            	}   
 			   }
			   });
			  } 
			 });
			</script>


  </div>
  
 </li>
	<form action="payment" method="post">
      <c:set var="sum" value="0" />
      <c:forEach items="${cartList }" var="cartList">
      
       <li>
       <div class="thumbnail_box">
       <div class="checkBox">
   <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.c_ono}" />
   <input type="hidden" name="id" class="id" value="${cartList.c_id }" />
   <input type="hidden" name="no" class="no" value="${cartList.c_ono }" />
 		  <script>
			${".chBox"}.click(function(){
				$("#allCheck").prop("checked", false);
				});
		   </script>
  	   </div>
		
		<div class="thumb">
		<img src="/resources/photo_upload/${cartList.c_thumbnail }"/></div>
			  
			  
		<div calss="info">
			 
			 
			 
			<div class="product"> <p>${cartList.c_product}</p></div>
			<div class="amount"> <p><span>수량 </span>${cartList.c_amount} 개 </p></div><br>
			<div class="price"> <p><fmt:formatNumber value="${cartList.c_price }" pattern="###,###,###"/> 원</p></div><br>
			 <p>총 금액 <fmt:formatNumber value="${cartList.c_price*cartList.c_amount }" pattern="###,###,###"/> 원</p><br>
			  
        </div>
        
        	<br><br>
        	  <div class="delete">
        	  	<button type="button" class="delete_${cartList.c_ono}_btn" data-cartNum="${cartList.c_ono}">삭제</button>
        	  	
        	  	</div>
        	  	
        	  	<script>
 				$(".delete_${cartList.c_ono}_btn").click(function(){
 				 var confirm_val = confirm("정말 삭제하시겠습니까?");
  
 				 if(confirm_val) {
 				  var checkArr = [];
   
 				  checkArr.push($(this).attr("data-cartNum"));
              
  				 $.ajax({
  				  url : "/cart/cartDelete",
   				 type : "post",
   				 data : { chbox : checkArr },
  				  success : function(result){
  				   if(result == 1) {            
  				    location.href = "/cart/cartList";
  				   } else {
  				    alert("삭제 실패"); 
  				   }
 				   }
  				 });
 				 } 
				 });
				</script>
        	  	
        	  </div>
        </li>
        <c:set var="sum" value="${sum + (cartList.c_price * cartList.c_amount)}" />
  		</c:forEach>
		</ul>
   
     

	        <br><br><br>
	        
	        <div class="cart">
	            장바구니 금액 합계 : <fmt:formatNumber value="${sum}"  pattern="#,###,###" /> 원<br>
	            배송료 : <fmt:formatNumber var="del" value="2500" pattern="#,###,###" /> 2,500 원<br>
	            총합계 : <fmt:formatNumber value="${sum+2500}" pattern="#,###,###" /> 원
	        </div>       
	                
	                <br><br><br>
	  </section>
   
  <input type="submit" class="payment_btn" value="구매하기"/>
   <a href="../store/storeList?num=1"><input type="button" value="계속 쇼핑하기"/></a>
	
<!-- <script>

	$(".payment_btn").click(function(){

		   var o_ono = $("#no").val();
		   var o_oid = $("#id").val();

		   console.log("o_ono: "+o_ono);
		   console.log("o_oid: "+o_oid);

	   var data = {
			   o_ono : o_ono,
			   o_oid : o_oid
		     };
		   
		   $.ajax({
		    url : "/store/payment",
		    type : "post",
		    data : data,
		    success : function(result){

			    
				
			    if(result == 1){
				    alert("결제화면 이동 성공");

		    }else{
			    alert("회원만 사용할 수 있습니다.");
			    }
		   },
		   
		    error : function(){
		     alert("결제화면 이동 실패");
		    }
    
		   }); 
		  });


	</script> -->
   </form>
     </div>
      	
	</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>