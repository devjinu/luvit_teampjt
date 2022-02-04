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
        <%--                <!--                <h1>{{email}}</h1>-->--%>
        <%--            {{/person}}--%>
        <%--        </script>--%>
        <%--        <span id="here"></span>--%>


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
                        <h3 name="o_product">상품명</h3>
                        <h4 name="s_option">상품 옵션 : </h4>
                    </div>
                    <div class="OrderAmount" name="o_amount">
                        수량 : <input type="number" min="1" max="100" value="1">
                    </div>
                    <div class="OrderCost" name="s_price">
                        가격 <p>￦10,0000</p>
                    </div>
                    <div class="clear"></div>
                </div>
                <!-- 상품 하나 -->
                <!-- 상품 하나 -->
                <div class="OrderList">
                    <div class="OrderThum">
                        <div style="width:210px; height:120px; background:#eee;"></div>
                    </div>
                    <div class="OrderInfo">
                        <h3>상품명 </h3>
                        <h4>상품 옵션 : </h4>
                    </div>
                    <div class="OrderAmount">
                        수량 : <input type="number" min="1" max="100" value="1">
                    </div>
                    <div class="OrderCost">
                        <p>￦10,0000</p>
                    </div>
                    <div class="clear"></div>
                </div>
                <!-- 상품 하나 -->
                <div class="semiCost">
                    <p class="productWord">상품가격 합계</p>
                    <P class="productCost">￦20,000</P>
                    <p class="deliveryWord">택배비</p>
                    <P class="deliveryCost">￦3,500</P>
                </div>
                <div class="totalCostArea">
                    <p class="totalWord">총액</p>
                    <P class="totalCost">￦3,500</P>
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
                        <input type="text" name="o_payer">
                        <p>연락처</p>
                        <input type="text">
                        <p>받는사람</p>
                        <input type="text" id="o_receiver">
                        <p>받는사람 연락처</p>
                        <input type="text">
                        <p>우편번호</p>
                        <input type="text" id="o_post_num" class="wdh80" placeholder="우편번호">
                        <input type="button"
                               value="찾기"
                               class="postCodeBtn"
                               onclick="searchMap();">
                        <%--                        <input type="button" id="test" value="테스트">--%>
                        <input type="text" id="addr1" placeholder="주소1">
                        <input type="text" id="addr2" placeholder="주소2">
                        <input type="hidden" id="addr3" placeholder="주소3">
                        <p>남길 메시지</p>
                        <textarea rows="5" cols="77" id="memo"></textarea>
                    </div>
                </div>
                <div id="SecurePayment">
                    <div class="TitleBar">결제 정보</div>
                    <div class="ContentBox">
                        <p>결제방식</p>
                        <select id="paymentMethod">
                            <option value="0">주문수단을 선택하세요</option>
                            <option value="1">무통장입금</option>
                            <option value="2">카카오페이</option>
                        </select>
                        <p>입금자명</p>
                        <input type="text" id="acc">
                        <p>계좌번호</p>
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

    var source = $('#entry').html();
    var template = Handlebars.compile(source);
    var data = {
        person: [
            {name: "길동", id: "asd", email: "gildong.com"},
            {name: "길동1", id: "2asd", email: "2gildong.com"},
            {name: "길동2", id: "1asd", email: "3gildong.com"}
            // name: "길동2", id: "1asd", email: "3gildong.com"
        ]
    }

    var html = template(data);
    $('#here').append(html);
</script>
<%--TODO validation--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


    $('#paymentMethod').on('change', () => {


        // 작동 1
        let type1 = $('#paymentMethod option:selected').val();
        // alert(type1);

        // 작동 2
        // let payment = document.querySelector('#paymentMethod');
        // let type2 = payment.options[payment.selectedIndex].text;
        // alert(type2);

        if (type1==0){
            $('.order_btn').attr("disabled", true);
        }


        if (type1 == 1) {
            $("#acc").attr("disabled", false);
            $("#accNo").attr("disabled", false);
            $('.order_btn').attr("disabled", false);

        }

        if (type1 == 2) {
            $("#acc").attr("disabled", true);
            $("#accNo").attr("disabled", true);
            $('.order_btn').attr("disabled", false);
        }


        // var options = $('#paymentMethod').find('option').map(function() {
        // 	return $(this).val();
        // }).get()
    });


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
                    document.getElementById("addr3").value = extraAddr;

                } else {
                    document.getElementById("addr3").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.


                document.getElementById("o_post_num").value = data.zonecode;
                document.getElementById("addr1").value = addr + extraAddr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>

<form action="" method="">
    buyer_name<input type="text" name="1">
    buyer_tel<input type="text" name="2">
    buyer_addr<input type="text" name="3">
    buyer_postcode <input type="text" name="4">
    <input type="submit" id="ordertest" value="테스트">
    <input type="button" id="test" value="카카오테스트">
</form>


<script>
    <%--TODO kakao--%>

    var o_addr = $("#o_addr1").val() + $("#o_addr2").val();

    /* . -> class , # -> id */
    $("#test").on('click', function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp22213129'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;

        IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'Luvit 상품 주문 내역',
            amount: '15000',/* 상품 가격 */
            buyer_name: $("#1").val(),
            buyer_tel: $("#2").val(),
            buyer_addr: /*o_addr*/$("#3").val(),
            buyer_postcode: $("#4").val(),
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
                //성공시 이동할 페이지
                location.href = '<%=request.getContextPath()%>/order/paySuccess?msg=' + msg;
            } else {
                msg = '결제에 실패하였습니다.';
                msg += '에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                location.href = "<%=request.getContextPath()%>/order/payFail";
                alert(msg);
            }
        });
    });


</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>