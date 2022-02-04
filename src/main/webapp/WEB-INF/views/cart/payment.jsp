<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

        <%--        <script id="entry" type="text/x-handlebars-template">--%>
        <%--            {{#person}}--%>
        <%--                <h1>{{name}}</h1>--%>
        <%--            {{/person}}--%>
        <%--        </script>--%>

        <span id="here"></span>

        <h1>장바구니</h1>
        
        
       
        
        <div id="ReviewOrder">
            <div class="TitleBar">주문 정보</div>
            <div class="ContentBox">
 			
 			
 			 <c:choose>
			   <c:when test="${empty cartList}">
			  
			  <br><br><br>
			  
			  <center> 
			  <h1><i class="fas fa-exclamation-circle"></i></h1>
			  <h2>장바구니에 담긴 상품이 없습니다!</h2> </center><br><br><br>
			  <center><input type="button" value="상품보기" onclick="location.href='../store/storeList?num=1'"/></center>
			  
			   </c:when>
			  </c:choose>

			  <c:if test="${!empty cartList }">
			  
                <div class="allCheck">
                    <input type="checkbox" name="allCheck" id="allCheck"/><label for="allCheck">모두 선택</label>

                    <script>
                        $("#allCheck").click(function () {
                            var chk = $("#allCheck").prop("checked");
                            if (chk) {
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
                        $(".selectDelete_btn").click(function () {
                            var confirm_val = confirm("정말 삭제하시겠습니까?");

                            if (confirm_val) {
                                var checkArr = [];

                                $("input[class='chBox']:checked").each(function () {
                                    checkArr.push($(this).attr("data-cartNum"));
                                });

                                $.ajax({
                                    url: "/cart/cartDelete",
                                    type: "post",
                                    data: {chbox: checkArr},
                                    success: function (result) {

                                        if (result == 1) {
                                            location.href = "/cart/payment";
                                        } else {
                                            alert("삭제 실패")
                                        }
                                    }
                                });
                            }
                        });
                    </script>


                </div>
                
               
                
                
                <c:set var="sum" value="0"/>
                <c:forEach items="${cartList }" var="cartList">
                
              
              
                
                    <%--                    TODO 추가--%>
                    <input type="hidden" id="itemsCount" value="${status.end}">
                    <!-- 상품 하나 -->
                    <div class="OrderList">
                        <div class="OrderThum">

                            <div class="checkBox">
                                <input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.c_ono}"/>
                                <input type="hidden" name="id" class="id" value="${cartList.c_id }"/>
                                <input type="hidden" name="no" class="no" value="${cartList.c_ono }"/>
                                <script>
                                    ${".chBox"}.click(function () {
                                        $("#allCheck").prop("checked", false);
                                    });
                                </script>
                            </div>

                            <div style="width:210px; height:120px; background:#eee;">
                                <img src="/resources/photo_upload/${cartList.c_thumbnail }" height="120px"/>
                            </div>
                        </div>
                        <div class="OrderInfo">
                            <h3>${cartList.c_product}</h3>
                            <h4>상품 옵션 : ${cartList.c_option }</h4>
                        </div>
                        <div class="OrderAmount">
                            수량 :  <p>${cartList.c_amount} 개 / <fmt:formatNumber value="${cartList.c_price }" 
                                                      pattern="#,###,###"/> 원 </p>
                        </div>
                        <div class="OrderCost">
                            가격 <p>￦ <fmt:formatNumber value="${cartList.c_price * cartList.c_amount }"
                                                      pattern="#,###,###"/></p>


                        </div>

                        <div class="clear"></div>
                    </div>
                    <!-- 상품 하나 -->


                    <c:set var="sum" value="${sum + (cartList.c_price * cartList.c_amount)}"/>
                </c:forEach>


                <div class="semiCost">
                    <p class="productWord">상품가격 합계</p>
                    <P class="productCost">￦ <fmt:formatNumber value="${sum}" pattern="#,###,###"/></P>
                    <p class="deliveryWord">택배비</p>
                    <P class="deliveryCost">￦ 3,500 </P>
                </div>
                <div class="totalCostArea">
                    <p class="totalWord">총액</p>
                    <P id="totalCost" class="totalCost">￦ <fmt:formatNumber value="${sum+3500}"
                                                                            pattern="#,###,###"/></P>
                </div>

 
            </div>
        <br><br>
        <div class="orderButton">
       <input type="button" class="orderOpne_bnt" value="주문하기"/>
        <script>
            $(".orderOpne_bnt").click(function () {
                $(".orderInfo").slideDown();
                $(".orderOpne_bnt").slideUp();
            });
        </script>

		</div>
		
        <div class="orderInfo">
            <form id="fr" role="form" method="post" onsubmit='return check();'>

                <div id="CustomerArea">
                    <div id="AddressArea">
                        <div class="TitleBar">고객 정보</div>

                        <div class="ContentBox">
                            <input type="hidden" id="o_sum" name="o_sum" value="${sum+3500 }">
                            <h2>구매자</h2>
                            <p>이름</p>
                            <input type="text" id="o_orderer" name="o_orderer" placeholder="* 구매자 이름을 입력해주세요.">
                            <p>연락처</p>
                            <input type="text" id="o_tel" name="o_tel" maxlength="13" placeholder="* 구매자 정보를 입력해주세요."><br>
                            <h2>받는 사람</h2>
                            <p>이름</p>
                            <input type="text" id="o_receiver" name="o_receiver" placeholder="* 수령인 이름을 입력해주세요.">
                            <p>연락처</p>
                            <input type="text" id="o_receiver_tel" maxlength="13" name="o_receiver_tel" placeholder="* 수령인 연락처를 입력해주세요.">
                            <p>우편번호</p>
                            <input type="text" class="wdh80" id="o_post_num" name="o_post_num" readonly="readonly">
                            <input type="button" value="찾기" class="postCodeBtn" onclick="searchMap();">
                            <input type="text" id="o_addr1" name="o_addr1" readonly="readonly" placeholder="* 배송 받을 장소를 입력해주세요.">
                            <input type="text" id="o_addr2" name="o_addr2" placeholder="* 나머지 주소">
                            <input type="hidden" id="o_addr3" name="o_addr3">
                            <p>남길 메시지</p>
                            <textarea rows="5" cols="77" id="o_memo" name="o_memo"></textarea>
                        </div>
                    </div>


                    <div id="SecurePayment">
                        <div class="TitleBar">결제 정보</div>
                        <div class="ContentBox">
                            <p>결제방식</p>
                            <select id="paymentMethod" name="o_pay">
                                <option value="0">선택안함</option>
                                <option value="1">무통장입금</option>
                                <option value="2">카카오페이</option>
                            </select>
                            <%--                            <p>입금자명</p>--%>
                            <%--                            <input type="text" id="o_payer" name="o_payer">--%>
                            <p>입금자</p>
                            <input type="text" id="o_payer" name="o_payer">
						    <input type="submit" id="order_btn" class="order_btn" value="결제">
                            <input type="button" id="kakao" class="kakao" value="카카오결제">
                            <input type="button" class="cancel_btn" value="취소">
                            

                            <%--                            test--%>


</div>
                            <script>
                                $(".cancel_btn").click(function () {
                                    $(".orderInfo").slideUp();
                                    $(".orderOpne_bnt").slideDown();
                                });
                                // 연락처 자동 하이픈 생성
                                var autoHypenPhone = function(str){
                                    str = str.replace(/[^0-9]/g, '');
                                    var tmp = '';
                                    if( str.length < 4){
                                        return str;
                                    }else if(str.length < 7){
                                        tmp += str.substr(0, 3);
                                        tmp += '-';
                                        tmp += str.substr(3);
                                        return tmp;
                                    }else if(str.length < 11){
                                        tmp += str.substr(0, 3);
                                        tmp += '-';
                                        tmp += str.substr(3, 3);
                                        tmp += '-';
                                        tmp += str.substr(6);
                                        return tmp;
                                    }else{              
                                        tmp += str.substr(0, 3);
                                        tmp += '-';
                                        tmp += str.substr(3, 4);
                                        tmp += '-';
                                        tmp += str.substr(7);
                                        return tmp;
                                    }
                                
                                    return str;
                              }


                              var o_tel = document.getElementById('o_tel');
                              var o_receiver_tel = document.getElementById('o_receiver_tel');
                              o_tel.onkeyup = function(){
                                console.log(this.value);
                                this.value = autoHypenPhone( this.value ) ;  
                              }
                              o_receiver_tel.onkeyup = function(){
                                  console.log(this.value);
                                  this.value = autoHypenPhone( this.value ) ;  
                              }
                           // 연락처 자동 하이픈 생성
                           // 유효성 체크
                             function check(){
                           
                            	 if($("#o_orderer").val() == ""){
         				            alert("구매자 이름을 입력하시오!"); 
         				            $("#o_orderer").focus(); 
         				            return false; 
         				          }
                            	 if($("#o_tel").val() == ""){
            				            alert("구매자 연락처를 입력하시오!"); 
            				            $("#o_tel").focus(); 
            				            return false; 
            				      }
                            	 if($("#o_receiver").val() == ""){
          				            alert("수령인 이름을 입력하시오!"); 
          				            $("#o_receiver").focus(); 
          				            return false; 
          				          }
                            	 if($("#o_receiver_tel").val() == ""){
          				            alert("수령인 연락처를 입력하시오!"); 
          				            $("#o_receiver_tel").focus(); 
          				            return false; 
          				          }
                            	 if($("#o_post_num").val() == ""){
           				            alert("우편번호를 입력하시오!"); 
           				            $("#o_post_num").focus(); 
           				            return false; 
           				          }
                            	 if($("#o_addr2").val() == ""){
            				            alert("나머지 주소를 입력하시오!"); 
            				            $("#o_addr2").focus(); 
            				            return false; 
            				 	 }

                            	 if($("select[name=o_pay] option:selected").val() == 1){
	                            	if($("#o_payer").val() == ""){
	           				            alert("입금자를 입력하시오!"); 
	           				            $("#o_payer").focus(); 
	           				            return false; 
	           				           }
                            	 }
                            	 
                             } 

                            </script>
</div>
                        </div>
                         </form>
                    </div>
                   
                </div>
                
            
        </div>
        <div class="clear"></div>


    </c:if>


</section>

<%--TODO validation--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


    $("#o_payer").attr("disabled", true);
    $("#o_account_num").attr("disabled", true);
    $('.order_btn').hide();
    $('#kakao').hide();

    $('#paymentMethod').on('change', () => {
        // 작동 1
        let type1 = $('#paymentMethod option:selected').val();
        // alert(type1);
        // 작동 2
        // let payment = document.querySelector('#paymentMethod');
        // let type2 = payment.options[payment.selectedIndex].text;
        // alert(type2);


        if (type1 == 0) {
            $('#order_btn').attr("disabled", true);
            $('#kakao').attr("disabled", true);
            $("#o_payer").attr("disabled", true);
            $("#o_account_num").attr("disabled", true);
            $('#kakao').hide();
            $('.order_btn').hide();
        }
        if (type1 == 1) {
            $("#o_payer").attr("disabled", false);
            $("#o_account_num").attr("disabled", false);
            $('.order_btn').attr("disabled", false);
            $('.order_btn').show();
            $('#kakao').attr("disabled", true);
            $('#kakao').hide();
        }
        if (type1 == 2) {
            $("#o_payer").attr("disabled", true);
            $("#o_account_num").attr("disabled", true);
            $('.order_btn').attr("disabled", true);
            $('.order_btn').hide();
            $('#kakao').attr("disabled", false);
            $('#kakao').show();
        }
        // var options = $('#paymentMethod').find('option').map(function() {
        // 	return $(this).val();
        // }).get()

    });

    // TODO 일반 결제
    //     document.getElementById("order_btn").valueOf().submit();

    // $('#order_btn').on('click',()=>{
    //
    //
    // })
    <%--TODO 지도--%>


    function searchMap() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("o_addr3").value = extraAddr;
                } else {
                    document.getElementById("o_addr3").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("o_post_num").value = data.zonecode;
                document.getElementById("o_addr1").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("o_addr2").focus();
            }
        }).open();
    }
