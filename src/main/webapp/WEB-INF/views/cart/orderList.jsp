<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>


<section id="ViewContainerGrey">
	<div id="PayContainer">
		<!-- 서브메뉴 -->
		<%@ include file="/WEB-INF/views/include/userSub.jsp" %>	
		<!-- 서브메뉴 -->
	
        <span id="here"></span>
	
		<h1>주문조회</h1>
		<div id="ReviewOrder">
			<div class="TitleBar">주문 정보</div>
			<div class="ContentBox">

			<div class="OrderList">
			
			 <c:choose>
			   <c:when test="${empty orderList}">
			   <br><br><br>
			   
			<center>
			<h1><i class="fas fa-exclamation-circle"></i></h1>
			<h2>${nickname } (${id }) 님 주문 내역이 없습니다!</h2>
			</center>
			   <br><br><br>
			   </c:when>
			</c:choose>
			
			<c:if test="${!empty orderList}">
			<h2>${nickname } (${id }) 님의 주문 목록</h2> <br>
    		  <c:forEach items="${orderList }" var="orderList">
				<div class="OrderList">
                        <div class="OrderThum">
 						<h2>${orderList.o_date}</h2><h4>${orderList.o_ono}</h4>
                            
                        </div>
                        <div class="OrderInfo">
                            <p>${orderList.o_receiver}</p>
                            (${orderList.o_post_num}) ${orderList.o_addr1} ${orderList.o_addr2}
                            <br>${orderList.o_receiver_tel}

                        </div>
                        
                         <div class="OrderCost">
                            주문금액 <p>￦ <fmt:formatNumber value="${orderList.o_sum}"
                                                      pattern="#,###,###"/></p>
                        </div>
                        
                        
                        <div class="OrderAmount">
                           <p> 
                           <c:choose>
                           <c:when test="${orderList.o_delivery==0 }">상품준비중</c:when>
                           <c:when test="${orderList.o_delivery==1 }">배송시작</c:when>
                           <c:when test="${orderList.o_delivery==2 }">배송중</c:when>
                           <c:when test="${orderList.o_delivery==3 }">배송완료</c:when>   
                           </c:choose>
                           </p>
                           
                           <input type="button" class="orderView_btn" value="주문상세보기" onclick="location.href='/cart/orderView?n=${orderList.o_ono}'">
                          
                           
                        </div>
                       
                        <div class="clear"></div>
                    </div>
				</c:forEach>
  			
	</c:if>
			</div>
		</div>
		</div>
		</div>
	
	
</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>