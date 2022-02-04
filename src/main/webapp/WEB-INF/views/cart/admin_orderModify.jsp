<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!------ Include the above in your HEAD tag ---------->





<section id="ViewContainer">
    <div id="PayContainer">

        <span id="here"></span>

        <h1>주문 정보 수정</h1>
        <div id="ReviewOrder">
           


		<form action="/cart/orderModify" method="post">
		
        <div class="orderInfo_">
                <div id="ReviewOrder">
 				<div class="TitleBar">고객 정보</div>
					<div class="ContentBox">
					<input type="hidden" name="o_ono" id="o_ono" value="${vo.o_ono }"/>
						<h2>주소지 입력</h2>
						<p>주문자</p>
						<input type="text" value="${nickname }(${id })" readonly="readonly">
						<p>받는사람</p>
						<input type="text" name="o_receiver" value="${vo.o_receiver }">
						<p>연락처</p>
						<input type="text" name="o_receiver_tel" value="${vo.o_receiver_tel }">
						<p>우편번호</p>
						<input type="text" name="o_post_num" value="${vo.o_post_num }"><input type="button" value="찾기" class="postCodeBtn">
						<input type="text" name="o_addr1" value="${vo.o_addr1 }">
						<input type="text" name="o_o_addr2" value="${vo.o_addr2 }">
						<p>남길 메시지</p>
						<textarea rows="5" cols="77" name="o_memo">${vo.o_memo }</textarea>
                    
                    
                    <c:if test="${id eq 'admin' }">     
                          <p> 배송상태 <p>
                          <select name="o_delivery">
							  <option value="0">상품준비중</option>
							  <option value="1">배송시작</option>
							  <option value="2">배송중</option>
							  <option value="3">배송완료</option>
	  							
	 							 </select><br>
                          <p> <c:choose>
                           <c:when test="${o_delivery==0 }"> 상품준비중 <b>- 배송시작 - 배송중 - 배송완료</b></c:when>
                           <c:when test="${o_delivery==1 }"><b>상품준비중 - </b>배송시작 <b>- 배송중 - 배송완료</b></c:when>
                           <c:when test="${o_delivery==2 }"><b>상품준비중 - 배송시작 -</b> 배송중 <b>- 배송완료</b></c:when>
                           <c:when test="${o_delivery==3 }"><b>상품준비중 - 배송시작 - 배송중 - </b>배송완료</c:when>   
                           </c:choose></p>
                         </c:if>  
                            </div>
                          
                            <input type="submit" name="modify_btn" value="수정" onclick="location.href='/cart/orderView?n=${vo.o_ono}'">  
                            <input type="button" name="modify_btn" value="취소" onclick="location.href='/cart/orderView?n=${vo.o_ono}'"> 
                           
                        </div>
                        	 
                    </div>

				</form> 

                      
                </div>
                </div>
           
       
        <div class="clear"></div>

</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>