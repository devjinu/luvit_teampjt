<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe_review list</title>
</head>
<body>

<div id="nav">
 <%@ include file="../include/header.jsp" %>
</div>

<table>
	<thead>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="list">
			<tr>
				<td>${list.r_r_bno}</td>
				<td><a href="/Recipe_review/view?r_r_bno=${list.r_r_bno}">${list.r_r_subject}</a></td>
				<td>${list.r_r_date}</td>
				<td>${list.r_r_nickname}</td>
				<td>${list.r_r_hit}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<div>
	<c:if test="${page.prev}"><span>[ <a href="/Recipe_review/listPage?num=${page.startPageNum - 1}">이전</a> ]</span></c:if>
	<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
		<span>
			<c:if test="${select != num}"><a href="/Recipe_review/listPage?num=${num}">${num}</a> </c:if>
			<c:if test="${select == num}"><b>${num}</b></c:if>
		</span>
	</c:forEach>
	<c:if test="${page.next}"><span>[ <a href="/Recipe_review/listPage?num=${page.endPageNum + 1}">다음</a> ]</span></c:if>
</div>

<hr>
	
<div>
<a href="/Recipe_review/write">리뷰 작성</a>
</div>

<div id="nav">
 <%@ include file="../include/footer.jsp" %>
</div>

</body>
</html>