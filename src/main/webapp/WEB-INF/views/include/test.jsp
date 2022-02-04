<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
	<section id="ViewContainer">
	<h4>로그인 페이지</h4>
	<fieldset>
		<!-- action="" 속성값이 없을 경우 자기 자신 페이지(/member/login(post))를 호출함 -->
		<%-- merge test --%>
		<form action="" method="post">
			ID: <input type="text" name="userid"><br>
			PW: <input type="password" name="userpw"><br>
			<input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.href='/member/insert'">
		</form>
	</fieldset>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>