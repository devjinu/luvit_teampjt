<%@page import="java.io.Console"%>
<%@page import="com.luvit.domain.RecipeVO"%>
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

</head>
<body>

	<section id="ViewContainer">
		<div id="RecipeContainer">
			<h1>애잇 셀렉트</h1>
			<div class="recipe_main_banner">
				<img src="/resources/img/recipe_img/select_bg.jpg" />
				<div class="recipe_main_banner_selectBox">
					<p>애잇이 추천해드린 레시피 외에도 <br>
					선택한 재료로 해먹을 수 있는 요리가 있다면 <br>
					지금 바로 이야기 해주세요!
					</p>
					<input type="button" onclick="location.href='/recipe/create'" value="레시피 등록하기">
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
				<h2>선택한 재료로 가능한 요리</h2>
				<button class="move_btn" onclick="location.href='/recipe/recipeListSearch?num=1'">더 많은 레시피 보러가기</button>
				<div class="clear"></div>			
					<c:forEach items="${searchRecipe}" var="list">
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
						<div class="thumnail_tag">
							<c:forTokens items="${list.r_tag1}" delims="," var="item1"><a href="/recipe/search?num=1&tag=${item1}">#${item1} </a></c:forTokens>
							<c:forTokens items="${list.r_tag2}" delims="," var="item2"><a href="/recipe/search?num=1&tag=${item2}">#${item2} </a></c:forTokens>
							<c:forTokens items="${list.r_tag3}" delims="," var="item3"><a href="/recipe/search?num=1&tag=${item3}">#${item3} </a></c:forTokens>
							<c:forTokens items="${list.r_tag4}" delims="," var="item4"><a href="/recipe/search?num=1&tag=${item4}">#${item4} </a></c:forTokens>
						</div>
					</div>
				</c:forEach>
			<c:choose>
				<c:when test="${empty searchRecipe}">
					<div id="emptyBox">
						<div class="emptyMsg">
							<h1><i class="fas fa-exclamation-circle"></i></h1>
							<h4>선택한 재료에 해당하는 레시피가 없습니다!</h4>
							<input type="button" onclick="location.href='/recipe/create'" value="내 레시피 등록하러 가기">
						</div>
					</div>
				</c:when>
			</c:choose>
				

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