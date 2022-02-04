<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
    var result = '${msg}';
    if (result == 'IdNull') {
        alert('로그인 후 이용 가능한 콘텐츠입니다.');
    }
</script>

<section id="ViewContainer">

    <div id="UserContainer">
        <h4>로그인</h4>
        <h5>애잇에 오신 것을 환영합니다.</h5>

        <div class="fullBox_grey">
            <div class="boxArea">
                <div class="loginBox">
                    <h5>회원 로그인</h5>
                    <form action="" method="post" id="fr">
                        <input type="text" name="id" id="idCheck" required placeholder="아이디"><br>
                        <input type="password" name="pw" required placeholder="비밀번호"><br>
                        <input type="submit" class="submit" value="로그인" onclick="return chk();">
                        <input type="button" value="아이디 찾기" onclick="location.href='/user/findmyid'">
                        <input type="button" value="비밀번호 찾기" onclick="location.href='/user/findmypw'">
                        <span class="valid" style="color: red">
                가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.
            </span> <br>
                    </form>
                </div>
                <div class="joinBox">
                    <h5>아직 회원이 아니신가요?</h5>
                    <p>회원이 되시면 애잇의 온라인 회원으로서<br>
                        더 큰 혜택과 편리함을 누릴 수 있습니다. </p>
                    <br>
                    <br>
                    <input type="button" value="회원가입" onclick="location.href='/user/insert'">
                    <button class="naverBtn" onclick="location.href='${naver_url}'">네이버 아이디로 로그인</button>
                    <button class="kakaoBtn" onclick="location.href='${kakao_url}'">카카오 아이디로 로그인</button>
                    <button class="googleBtn" onclick="location.href='${google_url}'">구글 아이디로 로그인</button>

                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">
    function idCheck() {
        alert(document.getElementById("id"));
        if (document.getElementById("id") == null) {
            document.getElementById("id").focus();
            return false;
        }
    }

    $('.valid').hide();

    var result = '${result}';
    // alert(result);

    if (result == 'fail') {
        $('.valid').show();
    }


    // function chk() {
    //
    //     // $('.submit').on('click', () => {
    //     //     $.ajax({
    //     //         url: /*contextPath + */"/user/idCheck",
    //     //         type: "POST",
    //     //         data: {
    //     //             "id": $('.id').val()
    //     //         },
    //     //         success: function (responseData) {
    //     //
    //     //         }, fail: function () {
    //     //             $('.valid').show();
    //     //             return false;
    //     //         }
    //     //
    //     //     });
    //     // });
    //
    //     $('.submit').on('click', () => {
    //         $.ajax({
    //             url: /*contextPath + */"/user/idCheck",
    //             type: "POST",
    //             data: {
    //                 "id": $('.id').val(),
    //                 "pw": $('.pw').val()
    //             },
    //             success: function (responseData) {
    //                 if (responseData != 1) {
    //                     $('.valid').show();
    //                     return false;
    //                 }
    //
    //
    //             }
    //
    //         });
    //     });
    // }

</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
