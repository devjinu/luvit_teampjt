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
			<div id="AdminProfileArea" class="bgcolor">
				<div id="proArea">
					<div class="propic">
						<img src="/resources/img/recipe_img/recipe_default_pro.png">
					</div>
					<h2>${nickname}님, 환영합니다.</h2>
					<span>오늘은 <fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 E요일 입니다."/></span>
					
				</div>
				<div id="newCountArea">
				<p>신규가입자</p>
				<p>n명</p>
				</div>
				<div id="newCountArea">신규주문 n건</div>
				<div class="clear"></div>
			</div>
			<div id="contentArea">
				<h2>ADMIN CONTENTS</h2>
				<a href="/admin/userList?num=1"><div class="contentBox"><h1><i class="fas fa-users"></i></h1><h4>회원목록</h4></div></a>
				<a href="/admin/boardList?num=1"><div class="contentBox"><h1><i class="fas fa-list-ol"></i></h1><h4>게시물목록</h4></div></a>
				<a href="../cart/adminOrderList"><div class="contentBox"><h1><i class="fas fa-truck"></i></h1><h4>배송현황</h4></div></a>
				<div class="contentBox mgr0"><h1><i class="fas fa-calculator"></i></h1><h4>판매현황</h4></div>
				<div class="contentBox"><h1><i class="fas fa-skull"></i></h1><h4>블랙리스트</h4></div>
				<div class="clear"></div>
			</div>
			
		</div>
	</section>
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>