</script>


<script>
    <%--TODO kakao--%>




    <%--function refreshVal() {--%>
    <%--    orderer = document.getElementById("o_orderer").value;--%>
    <%--    o_tel = document.getElementById("o_tel").value;--%>
    <%--    cost = "${sum+3500}";--%>
    <%--    receiver = document.getElementById("o_receiver").value;--%>
    <%--    tel = document.getElementById("o_receiver_tel").value;--%>
    <%--    zipcode = document.getElementById("o_post_num").value;--%>
    <%--    o_addr = $("#o_addr1").val() + $("#o_addr2").val();--%>
    <%--    memo = document.getElementById("o_memo").value;--%>
    <%--    payer = document.getElementById("o_payer").value;--%>
    <%--    accountNum = document.getElementById("o_account_num").value;--%>
    <%--}--%>

    // TODO  recursively looping function by interval => readability


    var orderer;
    var o_tel;
    var cost;
    var receiver;
    var tel;
    var zipcode;
    var o_addr;
    var memo;
    var payer;
    var accountNum;


    var fr = document.getElementById("fr");

    $('.orderOpne_bnt').on('click', () => {
        orderer = document.getElementById("o_orderer").value;
        o_tel = document.getElementById("o_tel").value;
        cost = "${sum+3500}";
        receiver = document.getElementById("o_receiver").value;
        tel = document.getElementById("o_receiver_tel").value;
        zipcode = document.getElementById("o_post_num").value;
        o_addr = $("#o_addr1").val() + $("#o_addr2").val();
        memo = document.getElementById("o_memo").value;
        payer = document.getElementById("o_payer").value;
        accountNum = document.getElementById("o_account_num").value;
        fr.addEventListener('change', () => {
            orderer = document.getElementById("o_orderer").value;
            o_tel = document.getElementById("o_tel").value;
            cost = "${sum+3500}";
            receiver = document.getElementById("o_receiver").value;
            tel = document.getElementById("o_receiver_tel").value;
            zipcode = document.getElementById("o_post_num").value;
            o_addr = $("#o_addr1").val() + $("#o_addr2").val();
            memo = document.getElementById("o_memo").value;
            payer = document.getElementById("o_payer").value;
            accountNum = document.getElementById("o_account_num").value;
            $('#paymentMethod').on('change', () => {
                orderer = document.getElementById("o_orderer").value;
                o_tel = document.getElementById("o_tel").value;
                cost = "${sum+3500}";
                receiver = document.getElementById("o_receiver").value;
                tel = document.getElementById("o_receiver_tel").value;
                zipcode = document.getElementById("o_post_num").value;
                o_addr = $("#o_addr1").val() + $("#o_addr2").val();
                memo = document.getElementById("o_memo").value;
                payer = document.getElementById("o_payer").value;
                accountNum = document.getElementById("o_account_num").value;
                $('#o_account_num').on('change', () => {


                    // TODO 만약 폼태그안에 데이터를 JSON으로 직렬화시 $('form[name=xxxx]').serialize();


                    //카카오 receive info
                    // var cost = document.getElementById("totalCost").value;
                    orderer = document.getElementById("o_orderer").value;
                    o_tel = document.getElementById("o_tel").value;
                    cost = "${sum+3500}";
                    receiver = document.getElementById("o_receiver").value;
                    tel = document.getElementById("o_receiver_tel").value;
                    zipcode = document.getElementById("o_post_num").value;
                    o_addr = $("#o_addr1").val() + $("#o_addr2").val();
                    memo = document.getElementById("o_memo").value;
                    payer = document.getElementById("o_payer").value;
                    accountNum = document.getElementById("o_account_num").value;
                    // var cost = $('#totalCost').val();
                    // var receiver=$('#o_receiver').text();
                    // var tel=$("#o_receiver_tel").text();
                    // var zipcode=$("#o_post_num").text();


                    //카카오 endtodo


                    $('.test').on('click', () => {
                        console.log(orderer);
                        console.log(o_tel);
                        console.log(o_addr);
                        console.log(cost);
                        console.log(receiver);
                        console.log(tel);
                        console.log(zipcode);
                        console.log(memo);
                        console.log(payer);
                        console.log(accountNum);

                        // console.log(cost);
                        <%--console.log("${sum+3500}");--%>
                    })

                });
            });
        });
    });
    /* . -> class , # -> id */
    $("#kakao").on('click', function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp22213129'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;

        IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'Luvit 상품 주문 내역',
            amount: cost,/* 상품 가격 */
            buyer_name: receiver,
            buyer_tel: tel,
            buyer_addr: o_addr,
            buyer_postcode: zipcode,
        }, function (rsp) {
            if (rsp.success) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/order/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid: rsp.imp_uid,
                        kakaoResult: 1
                        //기타 필요한 데이터가 있으면 추가 전달
                    }
                }).done(function (data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if (everythings_fine) {
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\결제 금액 : ' + rsp.paid_amount;
                        msg += '카드 승인번호 : ' + rsp.apply_num;
                        alert(msg);
                    } else {
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    }
                });


                <%--$.ajax({--%>
                <%--    url: /!*contextPath + *!/"/cart/kakao",--%>
                <%--    type: "POST",--%>
                <%--    data: {--%>
                <%--        o_sum: $('#o_sum').val(),--%>
                <%--        o_orderer: $('#o_orderer').val(),--%>
                <%--        o_tel: $('#o_tel').val(),--%>
                <%--        o_receiver: $('#o_receiver').val(),--%>
                <%--        o_receiver_tel: $('#o_receiver_tel').val(),--%>
                <%--        o_post_num: $('#o_post_num').val(),--%>
                <%--        o_addr1: $('#o_addr1').val(),--%>
                <%--        o_addr2: $('#o_addr2').val(),--%>
                <%--        o_memo: $('#o_memo').val(),--%>
                <%--        o_pay: "kakao",--%>
                <%--        o_account_num: $('#o_account_num').val()--%>
                <%--    },--%>
                <%--    // 값 1 = 이미 존재--%>
                <%--    success: function (responseData) {--%>
                <%--        &lt;%&ndash;location.href = '<%=request.getContextPath()%>/order/orderSuccess?msg=' + msg;&ndash;%&gt;--%>
                <%--        --%>
                <%--    },--%>
                <%--});--%>


                // alert("결제완료 폼 서브밋!")
                $('#fr').submit();
                //성공시 이동할 페이지
                <%--location.href = '<%=request.getContextPath()%>/order/orderSuccess?msg=' + msg;--%>
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href = "<%=request.getContextPath()%>/order/orderFail";
                alert(msg);
            }
        });
    });
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>