<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="../include/header2.jsp" %>
    <meta charset="UTF-8">
    <script type="text/javascript">
        $(function () {
            $("#submit").attr("disabled", "true");
            var email = $("#email_check").val();
            if (email == "") {
                $(".email_msg3").show();
                $(".email_msg1").hide();
                $(".email_msg2").hide();
                $(".email_msg4").hide();
            }

            $("#email_check").on("focusout", function () {
                $(".email_msg1").hide();
                $(".email_msg2").hide();
                $(".email_msg3").hide();
                $(".email_msg4").hide();

                $.ajax({
                    url: "/user/emailCheck",
                    type: "post",
                    data: {"email": $("#email_check").val()},
                    success: function (result) {
                        if (parseInt(result) == 1) {
                            $(".email_msg2").show();
                            $(".email_msg1").hide();
                            $(".email_msg3").hide();
                            $(".email_msg4").hide();
                        } else if (parseInt(result) == 2) {
                            $(".email_msg1").hide();
                            $(".email_msg1").hide();
                            $(".email_msg3").show();
                            $(".email_msg4").hide();
                        }else if(parseInt(result) == 3){
                            $(".email_msg4").show();
                            $(".email_msg1").hide();
                            $(".email_msg2").hide();
                            $(".email_msg3").hide();
                        } else {
                            $(".email_msg1").show();
                            $(".email_msg2").hide();
                            $(".email_msg3").hide();
                            $(".email_msg4").hide();
                        }

                    }
                });
            });

            $(function () {
                $(".nick_msg1").hide();
                $(".nick_msg2").hide();
                $("#nickname_check").focusout(function () {
                    $.ajax({
                        url: "/user/nicknameCheck",
                        type: "post",
                        data: {"nickname": $("#nickname_check").val()},
                        success: function (result) {
                            if (parseInt(result) == 1) {
                                $(".nick_msg2").show();
                                $(".nick_msg1").hide();
                            } else {
                                $(".nick_msg1").show();
                                $(".nick_msg2").hide();
                                $("#submit").removeAttr("disabled");
                            }
                        }
                    });
                });
            });
            var hashVal = null;
            $(function () {

                $("#email_send").on("click", function a() {

                    $.ajax({
                        url: "/user/sendEmail",
                        type: "post",
                        data: {"email_check": $("#email_check").val()},
                        success: function a(result) {
                            hashVal = result;
                        }
                    });
                });
            });
            $(function () {
                $(".hash_msg1").hide();
                $(".hash_msg2").hide();
                $(".hash_msg3").hide();
                $("#email_hash").focusout(function () {
                    $.ajax({
                        url: "/user/checkHash",
                        type: "get",
                        data: {
                            "email_hash": $("#email_hash").val(),
                            hashVal
                        },
                        success: function (result) {

                            if (parseInt(result) == 1) {
                                $(".hash_msg2").show();
                                $(".hash_msg1").hide();
                                $(".hash_msg3").hide();
                                $("#submit").removeAttr("disabled");
                            } else if (parseInt(result) == 0) {
                                $(".hash_msg1").show();
                                $(".hash_msg2").hide();
                                $(".hash_msg3").hide();
                            } else {
                                $(".hash_msg3").show();
                                $(".hash_msg1").hide();
                                $(".hash_msg2").hide();
                            }
                        }
                    });
                });
            });
        });
    </script>

</head>
<body>
<div id="nav">

</div>

<section id="ViewContainer">
    <div id="UserContainer">
        <div class="InfoArea">
            <h5>이메일, 닉네임을 설정 해주세요</h5>
            <!-- action="" 속성값이 없을 경우 자기 자신 페이지(/member/login(post))를 호출함 -->

            <form action="/user/snsInsertUser" method="post">
                이메일 : <input type="text" name="email" id="email_check">
                <span class="email_msg1" style="color: blue">사용하실 수 있는 이메일 입니다.</span>
                <span class="email_msg2" style="color: red">현재 사용중인 이메일 입니다.</span>
                <span class="email_msg3">이메일을 입력해주세요</span>
                <span class="email_msg4">이메일 주소를 확인 해주세요</span> <br>
                <input type="button" value="이메일 인증하기" id="email_send">
                이메일 인증 코드 : <input type="text" name="email_hash" id="email_hash"> <br>
                <span class="hash_msg1" style="color: red"> 올바른 인증번호를 입력해주세요 </span>
                <span class="hash_msg2" style="color: blue"> 인증 완료되었습니다 </span>
                <span class="hash_msg3" style="color: black">인증번호를 입력해주세요</span> <br>
                닉네임 : <input type="text" name="nickname" id="nickname_check"><br>
                <span class="nick_msg1" style="color: blue">
             사용하실 수 있는 닉네임입니다.
            </span>
                <span class="nick_msg2" style="color: red">
                현재 사용중인 닉네임입니다.
            </span> <br>
                <input type="hidden" name="id" value="${id}">
                <input type="hidden" name="pw" value="${id}${nickname}">
                <input type="submit" id="submit" value="회원가입">
            </form>

        </div>
    </div>

</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>


</html>