<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
			
<!-- 			<div id="recipe_searchbox"> -->
<!-- 					<select name="searchType"> -->
<%-- 					<option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option> --%>
<%-- 			        <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option> --%>
<%-- 				     <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option> --%>
<%-- 				     <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option> --%>
<!-- 				</select> -->
<%-- 				<input type="text" name="keyword" value="${page.keyword }"/> --%>
<!-- 				<input type="button" id="searchBtn" value="검색"> -->
<!-- 			</div> -->
			
			<div id="recipe_thumbnail">
				<h2>레시피 보기</h2>
				<button class="create_btn" onclick="location.href='/recipe/create'">레시피 등록</button>
				<div class="clear"></div>
				${searchRecipe} 내용
				<%-- <c:forEach items="${searchRecipe}" var="list">
					<div class="thumbnail_box">
						<div class="thumnail_propic">
							<img src="/resources/img/recipe_img/thum_icon${random}.png" />
						</div>
						<div class="thumnail_introduce">
							<p> ${list.r_nickname } </p>
							<span><a href="/recipe/recipeDetail?r_bno=${list.r_bno}">${list.r_subject }</a></span>
						</div>
						<div class="clear"></div>
						<div class="thumnail_pic">
							<div class="scale"><a href="/recipe/recipeDetail?r_bno=${list.r_bno}"><img src="/resources/photo_upload/${list.r_thumbnail}"></a></div>
							<h4>${list.r_avg}</h4>
						</div>
						<ul>
							<li><i class="far fa-heart likeIcon"></i>  ${list.r_like_count }</li> <!-- 좋아요 -->
							<li><i class="fas fa-share-alt normalIcon"></i></li><!-- 공유 -->
							<li><i class="fas fa-comment-dots normalIcon"></i></li><!-- 댓글 -->
						</ul>
						<div class="thumnail_content"><a href="/recipe/recipeDetail?r_bno=${list.r_bno}">${list.r_introduce }</a></div>
<!-- 						<div class="thumnail_tag"> -->
							<c:forTokens items="${list.r_tag1}" delims="," var="item1"><a href="/recipe/search?num=1&tag=${item1}">#${item1} </a></c:forTokens>
							<c:forTokens items="${list.r_tag2}" delims="," var="item2"><a href="/recipe/search?num=1&tag=${item2}">#${item2} </a></c:forTokens>
							<c:forTokens items="${list.r_tag3}" delims="," var="item3"><a href="/recipe/search?num=1&tag=${item3}">#${item3} </a></c:forTokens>
							<c:forTokens items="${list.r_tag4}" delims="," var="item4"><a href="/recipe/search?num=1&tag=${item4}">#${item4} </a></c:forTokens>
<!-- 						</div> -->
					</div>
				</c:forEach> --%>

			<div class="clear"></div>
			
<!-- 			<div class="paging"> -->
<%-- 				<c:if test="${page.prev}"> --%>
<%-- 				 <span>[ <a href="/recipe/recipeListSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span> --%>
<%-- 				</c:if> --%>
				
<%-- 				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num"> --%>
<!-- 				 <span> -->
				 
<%-- 				  <c:if test="${select != num}"> --%>
<%-- 				   <a href="/recipe/recipeListSearch?num=${num}${page.searchTypeKeyword}">${num}</a> --%>
<%-- 				  </c:if>     --%>
				  
<%-- 				  <c:if test="${select == num}"> --%>
<%-- 				   <b>${num}</b> --%>
<%-- 				  </c:if> --%>
				    
<!-- 				 </span> -->
<%-- 				</c:forEach> --%>
				
<%-- 				<c:if test="${page.next}"> --%>
<%-- 				 <span>[ <a href="/recipe/recipeListSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span> --%>
<%-- 				</c:if> --%>
<!-- 			</div> -->
		</div>
		</div>
	</section>
<script type="text/javascript">
$(document).ready(function(){
	$('.fa-heart').click(function() { // 버튼을 눌렀을 때 실행됨 
	    $(this).toggleClass('far'); // 버튼을 누르면 .uncheckedButton, .checkedButton 클래스가 반복해서 실행됨 
	    $(this).toggleClass('fas');
	});
});

	document.getElementById("searchBtn").onclick = function(){
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
	location.href="/recipe/recipeListSearch?num=1"+"&searchType="+searchType+"&keyword="+keyword;
};
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>

</html>