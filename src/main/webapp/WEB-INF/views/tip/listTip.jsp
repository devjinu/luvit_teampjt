<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<section id="ViewContainer">
		<div id="RecipeContainer">
			<h1>오늘 뭐 먹지?</h1>
			<div class="recipe_main_banner">
				<img src="/resources/img/recipe_img/recipe_main_banner.jpg" />
				<div class="recipe_main_banner_copybox">
					<h2>Today's Recipe</h2>
					<p>여기 추천레시피나 오늘의 레시피 같은 거 <br>슬라이드 돌리면 좋을 것 같음</p>
				</div>
				<div class="listTip_board">
					<table border="1">
					<tr>
						<td>글번호</td>
						<td>제목</td>
						<td>내용</td>
						<td>작성자</td>
						<td>조회수</td>
					</tr>
			
					<c:forEach items="${list}" var="list">
			
						<tr>
							<td>${list.t_bno}</td>
							<td>
							 <a href="/tip/viewTip?t_bno=${list.t_bno}">${list.t_subject}</a>
							</td>
							<td>${list.t_content}</td>
							<td>${list.t_nickname}</td>
							<td>${list.t_hit}</td>
						</tr>
			
					</c:forEach>
			
				</table>
			<input type="button" value="글쓰기" onclick="location.href='/tip/insertTip'">
				</div>
			</div>
		</div>
</section>


	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>