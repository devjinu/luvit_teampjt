<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>

<script type="text/javascript">
    $(function () {
        $(".pw_msg1").hide();
        $(".pw_msg2").hide();
        $(".pw_msg3").hide();
        $(".submit").attr("disabled","true");
        $("#pw").on("focusout", function () {

            $.ajax({
                url: "/user/checkPw",
                type: "post",
                data: {
                    "pw": $("#pw").val(),
                    "id": $("#id").val()
                },
                success: function (result) {
                    if (parseInt(result) == 1) {
                        $(".pw_msg1").show();
                        $(".pw_msg2").hide();
                        $(".pw_msg3").hide();
                        $(".submit").removeAttr("disabled");
                    } else if (parseInt(result) == 0) {
                        $(".pw_msg2").show();
                        $(".pw_msg1").hide();
                        $(".pw_msg3").hide();
                    } else {
                        $(".pw_msg3").show();
                        $(".pw_msg1").hide();
                        $(".pw_msg2").hide();
                    }
                }
            });

        });

    });
</script>
<section id="ViewContainerGrey">
    <div id="UserContainer">
    	<!-- 서브메뉴 -->
		<%@ include file="/WEB-INF/views/include/userSub.jsp" %>	
		<!-- 서브메뉴 -->
        <h4>회원탈퇴</h4>
        <h5>다시 만나기를 기다리고 있겠습니다.</h5>
        <div class="InsertArea">
            <hr>
            <form action="/user/delete" method="post">
                아이디: <input type="text" name="id" id="id" readonly value="${vo.id}"><br>
                비밀번호 : <input type="password" name="pw" id="pw" placeholder="비밀번호를 한번 더 입력해주세요."><br>
                <span class="pw_msg1">비밀번호가 확인 되었습니다</span>
                <span class="pw_msg2">비밀번호를 입력 해주세요</span>
                <span class="pw_msg3">비밀번호가 올바르지 않습니다</span> <br>
                <input type="submit" class="submit" value="회원 탈퇴">
                <input type="button" value="메인으로" onclick="location.href='/'">
            </form>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>