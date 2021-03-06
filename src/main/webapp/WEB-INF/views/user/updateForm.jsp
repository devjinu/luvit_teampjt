<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script type="text/javascript">
    $(document).ready(function () {
        $("#nickname").attr("readOnly", "true");
        $("#email").attr("readOnly", "true");
        $("#email_hash").attr("readOnly", "true");
        //$("#submit").attr("disabled","true");
        $(function () {
            $(".pw_msg2").hide();
            $(".pw_msg1").hide();
            $("#pw").focusout(function () {
                $.ajax({
                    url: "/user/checkPw",
                    type: "post",
                    data: {
                        "pw": $("#pw").val(),
                        "id": $("#id").val()
                    },
                    success: function (result) {
                        if (parseInt(result) == 1) {
                            $("#nickname").removeAttr("readOnly");
                            $("#email").removeAttr("readOnly");
                            $("#submit").removeAttr("disabled");
                            $("#pw").attr("readOnly", "true");
                            $(".pw_msg1").show();
                            $(".pw_msg2").hide();
                        } else {
                            $(".pw_msg2").show();
                            $(".pw_msg1").hide();
                        }
                    }
                });
            });
        });

        $(function () {
            var nickname = "${vo.nickname}";
            $(".nick_msg1").hide();
            $(".nick_msg2").hide();
            $("#nickname").on("focusout", function () {
                $.ajax({
                    url: "/user/nicknameCheck",
                    type: "post",
                    data: {"nickname": $("#nickname").val()},
                    success: function (result) {
                        if (parseInt(result) == 1) {
                            $(".nick_msg1").show();
                            $(".nick_msg2").hide();
                            $("#submit").attr("disabled","true");
                            if (nickname == ($("#nickname").val())) {
                                $(".nick_msg1").hide();
                                $(".nick_msg2").hide();
                                $("#submit").removeAttr("disabled");
                            }
                        } else {
                            $(".nick_msg2").show();
                            $(".nick_msg1").hide();
                            $("#submit").removeAttr("disabled");
                            if (nickname == ($("#nickname").val())) {
                                $(".nick_msg1").hide();
                                $(".nick_msg2").hide();
                                $("#submit").removeAttr("disabled");
                            }
                        }

                    }
                });
            });
        });
		$(function () {
			$(".email_msg1").hide();
			$(".email_msg2").hide();
			var email = "${vo.email}";
			$("#email").on("focusout",function () {
                $("#submit").attr("disabled","true");
				$.ajax({
					url    : "/user/emailCheck",
					type   : "post",
					data   : {"email": $("#email").val()},
					success: function (result) {
						if(parseInt(result) == 1){
							$(".email_msg2").show();
							$(".email_msg1").hide();
							if (email == ($("#email").val())) {
								$(".email_msg1").hide();
								$(".email_msg2").hide();

							}
						}else {
							$(".email_msg1").show();
							$(".email_msg2").hide();
							if (email == ($("#email").val())) {

							}
						}
					}

				});
			});
		});

		var hashVal = null;
		$(function(){
            $(".send_msg").hide();
			$("#email_send").one("click",function a(){
                $("#submit").attr("disabled","true");
				$.ajax({
					url: "/user/sendEmail",
					type: "post",
					data : {"email_check" : $("#email").val()},
					success: function a(result){
						hashVal = result;
                        $("#email_hash").removeAttr("readOnly");
                        $(".send_msg").show();
					}
				});
			});
		});
		$(function (){
			$(".hash_msg1").hide();
			$(".hash_msg2").hide();
			$(".hash_msg3").hide();
			$("#email_hash").focusout(function (){
				$.ajax({
					url: "/user/checkHash",
					type: "get",
					data:{"email_hash": $("#email_hash").val(),
						hashVal},
					success: function (result){

						if(parseInt(result) == 1){
							$(".hash_msg2").show();
							$(".hash_msg1").hide();
							$(".hash_msg3").hide();
                            $("#submit").removeAttr("disabled");
						}else if(parseInt(result) == 0){
							$(".hash_msg1").show();
							$(".hash_msg2").hide();
							$(".hash_msg3").hide();
                            $("#submit").attr("disabled","true");
						}else{
							$(".hash_msg3").show();
							$(".hash_msg1").hide();
							$(".hash_msg2").hide();
                            $("#submit").attr("disabled","true");
						}
					}
				});
			});
		});
    });
</script>
<section id="ViewContainerGrey">
		<div id="AdminContainer">
			<!-- ???????????? -->
			<%@ include file="/WEB-INF/views/include/userSub.jsp" %>	
			<!-- ???????????? -->
			<div class="InfoArea">
            <h4>??????????????????</h4>
            <h5>????????? ?????????????????? ??????????????? ?????? ??? ??????????????????.</h5>
            <form action="" method="post">
                <p>????????? :</p>
                <input type="text" name="id" id="id" value="${vo.id}" readonly><br>
                <p>???????????? :</p> 
                <input type="password" name="pw" id="pw" placeholder="??????????????? ?????? ??? ??????????????????.">
                <span class="pw_msg1">???????????? ?????? ???????????????.</span>
                <span class="pw_msg2">????????? ??????????????? ?????? ????????????</span> <br>
                <p>????????? :</p> 
                <input type="text" name="nickname" id="nickname" value="${vo.nickname}"> <br>
                <span class="nick_msg1">?????? ???????????? ????????? ?????????.</span>
                <span class="nick_msg2">?????? ????????? ????????? ?????????</span>
                <p>????????? : </p>
                <input type="email" name="email" id="email" value="${vo.email}">
				<span class="email_msg1" style="color: blue">
             ???????????? ??? ?????? ????????? ?????????.
            </span>
				<span class="email_msg2" style="color: red">
                ?????? ???????????? ????????? ?????????.
            </span> <br>
				<input type="button" id="email_send" value="????????? ????????????">
                <span class="send_msg">???????????? ?????????????????????</span> <br>
				<input type="text" name="email_hash" id="email_hash" placeholder="???????????? ??????"><br>
				<span class="hash_msg1" style="color: red"> ????????? ??????????????? ?????????????????? </span>
				<span class="hash_msg2" style="color: blue"> ?????? ????????????????????? </span>
				<span class="hash_msg3" style="color: black">??????????????? ??????????????????</span>
                <input type="submit" id="submit" value="????????????">
            </form>
        </div>
    </div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>
