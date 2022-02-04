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
			<h1>[${s_r_cate}] 상품 후기</h1><br>
			<div class="store_main_banner img1">
				<img src="/resources/img/store_review_img/brooke-lark-gRzsb3H_WV0-unsplash.jpg"/> 
			</div>
			<br>
    
		 <c:forEach var = "list2" items="${list2 }"> 
			<div id="tipContentBox">
		  		<div class="tipThumbnail">
					<a href="/store_review/review?s_r_bno=${list2.s_r_bno }"> <img src="/resources/photo_upload/${list2.s_r_thumbnail }"></a>
				</div> 
		  		<div class="tipInfoBox">
					<h3><a href = "/store_review/review?s_r_bno=${list2.s_r_bno}">${list2.s_r_subject }</a></h3>
					<%-- <p><a href="/store_review/review?s_r_bno=${list2.s_r_bno }">${list2.s_r_contents}</a></p> --%>
					<p>[카테고리]  <a href = "/store_review/listCate?num=1&s_r_cate=${list2.s_r_cate }">${list2.s_r_cate }</a></p><br>
					<script>
						var innerHtml = "";
		
						 switch(${list2.s_r_rating}){
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
						<p class="nickname"><i class="fa fa-user">&nbsp${list2.s_r_nickname }</i></p><br>
						<p class="dayHit"><i class="fa fa-calendar">&nbsp<fmt:formatDate value="${list2.s_r_date }" pattern="yyyy.MM.dd" /></i> · <i class="fa fa-eye">&nbsp${list2.s_r_hit}</i></p>
						<%-- <ul>
							<li><i class="far fa-heart likeIcon"></i>  ${list2.s_r_like_count }</li> <!-- 좋아요 -->
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
			<span><a href="/store_review/listCate?num=${page.startPageNum - 1}&s_r_cate=${s_r_cate}"><i class="fas fa-long-arrow-alt-left"></i></a></span>
		</c:if>
		<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
			<span>
				<c:if test="${select != num}"><a href="/store_review/listCate?num=${num}&s_r_cate=${s_r_cate}">${num}</a> </c:if>
				<c:if test="${select == num}"><b>${num}</b></c:if>
			</span>
		</c:forEach>
		<c:if test="${page.next}">
			<span><a href="/store_review/listCate?num=${page.endPageNum + 1}&s_r_cate=${s_r_cate}"></i></a></span>
		</c:if>
		</div>
	</div>
	
	</div>
</section>
	
<!-- <div>
<a href="/store_review/finsert/">리뷰 작성</a> 상품번호 가져와야 되는데 상품번호를 받을수없음 전체 후기가 다 보이는 거라
</div> -->




 <%@ include file="../include/footer.jsp" %>

	
</body>
</html>