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
			<h4>회원정보</h4>
			<h5>비밀번호는 자주 변경해주실 것을 권장합니다.</h5>
			
			<p>아이디:</p> 
			<div class="infoForm">${mvo.id}</div>
			<p>닉네임:</p> 
			<div class="infoForm">${mvo.nickname}</div>
			<p>이메일:</p> 
			<div class="infoForm">${mvo.email}</div>
			<p>가입일:</p> 
			<div class="infoForm">${mvo.reg_date}</div>
			<p>포인트:</p> 
			<div class="infoForm">${mvo.point}</div>

			<%
			    if(session.getAttribute("id")!=null){
			%>
			<input type="button" onclick="location.href='/user/update'" value="정보수정">
			<input type="button" onclick="location.href='/user/changePw'" value="비밀번호 변경">
			
			<%
			    }else if (session.getAttribute("id")=="admin"){
			%>
			<input type="button" onclick="location.href='/user/userList'" value="회원 목록">
			<%
			    }
			%>
			</div>
		</div>
	</section>
</body>
<%@ include file="../include/footer.jsp" %>
</html>
