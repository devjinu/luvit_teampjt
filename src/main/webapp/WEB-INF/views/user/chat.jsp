<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

</head>
<body>
<%

    String returnId = request.getParameter("id");
    String id = (String) session.getAttribute("id");
//    if (id != null) {
//        String idResponse = request.setAttribute("id",id);
//    }
%>

<h2>itwill live chat</h2>
<h4>어서오세요.</h4>
<input type="text" id="message" onkeydown="enterkey();"/>
<input type="button" id="sendBtn" value="보내기"/>
<input type="button" id="delete" value="채팅 초기화" onclick="location.href='http://localhost:8088/echo/chat?id=<%=id%>'"/>
<input type="button" id="itill" value="홈페이지로" onclick="location.href='/'"/>

<%--// http://192.168.7.6:8080/echo--%>
<%--// http://rustywhite404.cafe24.com/echo--%>

<div id="messageArea"></div>
</body>


<script>
    $('#delete').on('click', () => {
        $('#messageArea').removeAttr("value");
    })
</script>


<script type="text/javascript">
    $("#sendBtn").click(function () {
        sendMessage();
        $('#message').val('')
    });

    var id = "${id}";
    if (id == "") {
        id = prompt("아이디를 입력하시오");
    }
    if ((id.trim()) == "null") {
        location.href = "asd";
    }

    // http://192.168.7.6:8080/echo
    // http://rustywhite404.cafe24.com/echo

    var sock = new SockJS("http://localhost:8088/echo");
    sock.onmessage = onMessage;
    sock.onclose = onClose;
    <%--sock.send(("#messageArea").append(${id}+" 님께서 접속하셧습니다."));--%>

    // 엔터로 메시지 전송 실행

    // $("#SEARCH_KEYWORD").keyup(function (e) {
    //     if (e.keyCode == 13) login();
    // });

    function enterkey() {
        if (event.keyCode == 13)
            //TODO : 실행시킬 코드
        {
            $('#message').focus();
            $('#sendBtn').click();
        }
    }

    // 메시지 전송
    function sendMessage() {
        sock.send(id + "님으로 부터 : " + $("#message").val());
    }

    // 서버로부터 메시지를 받았을 때
    function onMessage(msg) {
        var data = msg.data;
        $("#messageArea").append(data + "<br/>");
    }

    // 서버와 연결을 끊었을 때
    function onClose(evt) {
        $("#messageArea").append("연결 끊김");

    }
</script>
</html>