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
<title>Recipe_review list</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script type="text/javascript">
	var result='${msg}';
	if(result=='성공'){
		alert('후기를 등록하였습니다.');
	}
</script>
</head>
<body>

<section id="ViewContainer">
	<div id="RecipeContainer">
		<h1>레시피 후기</h1>
		<div class="recipe_main_banner">
			<img src="/resources/img/recipe_img/recipe_main_banner.jpg" />
			<div class="recipe_main_banner_copybox">
				<h2>Today's Review</h2>
				<p>여기 추천레시피나 오늘의 레시피 같은 거 <br>슬라이드 돌리면 좋을 것 같음</p>
			</div>
		</div>
		
	<div id="recipe_searchbox">
		<select name="searchType">
			<option value="r_r_subject" <c:if test="${page.searchType eq 'r_r_subject'}">selected</c:if>>제목</option>
	        <option value="r_r_content" <c:if test="${page.searchType eq 'r_r_content'}">selected</c:if>>내용</option>
	     	<option value="r_r_subject_content" <c:if test="${page.searchType eq 'r_r_subject_content'}">selected</c:if>>제목+내용</option>
	     	<option value="r_r_nickname" <c:if test="${page.searchType eq 'r_r_nickname'}">selected</c:if>>작성자</option>
		</select>
		<input type="text" name="keyword" value="${page.keyword}" />
		<input type="button" value="검색" id="searchBtn">
	</div>
	
		<div id="recipe_thumbnail">
			<h2>후기 보기</h2>
			<button class="create_btn" onclick="location.href='/Recipe_review/write'">후기 등록</button>
			<div class="clear"></div>
			<c:forEach items="${list }" var="list">
				<div class="thumbnail_box">
					<div class="thumnail_propic">
						<img src="/resources/img/recipe_img/thum_icon${random}.png" />
					</div>
					<div class="thumnail_introduce">
						<p> ${list.r_r_nickname} </p>
						<span><a href="/Recipe_review/view?r_r_bno=${list.r_r_bno}">${list.r_r_subject }</a></span>
					</div>
					<div class="clear"></div>
					<div class="thumnail_pic">
						<div class="scale"><a href="/Recipe_review/view?r_r_bno=${list.r_r_bno}"><img src="/resources/photo_upload/${list.r_r_thumbnail}"></a></div>
					</div>
					<ul>
						<li><i class="far fa-heart likeIcon"></i></li> <!-- 좋아요 -->
						<li><i class="fas fa-share-alt normalIcon"></i></li><!-- 공유 -->
						<li><i class="fas fa-comment-dots normalIcon"></i></li><!-- 댓글 -->
					</ul>
					<div class="thumnail_content"><a href="/Recipe_review/view?r_r_bno=${list.r_r_bno}">${list.r_r_subject}</a></div>
				</div>
			</c:forEach>
		</div>
		
		<div class="clear"></div>

	<div class="paging">
		<c:if test="${page.prev}">
			<span>[ <a href="/Recipe_review/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
		</c:if>
			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				<span>
					<c:if test="${select != num}">
						<a href="/Recipe_review/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
					</c:if>    
					<c:if test="${select == num}">
						<b>${num}</b>
					</c:if>
				</span>
			</c:forEach>
		<c:if test="${page.next}">
			<span>[ <a href="/Recipe_review/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
		</c:if>
	</div>

	</div>
</section>

<script>
	document.getElementById("searchBtn").onclick = function () {
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
		location.href = "/Recipe_review/listPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
	};
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>