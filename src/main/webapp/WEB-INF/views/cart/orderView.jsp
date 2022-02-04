<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!------ Include the above in your HEAD tag ---------->





<section id="ViewContainer">
    <div id="PayContainer">

        <span id="here"></span>

        <h1>주문상세보기</h1>
        <div id="ReviewOrder">
            <div class="TitleBar">주문 정보</div>
            <div class="ContentBox">
          		<c:forEach items="${orderView }" var="orderView" end="0">
          		<h2>주문일자 : ${orderView.date}</h2><br>
          		</c:forEach>
          		
          		
                <c:set var="sum" value="0"/>
                <c:forEach items="${orderView }" var="orderView">
                
                    <%--                    TODO 추가--%>
<%--                    <input type="hidden" id="itemsCount" value="${status.end}">--%>
                    <!-- 상품 하나 -->
                    <div class="OrderList">
                        <div class="OrderThum">

                            <div style="width:210px; height:120px; background:#eee;">
                                <img src="/resources/photo_upload/${orderView.thumbnail }" height="120px"/>
                            </div>
                        </div>
                        <div class="OrderInfo">
                            <h3>${orderView.product}</h3> 
                        </div>
                        <div class="OrderAmount">
                            ${orderView.amount } 개 / ￦ ${orderView.price }
                        </div>
                        <div class="OrderCost">
                            가격 <p>￦ <fmt:formatNumber value="${orderView.price * orderView.amount }"
                                                      pattern="#,###,###"/></p>


                        </div>

                        <div class="clear"></div>
                    </div>
                    <!-- 상품 하나 -->


                    <c:set var="sum" value="${sum + (orderView.price * orderView.amount)}"/>
                </c:forEach>
                
					

                <div class="semiCost">
                    <p class="productWord">상품가격 합계</p>
                    <P class="productCost">￦ <fmt:formatNumber value="${sum}" pattern="#,###,###"/></P>
                    <p class="deliveryWord">택배비</p>
                    <P class="deliveryCost">￦ 3,500 </P>
                </div>
                <div class="totalCostArea">
                    <p class="totalWord">총액</p>
                    <P class="totalCost">￦ <fmt:formatNumber value="${sum+3500}" pattern="#,###,###"/></P>
                </div>


            </div>
        </div>
        <br><br>
        


        <div class="orderViewInfo">
         
                        <div class="TitleBar">고객 정보</div>
                         <c:forEach items="${orderView }" var="orderView" end="0">
                         <div class="ContentBox">
 						<br>
 						<form role="fr" method="post" autocomplete="off">
 						<input type="hidden" id="n" name="n" value="${orderView.ono }"/>
                        <span class="info">  받는사람 <p>${orderView.receiver }</p></span>
                          <span class="tel">  연락처
						   <p>${orderView.receiver_tel }</p> </span> <br>
                             
                             <hr><br>
                            주소
                           <p> (${orderView.post_num })  ${orderView.addr1 } <br> ${orderView.addr2 }</p>
                            
                           <hr>
                           
                           <br> 남길 메시지
                           <p> ${orderView.memo }</p>
                            
                           <hr>
                           
                         <br>배송상태<br><br><br>

                          <c:choose>
                           <c:when test="${orderView.delivery==0 }">
                            <span class="del1"><h1 class="del"><i class="fas fa-box-open"></i></h1><br>상품준비중</span>
                           <span class="del2"><h1><i class="fas fa-truck-loading"></i></h1><br>배송시작</span>
                           <span class="del3"><h1><i class="fas fa-truck"></i></h1><br>배송중</span>
                           <span class="del4"><h1><i class="fas fa-home"></i></h1><br>배송완료</span>
                        
                            <br>
                           
                           </c:when>
                           <c:when test="${orderView.delivery==1 }">
                            <span class="del1"><h1><i class="fas fa-box-open"></i></h1><br>상품준비중</span>
                           <span class="del2"><h1 class="del"><i class="fas fa-truck-loading"></i></h1><br>배송시작</span>
                           <span class="del3"><h1><i class="fas fa-truck"></i></h1><br>배송중</span>
                           <span class="del4"><h1><i class="fas fa-home"></i></h1><br>배송완료</span>
                        
                            <br>
                           
                           </c:when>
                           <c:when test="${orderView.delivery==2 }">
                            <span class="del1"><h1><i class="fas fa-box-open"></i></h1><br>상품준비중</span>
                           <span class="del2"><h1><i class="fas fa-truck-loading"></i></h1><br>배송시작</span>
                           <span class="del3"><h1 class="del"><i class="fas fa-truck"></i></h1><br>배송중</span>
                           <span class="del4"><h1><i class="fas fa-home"></i></h1><br>배송완료</span>

                            <br></c:when>
                            
                              <c:when test="${orderView.delivery==3 }">
							 <span class="del1"><h1><i class="fas fa-box-open"></i></h1><br>상품준비중</span>
                           <span class="del2"><h1><i class="fas fa-truck-loading"></i></h1><br>배송시작</span>
                           <span class="del3"><h1><i class="fas fa-truck"></i></h1><br>배송중</span>
                           <span class="del4"><h1 class="del"><i class="fas fa-home"></i></h1><br>배송완료</span>
                        
                            <br></c:when>
 
                           </c:choose>
                           
                            
                           </form>
                            </div>
                            </c:forEach>
                            <div class="clear"></div>
							<br>
							
							
							
							
							<br><br>
                          
                            
                            
                            
                      
                        	
                    </div>

				
 						<center> <input type="button" id="modify_Btn" name="modify_Btn" value="주소지 수정"> </center>
                             
                            <script>
  							var formObj = $("form[role='fr']");
  
 								 $("#modify_Btn").click(function(){
  								 formObj.attr("action", "/cart/orderModify");
  								 formObj.attr("method", "get")
  								 formObj.submit();
 								 });

	 </script>
                      
                </div>
           
       
        <div class="clear"></div>

</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>