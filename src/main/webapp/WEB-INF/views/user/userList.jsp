<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ITWILL
  Date: 2020-10-27
  Time: 오후 4:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
searchlist : ${searchlist}
<fieldset>
    <legend>회원 목록</legend>

    <table border="1">
        <tr>
            <td>user_num</td>
            <td>id</td>
            <td>pw</td>
            <td>email</td>
            <td>tel</td>
            <td>reg_date</td>
            <td>point</td>
            <td>nickname</td>
            <td>grade</td>
        </tr>
                <c:forEach var="mvo" items="${userList}">
                    <tr>
                        <td>${mvo.user_num}</td>
                        <td>${mvo.id}</td>
                        <td>${mvo.pw}</td>
                        <td>${mvo.email}</td>
                        <td>${mvo.tel}</td>
                        <td>${mvo.reg_date}</td>
                        <td>${mvo.point}</td>
                        <td>${mvo.nickname}</td>
                        <td>${mvo.grade}</td>
                    </tr>
                </c:forEach>
        <tr>
            <td>${returnvo.user_num}</td>
            <td>${returnvo.id}</td>
            <td>${returnvo.pw}</td>
            <td>${returnvo.email}</td>
            <td>${returnvo.tel}</td>
            <td>${returnvo.reg_date}</td>
            <td>${returnvo.point}</td>
            <td>${returnvo.nickname}</td>
            <td>${returnvo.grade}</td>
        </tr>

    </table>
    <form action="/user/searchUser" method="post">
        회원 찾기(검색할 아이디명) : <input type="text" name="id" placeholder="아이디를 적으세요">
        <input type="submit" value="찾기">
    </form>
</fieldset>

</body>
</html>
