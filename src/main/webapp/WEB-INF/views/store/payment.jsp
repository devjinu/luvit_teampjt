<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!------ Include the above in your HEAD tag ---------->


<%-- incoming data --%>
<%--
상품 == 상품명,상품옵션,수량,가격 총합+ 택배비=> 총액
고객 정보 == 주문자명, 연락처, 받는사람, 받는사람 연락처, 우편번호, memo사항
결제 정보 == 결제 방식, 입금자명, 계좌번호

===>>>>>

상품 ==  s_product, s_option, s_amount, s_pricce+택배비=>o_sum (calc)
고객 정보 ==  o_payer(주문자명), o_tel, o_receiver(받는사람), o_tel, o_post_num, o_memo
결제 정보 == o_pay, o_payer, 계좌번호 (new column)
--%>


<%--
CART VO
	private int c_ono;
	private int c_pno;
	private String c_id;
	private Date date;
	private int c_amount;

	private int c_no;
	private String c_product;
	private int c_price;
	private String c_thumbnail;

--%>







<%-- output data--%>
<%--

카카오 데이터
pg : 'kakaopay',
pay_method : 'card',
merchant_uid : 'merchant_' + new Date().getTime(),
name : 'Luvit 상품 주문 내역',
amount : ${o_amount},
buyer_name : '${o_payer}',
buyer_tel : '${o_tel}',
buyer_addr : '${o_addr1}${o_addr2}${o_addr3}',
buyer_postcode : '${o_post_num}',
--%>






<section id="ViewContainer">
	<div id="PayContainer">
		<h1>결제하기</h1>
		<div id="ReviewOrder">
			<div class="TitleBar">주문 정보</div>
			<div class="ContentBox">
				<!-- 상품 하나 -->
				<div class="OrderList">
					<div class="OrderThum">
						<div style="width:210px; height:120px; background:#eee;"></div>
					</div>
					<div class="OrderInfo">
						<h3>vo 상품명</h3>
						<h4>vo 상품 옵션 : </h4>
					</div>
					<div class="OrderAmount">
						vo/di 수량 : <input type="number" min="1" max="100" value="1">
					</div>
					<div class="OrderCost">
						vo	가격 <p>￦10,0000</p>
					</div>
					<div class="clear"></div>
				</div>
				<!-- 상품 하나 -->
				
				<div class="semiCost">
					<p class="productWord">vo 상품가격 합계</p><P class="productCost">￦20,000</P>
					<p class="deliveryWord">vo 택배비</p><P class="deliveryCost">￦3,500</P>
				</div>
				<div class="totalCostArea">
					<p class="totalWord">vo 총액</p><P class="totalCost">￦3,500</P>
				</div>
			</div>
		</div>
		<form action="/store/paymentNext" method="post">
			<div id="CustomerArea">
				<div id="AddressArea">
					<div class="TitleBar">고객 정보</div>
					<div class="ContentBox">
						<h2>주소지 입력</h2>
						<p>vo 주문자명</p>
						<input type="text">
						<p>di 연락처</p>
						<input type="text">
						<p>di 받는사람</p>
						<input type="text">
						<p>di 받는사람 연락처</p>
						<input type="text">
						<p>우편번호</p>
						<input type="text" class="wdh80"><input type="button" value="찾기" class="postCodeBtn">
						<input type="text">
						<input type="text">
						<p>di 남길 메시지</p>
						<textarea rows="5" cols="77"></textarea>
					</div>
				</div>
				<div id="SecurePayment">
					<div class="TitleBar">결제 정보</div>
					<div class="ContentBox">
						<p>di 결제방식</p>
						<select id="paymentMethod">
							<option value="0">선택안함</option>
							<option value="1">무통장입금</option>
							<option value="2">카카오페이</option>
						</select>
						<p>di 입금자명</p>
						<input type="text" id="acc">
						<p>di 계좌번호</p>
						<input type="text" id="accNo">
						<input type="submit" value="결제하기">
					</div>
				</div>
			</div>
			<div class="clear"></div>
		</form>
	</div>
</section>
<script>
	$(document).ready(()=>{







		$('#paymentMethod').on('change',()=>{


			// 작동 1
			let type1=$('#paymentMethod option:selected').val();
			alert(type1);

			// 작동 2
			// let payment = document.querySelector('#paymentMethod');
			// let type2 = payment.options[payment.selectedIndex].text;
			// alert(type2);

			if (type1==1){
				$("#acc").attr("disabled",false);
				$("#accNo").attr("disabled",false);

			}

			if (type1==2){
				$("#acc").attr("disabled",true);
				$("#accNo").attr("disabled",true);

			}





			// var options = $('#paymentMethod').find('option').map(function() {
			// 	return $(this).val();
			// }).get()
		})
	})
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>