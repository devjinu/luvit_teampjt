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
            <h5>?????????, ???????????? ?????? ????????????</h5>
            <!-- action="" ???????????? ?????? ?????? ?????? ?????? ?????????(/member/login(post))??? ????????? -->

            <form action="/user/snsInsertUser" method="post">
                ????????? : <input type="text" name="email" id="email_check">
                <span class="email_msg1" style="color: blue">???????????? ??? ?????? ????????? ?????????.</span>
                <span class="email_msg2" style="color: red">?????? ???????????? ????????? ?????????.</span>
                <span class="email_msg3">???????????? ??????????????????</span>
                <span class="email_msg4">????????? ????????? ?????? ????????????</span> <br>
                <input type="button" value="????????? ????????????" id="email_send">
                ????????? ?????? ?????? : <input type="text" name="email_hash" id="email_hash"> <br>
                <span class="hash_msg1" style="color: red"> ????????? ??????????????? ?????????????????? </span>
                <span class="hash_msg2" style="color: blue"> ?????? ????????????????????? </span>
                <span class="hash_msg3" style="color: black">??????????????? ??????????????????</span> <br>
                ????????? : <input type="text" name="nickname" id="nickname_check"><br>
                <span class="nick_msg1" style="color: blue">
             ???????????? ??? ?????? ??????????????????.
            </span>
                <span class="nick_msg2" style="color: red">
                ?????? ???????????? ??????????????????.
            </span> <br>
                <input type="hidden" name="id" value="${id}">
                <input type="hidden" name="pw" value="${id}${nickname}">
                <input type="submit" id="submit" value="????????????">
            </form>

        </div>
    </div>

</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>


</html>