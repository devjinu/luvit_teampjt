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

<hr>

<div id="nav">
 <%@ include file="../include/footer.jsp" %>
</div>

</body>
</html>