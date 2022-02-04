<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script type="text/javascript">
	var result='${msg}';
	if(result=='성공'){
		alert('레시피를 등록하였습니다.');
	}
</script>
</head>
<body>

	<section id="ViewContainer">
		<div id="RecipeContainer">
			<h1>오늘 뭐 먹지?</h1>
			<div class="recipe_main_banner">
				<img src="/resources/img/recipe_img/recipe_main_banner.jpg" />
				<div class="recipe_main_banner_copybox">
					<h2>Today's Recipe</h2>
					<p>여기 추천레시피나 오늘의 레시피 같은 거 <br>슬라이드 돌리면 좋을 것 같음</p>
				</div>
			</div>
			
			<div id="recipe_searchbox">
				<input type="text" name="" placeholder="조건1">
				<input type="text" name="" placeholder="조건2">
				<input type="text" name="" placeholder="조건3">
				<input type="submit" name="" value="search">
				<div class="tagBox">
					<button>#태그1</button>
					<button>#태그2</button>
					<button>#태그3</button>
					<button>#태그4</button>
				</div>
			</div>
			
			<div id="recipe_thumbnail">
				<h2>레시피 보기</h2>
				<button class="create_btn" onclick="location.href='/recipe/create'">레시피 업로드</button>
				<div class="clear"></div>
				<c:forEach items="${rvo }" var="rvo">
					<div class="thumbnail_box">
						<div class="thumnail_propic"></div>
						<div class="thumnail_introduce">
							<p> ${rvo.r_nickname } </p>
							<span><a href="/recipe/recipeDetail?r_bno=${rvo.r_bno}">${rvo.r_subject }</a></span>
						</div>
						<div class="clear"></div>
						<div class="thumnail_pic">
							<h4>${rvo.r_avg}</h4>
						</div>
						<ul>
							<li>좋아요 : ${rvo.r_like_count }</li>
							<li>공유</li>
							<li>댓글</li>
						</ul>
						<div class="thumnail_content"><a href="/recipe/recipeDetail?r_bno=${rvo.r_bno}">${rvo.r_introduce }</a></div>
						<div class="thumnail_tag">${rvo.r_tag1 } ${rvo.r_tag2 } ${rvo.r_tag3 } ${rvo.r_tag4 }</div>
					</div>
				</c:forEach>

			<div class="clear"></div>
			
			
		</div>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>

</html>