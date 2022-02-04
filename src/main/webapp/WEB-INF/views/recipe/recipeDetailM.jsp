<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
	<section id="ViewContainer">
		<div id="RecipeContainer_detail">
			<div id="RecipeDetail">
				<div class="WriterInfo"> 
					<img src="/resources/img/recipe_img/recipe_default_pro.png" class="default" />
					<p>닉네임</p>
					<h2>제목</h2>
					<hr>					
				</div>
				<div class="RecipeInfo">
					<div class="kcalAndTime">
						<ul>
							<li><span class="point">칼로리</span> kcal</li>
							<li><span class="point">소요시간</span> min</li>
						</ul>						
						<hr>
						<p><span class="color">어떤 음식인가요? | </span> 음식소개</p>
						<p><span class="color">필요한 재료 | </span> 재료소개</p>

					</div>
					<div class="RecipeContent">
						<h2>HOW TO MAKE?</h2>
						컨텐츠
					</div>
					<div class="RecipeFooter">
						<hr>
						<ul>
							<li><span class="point">조회수</span> 조회수</li>
							<li><span class="point">좋아요</span> 좋아요</li>
							<li><span class="point">댓글</span> </li>
						</ul>
						<ul class="RightSide">
							<li><button onclick="location.href='/recipe/modify?r_bno=1'">수정하기</button></li>
							<li><button onclick="location.href='/recipe/delete?r_bno=1'">삭제하기</button></li>
							<li><button onclick="location.href='/recipe/recipeList?num=1'">목록보기</button></li>
						</ul>
						
					</div>
						
				</div>
				
				
			</div>
		</div>
	</section>
