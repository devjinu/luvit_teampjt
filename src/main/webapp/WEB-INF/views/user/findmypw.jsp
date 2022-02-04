<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
<section id="ViewContainerGrey">
    <div id="AdminContainer">
        <div class="InfoArea">
            <br><br><br><br>
            <form action="/user/searchPw" method="post">
                <h2>비밀번호 찾기</h2>
                <p>
                    아래 일치되는 아이디/이메일주소를 입력하시면,<br>
                    입력하신 이메일로 새암호를 보내드립니다<br>
                    <br>
                </p>
                    <input type="text" name="id" placeholder="아이디">
                    <input type="text" name="email" placeholder="이메일주소">
                    <p>'@'포함한 이메일주소를 정확히 입력해주세요.</p>
                    <input type="submit" value="비밀번호찾기" onclick="msg();" <%--onclick="searchPw();"--%>>
                    <input type="button" value="메인으로" onclick="location.href='/'">
            </form>
        </div>
    </div>
</section>

<script>
function msg() {
    alert("메일 발송 시도중, 잠시만 기다려주세요")
}
    function searchPw() {
        document.getElementById("email").valueOf().submit();
    }
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
