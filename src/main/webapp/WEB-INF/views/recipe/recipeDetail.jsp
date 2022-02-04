<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<!-- 댓글 작성 시 로그인 링크 스타일 -->
<style type='text/css'>
.commentWriter a:link    {color:red;text-decoration:none;}  /* 아직 방문하지 않은경우 */
.commentWriter a:hover  {color:red; text-decoration:none; } /* 마우스 링크 위 올려 놓았을때*/
/* 댓글 작성 시 로그인 링크 스타일  */
</style>
</head>
<body>
	<section id="ViewContainer">
		<div id="RecipeContainer">
			<div id="RecipeDetail">
				<div class="WriterInfo"> 
					<img src="/resources/img/recipe_img/recipe_default_pro.png" class="default" />
					<p>${rvo.r_nickname }</p>
					<h2>${rvo.r_subject }</h2>
					<span><fmt:formatDate value="${rvo.r_date }" pattern="yyyy.MM.dd" /></span><br>
					<c:forEach var="tag1" items="${tag1}">
					<button onclick="location.href='/recipe/search?num=1&tag=${tag1 }'">#${tag1 }</button>
					</c:forEach>
					<c:forEach var="tag2" items="${tag2}">
					<button onclick="location.href='/recipe/search?num=1&tag=${tag2 }'">#${tag2 }</button>
					</c:forEach>
					<c:forEach var="tag3" items="${tag3}">
					<button onclick="location.href='/recipe/search?num=1&tag=${tag3 }'">#${tag3 }</button>
					</c:forEach>
					<c:forEach var="tag4" items="${tag4}">
					<button onclick="location.href='/recipe/search?num=1&tag=${tag4 }'">#${tag4 }</button>
					</c:forEach>
					<hr>					
				</div>
				<div class="RecipeInfo">
					<div class="mainPic">
						<img src="/resources/photo_upload/${rvo.r_file}">
					</div>
					<div class="kcalAndTime">
						<ul>
							<li>맛의 단위 <span class="point">${rvo.r_kcal }</span> kcal</li>
							<li>소요시간 <span class="point">${rvo.r_cooking_time }</span> min</li>
						</ul>						
						<hr>
						<p><span class="color">어떤 음식인가요? | </span> ${rvo.r_introduce }</p>
						<p><span class="color">필요한 재료 | </span> ${rvo.r_ing }</p>

					</div>
					<div class="RecipeContent">
						<h2>HOW TO MAKE?</h2>
						${rvo.r_content }
					</div>
					<div class="RecipeFooter">
						<hr>
						<ul>
							<li><span class="point">조회수</span> ${rvo.r_hit }</li>
							<li><span class="point">좋아요 2</span> ${rvo.r_like_count }</li>
							<li><span class="point">댓글 3</span> </li>
						</ul>
						
						<ul class="RightSide">
							<li>
							
							<button type="button" id="likeBtn" class="btn btn-info" onclick="updateLike()">
							<i class="far fa-heart likeIcon"></i> &nbsp;추천<c:out value="${rvo.r_like_count }"></c:out>
							</button>
							
							</li>
							 <!-- 닉네임 있으면서, 닉네임이랑 작성한 닉네임이랑 같은경우 -->
							 <c:if test="${(nickname ne null && nickname eq rvo.r_nickname)||(nickname eq '관리자')}"> 
								<li><button onclick="location.href='/recipe/modify?r_bno=${rvo.r_bno}'">수정하기</button></li>
								<li><button onclick="location.href='/recipe/delete?r_bno=${rvo.r_bno}'">삭제하기</button></li>
							 </c:if>
							<li><button onclick="location.href='/recipe/recipeListSearch?num=1'">목록보기</button></li>
						</ul>
						
					</div>
						
	
			<div id="CommentContainer">
				<h4>댓글</h4>
				<!-- 댓글 목록 보이는 영역 -->
				<div class="container">
		      	  <div class="commentList"></div>
		    	</div>
		    	<!-- 댓글 목록 보이는 영역 -->
			</div>

			<!--  댓글  -->
			<div id="CommentContainer">
		   	    <div class="container">
			        <label for="content">댓글작성</label>
			        <form name="commentInsertForm" onsubmit ="return check();">
			        	<div class="commentWriter">
			            <div class="input-group">
			               <input type="hidden" name="r_c_bno" value="${rvo.r_bno}"/>
			               
			               <!-- 회원만 댓글 작성 가능 -->
			               <c:choose>
								<c:when test="${(nickname eq null )}"> <div><a href="/user/login">로그인</a>시에만 댓글 작성 가능합니다.</div>
								</c:when>
								<c:otherwise>
								<input type="text" class="form-control" id="nickname" name="r_c_nickname" value = "${nickname}" readonly> 
							<!-- 회원만 댓글 작성 가능 아래 닫는 태그 있음-->
			               
		
			               
			               
			               <!-- 평점시작 -->
								  <label>평점</label>
								  <div class="startRadio" style="transform:translateY(3px);">
									    <label class="startRadio__box">
									        <input type="radio" name="r_c_rating" id="p1" value="1">
									        <span class="startRadio__img" ><span class="blind">별 1개</span></span>
									    </label>								    
									
									    <label class="startRadio__box">
									        <input type="radio" name="r_c_rating" id="p2" value="2">
									        <span class="startRadio__img"><span class="blind">별 2개</span></span>
									    </label>						    
										    
									    <label class="startRadio__box">
									        <input type="radio" name="r_c_rating" id="p3" value="3">
									        <span class="startRadio__img"><span class="blind">별 3개</span></span>
									    </label>							    
									
									    <label class="startRadio__box">
									        <input type="radio" name="r_c_rating" id="p4" value="4">
									        <span class="startRadio__img"><span class="blind">별 4개</span></span>
									    </label>							    
									
									    <label class="startRadio__box">
									        <input type="radio" name="r_c_rating" id="p5" value="5">
									        <span class="startRadio__img"><span class="blind">별 5개</span></span>
									    </label>
						          </div>
						          
							 <!-- 별점 유효성 체크 -->
							 <!-- <script>
							 function check(){
							   if($('[name=r_c_rating]')){
									alert("별점을 입력하시오!"); 
									$('[name=r_c_rating]').focus(); 
									return false;  
								}
							 }
							</script> -->
							 
			               <!-- 평점 끝 -->
			               </div>
			               <textarea cols="107" rows="5" class="form-control" id="content" name="r_c_content"></textarea>
			               
			               <span class="input-group-btn">
			                    <button class="commentSubmit btn btn-default" type="button" name="commentInsertBtn">COMMENT</button>
			               </span>
			              </div>
			        </form>
			    </div>
			 </div>
		  <!-- 회원만 댓글 작성 가능 닫는 태그-->
		 </c:otherwise>
		</c:choose>
		<!-- 회원만 댓글 작성 가능 -->
		    <!-- 댓글 끝 -->
		</div>
		</div>
	</div>
	</section>


			<!--  댓글창  -->
			<%@ include file="viewReply.jsp"%>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>