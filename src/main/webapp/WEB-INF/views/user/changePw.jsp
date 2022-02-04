<%@ page import="com.luvit.domain.UserVO" %>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>

	<section id="ViewContainerGrey">
		<div id="AdminContainer">
			<!-- 서브메뉴 -->
			<%@ include file="/WEB-INF/views/include/userSub.jsp" %>	
			<!-- 서브메뉴 -->
			<div class="InfoArea">
            <h4>비밀번호 변경</h4>
            <h5>비밀번호를 수정하시려면 비밀번호를 한번 더 입력해주세요.</h5>
            <form action="" method="post" id="fr" onsubmit="CheckForm();">
                기존 비밀번호 : <input type="password" id="pw_check" name="pw_check" placeholder="비밀번호를 한번 더 입력 해주세요"> <br>
                <span class="pw_msg1"> 확인 되었습니다</span>
                <span class="pw_msg2"> 비밀번호를 잘못 입력하셨습니다</span>
                <span class="pw_msg3"> 비밀번호를 입력 해주세요</span> <br>
                변경할 비밀번호 : <input type="password" id="pw" name="pw"> <br>
                <span class="pw_msg"> 변경하실 비밀번호를 입력해주세요</span><br>
                비밀번호 확인 : <input type="password" id="pw2" name="pw2"> <br>
                <span class="msg1"> 비밀번호가 일치 합니다</span>
                <span class="msg2"> 비밀번호가 일치 하지않습니다</span>
                <span class="msg3"> 비밀번호 확인을 입력해주세요</span> <br>
                <input type="hidden" name="id" id="id" value="<%=id%>">
                <input type="submit" class="submit" value="변경하기" onclick="location.href='/user/changePw'">
                <input type="button" value="메인으로" onclick="location.href='/'">
            </form>
        </div>
    </div>
</section>
<script type="text/javascript">
    /* . -> class , # -> id */

    $(function () {
        $(".pw_msg1").hide();
        $(".pw_msg2").hide();
        $(".pw_msg").hide();
        $(".msg3").hide();
        $("#pw").attr("disabled", "true");
        $("#pw2").attr("disabled", "true");
        $(".submit").attr("disabled", "true")
        $("#pw_check").focusout(function () {
            $(".pw_msg").hide();
            if($("#pw_check").val = ""){
                $(".pw_msg3").show();
                $(".pw_msg1").hide();
                $(".pw_msg2").hide();
            }
            $.ajax({
                url: "/user/checkPw",
                type: "post",
                data: {
                    "pw": $("#pw_check").val(),
                    "id": $("#id").val()
                },
                success: function (result) {

                    if (parseInt(result) == 1) {
                        $(".pw_msg1").show();
                        $(".pw_msg2").hide();
                        $(".pw_msg3").hide();
                        $(".pw_msg").show();
                        $("#pw").removeAttr("disabled");
                        $("#pw2").removeAttr("disabled");
                    }else if(parseInt(result) == 0){
                        $(".pw_msg3").show();
                        $(".pw_msg1").hide();
                        $(".pw_msg2").hide();
                    } else {
                        $(".pw_msg2").show();
                        $(".pw_msg1").hide();
                        $(".pw_msg3").hide();
                        $("#pw").attr("disabled", "true");
                        $("#pw2").attr("disabled", "true");
                    }
                }
            });
        });
    });
</script>
<script type="text/javascript">
    var pw = $("#pw").val();
    $(function (){
        $("#pw").on("focusout",function (){
            if($("#pw").val() == ""){
                $(".pw_msg").show();
                $(".msg3").hide();
            }else {
                $(".pw_msg").hide();
                $(".msg3").show();
            }

        });
    });

</script>
<script type="text/javascript">
    var pw2 = $("#pw2").val();
    $(function () {
        $(".msg1").hide();
        $(".msg2").hide();
        $("#pw2").on("focusout",function () {
            $.ajax({
                url: "/user/pwCheck",
                type: "post",
                data: {
                    "pw": $("#pw").val(),
                    "pw2": $("#pw2").val(),
                },
                success: function (result) {
                    if (parseInt(result) == 1) {
                        $(".msg1").show();
                        $(".msg2").hide();
                        $(".msg3").hide();
                        $(".submit").removeAttr("disabled");
                    } else {
                        $(".msg2").show();
                        $(".msg1").hide();
                        $(".msg3").hide();
                    }

                }
            });
        });
    });


</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
