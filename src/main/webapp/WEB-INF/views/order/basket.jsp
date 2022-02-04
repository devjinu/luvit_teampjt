<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2020-11-04
  Time: 오후 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<fieldset>
    <legend>review your order</legend>
    <form action="" method="post">
        주문자 명 : <input type="text" class="o_payer" name="o_payer"> <br>
        상품명 : <input type="text" class="o_product" name="o_product" value="${vo.name}"> <br> <%-- 상품번호 대체가능? --%>
        가격 : <input type="text" class="s_price" name="s_price" value="${vo.price}"> <br> <%-- 상품 개별가격? 주문 전체 가격? --%>
        수량 : <input type="text" class="o_amount" name="o_amount" value="${vo.amount}"> <br>
        옵션 : <input type="text" class="s_option" name="s_option" value="${vo.option}"> <br>
        <input type="text" id="o_post_num" placeholder="우편번호">
        <input type="button" onclick="sample6_execDaumPostcode();" value="우편번호 찾기"><br>
        <input type="text" id="addr1" placeholder="주소"><br>
        <input type="text" id="addr2" placeholder="상세주소">
        <input type="text" id="addr3" placeholder="참고항목"> <br>
        받는이 : <input type="text" class="o_receiver" name="o_receiver"> <br>
        전화번호 : <input type="text" class="o_tel" name="o_tel"> <br>
        결제수단 : <select>
        <option value="1">카카오페이</option>
        <option value="2">무통장 입금</option>
    </select> <br>
        <input type="reset" value="장바구니 비우기">
        <input type="button" id="placeorder" class="placeorder" name="placeorder" value="place order">
    </form>
</fieldset>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
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
                document.getElementById('o_post_num').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
    }
</script>
<script>
    var o_addr = $("#o_addr1").val()+$("#o_addr2").val();

    /* . -> class , # -> id */
    $("#placeorder").click(function () {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp22213129'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;

        IMP.request_pay({
            pg: 'kakaopay',
            pay_method: 'card',
            merchant_uid: 'merchant_' + new Date().getTime(),
            name: 'Luvit 상품 주문 내역',
            amount: '1',/* 상품 가격 */
            buyer_name: $("#o_payer").val(),
            buyer_tel: $("#o_tel").val(),
            buyer_addr: o_addr,
            buyer_postcode: $("#o_post_num").val(),
        }, function (rsp) {
            if (rsp.success) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
                jQuery.ajax({
                    url: "/order/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid: rsp.imp_uid
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
