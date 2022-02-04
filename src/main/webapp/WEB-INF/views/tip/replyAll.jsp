<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 컴퓨터에 있는 제이쿼리 라이브러리 추가  -->
<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
</head>
<body>
 
<form action="/tip/replyAll" method="post">

<div class="">
 <label>작성자</label>
 <input type="text" name="t_c_nickname" />
</div>

<div class="">
 <label>글내용</label>
 <textarea cols="3" rows="5" name="t_c_content" placeholder ="소감한마디!"></textarea>
</div>

<div class="">
 <input type="submit" value="등록하기">
</div>

<table border="1">
		<tr>
			<td>작성자</td>
			<td>내용</td>
		</tr>

		<c:forEach items="${list}" var="list">

			<tr>
				<td>${list.t_content}</td>
				<td>${list.t_nickname}</td>
			</tr>

		</c:forEach>

	</table>
	<div>
		<c:if test="${page.prev}">
			<span>[ <a href="/tip/listPage?num=${page.startPageNum - 1}">이전</a> ]</span>
		</c:if>

		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}"
			var="num">
			<span> <c:if test="${select != num}">
					<a href="/tip/listPage?num=${num}">${num}</a>
				</c:if> <c:if test="${select == num}">
					<b>${num}</b>
				</c:if>

			</span>
		</c:forEach>

		<c:if test="${page.next}">
			<span>[ <a href="/tip/listPage?num=${page.endPageNum + 1}">다음</a> ]</span>
		</c:if>

	</div>
		<input type="button" value="글쓰기"
			onclick="location.href='/tip/insertTip'">

</form>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>