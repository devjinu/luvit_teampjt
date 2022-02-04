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
			<!-- 서브메뉴 -->
			<%@ include file="/WEB-INF/views/include/userSub.jsp" %>	
			<!-- 서브메뉴 -->
			<div class="InfoArea">
            <h4>회원정보수정</h4>
            <h5>정보를 수정하시려면 비밀번호를 한번 더 입력해주세요.</h5>
            <form action="" method="post">
                <p>아이디 :</p>
                <input type="text" name="id" id="id" value="${vo.id}" readonly><br>
                <p>비밀번호 :</p> 
                <input type="password" name="pw" id="pw" placeholder="비밀번호를 한번 더 입력해주세요.">
                <span class="pw_msg1">비밀번호 확인 되었습니다.</span>
                <span class="pw_msg2">올바른 비밀번호를 입력 해주세요</span> <br>
                <p>닉네임 :</p> 
                <input type="text" name="nickname" id="nickname" value="${vo.nickname}"> <br>
                <span class="nick_msg1">이미 존재하는 닉네임 입니다.</span>
                <span class="nick_msg2">사용 가능한 닉네임 입니다</span>
                <p>이메일 : </p>
                <input type="email" name="email" id="email" value="${vo.email}">
				<span class="email_msg1" style="color: blue">
             사용하실 수 있는 이메일 입니다.
            </span>
				<span class="email_msg2" style="color: red">
                현재 사용중인 이메일 입니다.
            </span> <br>
				<input type="button" id="email_send" value="이메일 인증하기">
                <span class="send_msg">이메일을 발송하였습니다</span> <br>
				<input type="text" name="email_hash" id="email_hash" placeholder="인증번호 입력"><br>
				<span class="hash_msg1" style="color: red"> 올바른 인증번호를 입력해주세요 </span>
				<span class="hash_msg2" style="color: blue"> 인증 완료되었습니다 </span>
				<span class="hash_msg3" style="color: black">인증번호를 입력해주세요</span>
                <input type="submit" id="submit" value="정보수정">
            </form>
        </div>
    </div>
</section>


<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>
