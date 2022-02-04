<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>

	<section id="ViewContainer">
		<div id="TipContainer">

		<c:choose>
			<c:when test="${review3.s_product ne null}"> <h1>[${review3.s_product}] 상품 후기</h1> </c:when>
			<c:otherwise> <h1>상품 후기가 없습니다. </h1>
			<div><a href="/store_review/finsert?no=${s_r_pno}"><input type="button" value="리뷰등록"/></a></div> 
			</c:otherwise>
		</c:choose>

		     
		<br>
		
		<div class="store_main_banner img1">
				<img src="/resources/img/store_review_img/brooke-lark-GJMlSBS0FhU-unsplash.jpg"/> 
			</div>
		
		  <c:forEach var = "list" items="${list}"> 
			
			<div id="tipContentBox">
		  		<div class="tipThumbnail">
					<a href="/store_review/review?s_r_bno=${list.s_r_bno }"> <img src="/resources/photo_upload/${list.s_r_thumbnail }"></a>
				</div> 
		  		<div class="tipInfoBox">
					<h3><a href = "/store_review/review?s_r_bno=${list.s_r_bno}">${list.s_r_subject }</a></h3>
					<%-- <p><a href="/store_review/review?s_r_bno=${list.s_r_bno }">${list.s_r_contents}</a></p> --%>
					<p>[카테고리]  <a href = "/store_review/listCate?num=1&s_r_cate=${list.s_r_cate }">${list.s_r_cate }</a></p><br>
					<script>
						var innerHtml = "";
		
						 switch(${list.s_r_rating}){
						 	case 1 : innerHtml  +=   "★☆☆☆☆" 
							 break; 
						 	case 2 : innerHtml  +=   "★★☆☆☆" 
						 	 break;  
						 	case 3 : innerHtml  +=   "★★★☆☆" 
						 	 break; 
						 	case 4 : innerHtml  +=   "★★★★☆" 
						 	 break;
						 	case 5 : innerHtml  +=   "★★★★★"
						 	 break;	
						 	default : innerHtml  +=   "☆☆☆☆☆";
						 	
						  }
		
						document.write("평점 "+innerHtml); 
					</script>
					<h4></h4>
				</div>
				<div class="hrLine"></div>	
		  
				<div class="tipIDBox">
					<div class="miniBox">
						<div class="thumnail_propic">
							<img src="/resources/img/recipe_img/thum_icon1.png" />
						</div>
						<br>
						<p class="nickname"><i class="fa fa-user">&nbsp${list.s_r_nickname }</i></p><br>
						<p class="dayHit"><i class="fa fa-calendar">&nbsp<fmt:formatDate value="${list.s_r_date }" pattern="yyyy.MM.dd" /></i> · <i class="fa fa-eye">&nbsp${list.s_r_hit}</i></p>
						<%-- <ul>
							<li><i class="far fa-heart likeIcon"></i>  ${list.s_r_like_count }</li> <!-- 좋아요 -->
							<li><i class="fas fa-share-alt normalIcon"></i></li><!-- 공유 -->
							<li><i class="fas fa-comment-dots normalIcon"></i></li><!-- 댓글 -->
						</ul> --%>
					</div>
					
				</div>
				<div class="clear"></div>	
			 </div>	

			</c:forEach> 
		
		<div class="clear"></div>
		<div id="pageBox">
			<div class="paging">
			<c:if test="${page.prev}">
				<span><a href="/store_review/listPage?num=${page.startPageNum - 1}&no=${s_r_pno}"><i class="fas fa-long-arrow-alt-left"></i></a></span>
			</c:if>
			<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				<span>
					<c:if test="${select != num}"><a href="/store_review/listPage?num=${num}&no=${s_r_pno}">${num}</a> </c:if>
					<c:if test="${select == num}"><b>${num}</b></c:if>
				</span>
			</c:forEach>
			<c:if test="${page.next}">
				<span><a href="/store_review/listPage?num=${page.endPageNum + 1}&no=${s_r_pno}"><i class="fas fa-long-arrow-alt-right"></i></a></span>
			</c:if>
			</div>
		</div>
	</div>
</section>

 <%@ include file="../include/footer.jsp" %>

</body>
</html>