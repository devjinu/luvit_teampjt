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
		<div id="TipContainer">
			<h1>자취생 노하우</h1>
			<div class="tip_main_banner">
				<img src="/resources/img/recipe_img/recipe_main_banner.jpg" />
				<div class="tip_main_banner_copybox">
					<h2>Today's Tip</h2>
					<p>여기 인기 팁이나 오늘의 팁 같은 거 <br>슬라이드 돌리면 좋을 것 같음</p>
				</div>
			</div>
			<c:forEach items="${list}" var="list">
				<div id="tipContentBox">
					<div class="tipThumbnail">
						<a href="/tip/viewTip?t_bno=${list.t_bno}"><img src="/resources/img/tip_img/tip_thumEx1.jpg" /></a>
					</div> 
					<div class="tipInfoBox">
						<h2><a href="/tip/viewTip?t_bno=${list.t_bno}">Tip ${list.t_bno}</a></h2>
						<h3><a href="/tip/viewTip?t_bno=${list.t_bno}">${list.t_subject}</a></h3>
						<p><a href="/tip/viewTip?t_bno=${list.t_bno}">${list.t_content}</a></p>
						<h4></h4>
					</div>
					<div class="hrLine"></div>
					<div class="tipIDBox">
						<div class="miniBox">
							<div class="thumnail_propic">
								<img src="/resources/img/recipe_img/thum_icon1.png" />
							</div>
							<p class="nickname">${list.t_nickname}</p>
							<p class="dayHit"><fmt:formatDate value="${list.t_date }" pattern="yyyy.MM.dd" /> · ${list.t_hit} hit</p>
							<ul>
							<li><i class="far fa-heart likeIcon"></i>  ${list.t_like_count }</li> <!-- 좋아요 -->
							<li><i class="fas fa-share-alt normalIcon"></i></li><!-- 공유 -->
							<li><i class="fas fa-comment-dots normalIcon"></i></li><!-- 댓글 -->
						</ul>
						</div>
						
					</div>
					<div class="clear"></div>
				</div>
			</c:forEach>
			<div class="writeButton">
				<input type="button" value="글쓰기" onclick="location.href='/tip/insertTip'">
			</div>
			<div class="clear"></div>
			<div id="pageBox">
				<div class="paging">
				<c:if test="${page.prev}">
					<span><a href="/tip/listPage?num=${page.startPageNum - 1}"><i class="fas fa-long-arrow-alt-left"></i></a></span>
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
						<span><a href="/tip/listPage?num=${page.endPageNum + 1}"><i class="fas fa-long-arrow-alt-right"></i></a></span>
					</c:if>
				</div>
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
	</script>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>