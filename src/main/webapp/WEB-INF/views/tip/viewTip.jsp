<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생활꿀팁</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
<!-- 댓글 작성 시 로그인 링크 스타일 -->
<style type='text/css'>
.commentWriter a:link    {color:red;text-decoration:none;}  /* 아직 방문하지 않은경우 */
.commentWriter a:hover  {color:red; text-decoration:none; } /* 마우스 링크 위 올려 놓았을때*/
/* 댓글 작성 시 로그인 링크 스타일  */
</style>
</head>
<body>
	<section id="ViewContainer">
		<div id="TipContainer">
			<div id="TipDetail">
				<div class="WriterInfo"> 
					<img src="/resources/img/recipe_img/recipe_default_pro.png" class="default" />
					<c:forEach items="${readTip}" var="list" status="status">
						${list.t_avg}
						${status.index}
					<p><img src="/resources/img/tip_img/starline.png" style="background-color: #bf956b"></p>
					
					</c:forEach>
					<p>${readTip.t_nickname }</p>
					<h2>${readTip.t_subject }</h2>
					<span><fmt:formatDate value="${readTip.t_date }" pattern="yyyy.MM.dd" /></span><br>
					<hr>
				</div>	
			<form role="form" method="post" autocomplete="off">

				<div class="TipContent">
						<h2>TRY THIS TIP!</h2>
						<div class="tipContent">
							${readTip.t_content }
						</div>
				</div>
			</form>
			
			<div class="TipFooter">
				<hr>
				<ul>
					<li><span class="point">조회수</span> ${readTip.t_hit}</li>
					<li>
					<i class="fas fa-heart likeIcon" id="heart"></i>
					<span class="point" id="likey">좋아요</span> ${readTip.t_like_count }</li>
					<li><span class="point">댓글</span> </li>
				</ul>

				<ul class="RightSide">
				 <!-- 닉네임 있으면서, 닉네임이랑 작성한 닉네임이랑 같은경우 -->
				 <c:if test="${(nickname ne null && nickname eq readTip.t_nickname)||(nickname eq '관리자')}"> 
					<li><button onclick="location.href='/tip/updateTip?t_bno=${readTip.t_bno}'">수정하기</button></li>
					<li><button onclick="location.href='/tip/deleteTip?t_bno=${readTip.t_bno}'">삭제하기</button></li>
				 </c:if>	
				 <!-- 닉네임 있으면서, 닉네임이랑 작성한 닉네임이랑 같은경우 -->
					<li><button onclick="location.href='/tip/listPageSearch?num=1'">목록보기</button></li>
				</ul>
			</div>
			
			<div class="">
				<script>
					$(document).ready(function() {

						var formObj = $("form[role='form']");

						$("#modify_Btn").click(function() {
							formObj.attr("action", "/tip/updateTip");
							formObj.attr("method", "get")
							formObj.submit();
						});

						$("#delete_Btn").click(function() {
							var con = confirm("정말로 삭제하시겠습니까?");

							if (con) {
								formObj.attr("action", "/tip/deleteTip");
								formObj.submit();
							}
						});

					}
						
				</script>
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
			               <input type="hidden" name="t_c_bno" value="${readTip.t_bno}"/>
			               
			               <!-- 회원만 댓글 작성 가능 -->
			               <c:choose>
								<c:when test="${(nickname eq null )}"> <div><a href="/user/login">로그인</a>시에만 댓글 작성 가능합니다.</div>
								</c:when>
								<c:otherwise>
								<input type="text" class="form-control" id="nickname" name="t_c_nickname" value = "${nickname}" readonly> 
							<!-- 회원만 댓글 작성 가능 아래 닫는 태그 있음-->	
			               
			               <!-- 평점시작 -->
								  <label>평점</label>
								  <div class="startRadio" style="transform:translateY(3px);">
									    <label class="startRadio__box">
									        <input type="radio" name="t_c_rating" id="p1" value="1">
									        <span class="startRadio__img" ><span class="blind">별 1개</span></span>
									    </label>								    
									
									    <label class="startRadio__box">
									        <input type="radio" name="t_c_rating" id="p2" value="2">
									        <span class="startRadio__img"><span class="blind">별 2개</span></span>
									    </label>						    
										    
									    <label class="startRadio__box">
									        <input type="radio" name="t_c_rating" id="p3" value="3">
									        <span class="startRadio__img"><span class="blind">별 3개</span></span>
									    </label>							    
									
									    <label class="startRadio__box">
									        <input type="radio" name="t_c_rating" id="p4" value="4">
									        <span class="startRadio__img"><span class="blind">별 4개</span></span>
									    </label>							    
									
									    <label class="startRadio__box">
									        <input type="radio" name="t_c_rating" id="p5" value="5">
									        <span class="startRadio__img"><span class="blind">별 5개</span></span>
									    </label>
						          </div>
							 
			               <!-- 평점 끝 -->
			               </div>
			               <textarea cols="134" rows="5" class="form-control" id="content" name="t_c_content"></textarea>
			               
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
	</section>
			<!--  댓글창  -->
			<%@ include file="viewReply.jsp"%>
			
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>