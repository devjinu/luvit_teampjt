<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2020-11-05
  Time: 오후 6:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<form action="" method="post" onsubmit="CheckForm();">
    <legend>비밀번호 확인 페이지</legend>
    <input type="hidden" id="id" name="id" value="<%=id%>">
    비밀번호 입력해라<input type="password" name="pw" id="pw" style="border: 1px color('black')"> <br>
    <
    <input type="button" id="passCheck" value="변경하기" onclick="location.href='/user/changePw'">
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</form>
<script type="text/javascript">
    /* . -> class , # -> id */
    $(function () {
        $(".pw_msg1").hide();
        $(".pw_msg2").hide();
        $("#passCheck").hide();
        $("#pw").focusout(function () {
            $.ajax({
                url    : "/user/checkPw",
                type   : "post",
                data   : {
                    "pw": $("#pw").val(),
                    "id": $("#id").val()
                },
                success: function (result) {
                    if (parseInt(result) == 1) {
                        $(".pw_msg1").show();
                        $(".pw_msg2").hide();
                        $("#passCheck").show();
                        $(".pw").attr("disabled", "true");
                    } else {
                        $(".pw_msg2").show();
                        $(".pw_msg1").hide();
                    }
                }
            });
        });
    });
    function CheckForm(){
        var pw = document.getElementById("pw");

        if(nickname.value.length == 0){
            window.alert("비밀번호를 입력 해주세요");
            pw.focus();
            return false;
        }
    }

</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
