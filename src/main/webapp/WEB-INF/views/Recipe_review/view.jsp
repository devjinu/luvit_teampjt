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
					<p>${view.r_r_nickname }</p>
					<h2>${view.r_r_subject }</h2>
					<span><fmt:formatDate value="${view.r_r_date }" pattern="yyyy.MM.dd" /></span><br>
					<hr>					
				</div>
				<div class="RecipeInfo">
					<div class="RecipeContent">
						<h2>HOW TO MAKE?</h2>
						${view.r_r_content }
					</div>
					<div class="RecipeFooter">
						<hr>
						<ul>
							<li><span class="point">조회수</span> ${view.r_r_hit }</li>
							<li><span class="point">좋아요</span> </li>
							<li><span class="point">댓글</span> </li>
						</ul>
						<ul class="RightSide">
							<!-- 아이디 있으면서, 이름이랑 아이디랑 같은경우 -->
					 		<c:if test="${(id ne null && id eq view.r_r_id)||(id eq 'admin')}">  
								<li><button onclick="location.href='/Recipe_review/modify?r_r_bno=${view.r_r_bno}'">수정하기</button></li>
								<li><button onclick="location.href='/Recipe_review/delete?r_r_bno=${view.r_r_bno}'">삭제하기</button></li>
							</c:if>
							<li><button onclick="location.href='/Recipe_review/listPageSearch?num=1'">목록보기</button></li>
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
					        <form name="commentInsertForm">
					        	<div class="commentWriter">
									<div class="input-group">
										<input type="hidden" name="r_r_c_bno" value="${view.r_r_bno}"/>
						 				<!-- 회원만 댓글 작성 가능 -->
						               <c:choose>
											<c:when test="${(nickname eq null )}"> <div><a href="/user/login">로그인</a>시에만 댓글 작성 가능합니다.</div>
											</c:when>
											<c:otherwise>
						 						<input type="text" class="form-control" id="nickname" name="r_r_c_nickname" value = "${nickname}" readonly>
					         			<!-- 회원만 댓글 작성 가능 아래 닫는 태그 있음-->	
					         		</div>
									<textarea cols="134" rows="5" class="form-control" id="content" name="r_r_c_content"></textarea>
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
			<%@ include file="viewComment.jsp"%>
			
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>