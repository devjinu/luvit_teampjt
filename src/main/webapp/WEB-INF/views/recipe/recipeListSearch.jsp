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
			<!-- 슬라이드 영역 -->
			<div class="slide">
			  <ul class="panel">
			    <li>
			    <div class="recipe_main_banner_copybox">
					<h2>Today's Recipe</h2>
					<p>고소한 캐슈넛과 크림치즈에 리치를 올려 만든 <br>건강한 맛, 정갈한 모양새의 퓨전 디저트</p>
					<input type="button" value="레시피 보러가기">
				</div>
				</li>
			    <li>
			    	<div class="recipe_main_banner_copybox">
					<h2>Best Recipe</h2>
					<p>토마토와 통밀 도우, 너트만으로도 충분하다! <br>다이어터와 비건을 위한 토마토 피자!</p>
					<input type="button" value="레시피 보러가기">
					</div>
			    </li>
			    <li>
			    	<div class="recipe_main_banner_copybox">
					<h2>Hot Recipe</h2>
					<p>맛살과 새우로 바다의 맛을 낼 수 있다? <br>깊은 감칠맛이 나는 해물 야끼소바 비법!</p>
					<input type="button" value="레시피 보러가기">
				</div>
			    </li>
			  </ul>
			  <ul class="dot">
			    <li class="on">슬라이드 버튼1번</li>
			    <li>슬라이드 버튼2번</li>
			    <li>슬라이드 버튼3번</li>
			  </ul>
			</div>
		<!-- 슬라이드 영역 -->
			</div>
			
			<div id="recipe_searchbox">
					<select name="searchType">
					<option value="title" <c:if test="${page.searchType eq 'title'}">selected</c:if>>제목</option>
			        <option value="content" <c:if test="${page.searchType eq 'content'}">selected</c:if>>내용</option>
				     <option value="title_content" <c:if test="${page.searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
				     <option value="writer" <c:if test="${page.searchType eq 'writer'}">selected</c:if>>작성자</option>
				</select>
				<input type="text" name="keyword" value="${page.keyword }"/>
				<input type="button" id="searchBtn" value="검색">
				<div class="tagBox">			
					<c:forTokens items="${bestTag2}" delims="," var="bestItem2"><a href="/recipe/search?num=1&tag=${bestItem2}"><button>#${bestItem2}</button></a></c:forTokens>
					<c:forTokens items="${bestTag3}" delims="," var="bestItem3"><a href="/recipe/search?num=1&tag=${bestItem3}"><button>#${bestItem3}</button></a></c:forTokens>
					<c:forTokens items="${bestTag4}" delims="," var="bestItem4"><a href="/recipe/search?num=1&tag=${bestItem4}"><button>#${bestItem4}</button></a></c:forTokens>
				</div>
			</div>
			
			<div id="recipe_thumbnail">
				<h2>레시피 보기</h2>
				<button class="create_btn" onclick="location.href='/recipe/create'">레시피 등록</button>
				<div class="clear"></div>
				<c:forEach items="${list}" var="list">
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

			<div class="clear"></div>
			
			<div class="paging">
				<c:if test="${page.prev}">
				 <span>[ <a href="/recipe/recipeListSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
				</c:if>
				
				<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
				 <span>
				 
				  <c:if test="${select != num}">
				   <a href="/recipe/recipeListSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
				  </c:if>    
				  
				  <c:if test="${select == num}">
				   <b>${num}</b>
				  </c:if>
				    
				 </span>
				</c:forEach>
				
				<c:if test="${page.next}">
				 <span>[ <a href="/recipe/recipeListSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
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

	document.getElementById("searchBtn").onclick = function(){
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
	location.href="/recipe/recipeListSearch?num=1"+"&searchType="+searchType+"&keyword="+keyword;
};
</script>
<script>
$(document).ready(function() {
	  slide();
	});
	// 슬라이드 
	function slide() {
	  var wid = 0;
	  var now_num = 0;
	  var slide_length = 0;
	  var auto = null;
	  var $dotli = $('.dot>li');
	  var $panel = $('.panel');
	  var $panelLi = $panel.children('li');

	  // 변수 초기화
	  function init() {
	    wid = $('.slide').width();
	    now_num = $('.dot>li.on').index();
	    slide_length = $dotli.length;
	  }

	  // 이벤트 묶음
	  function slideEvent() {

	    // 슬라이드 하단 dot버튼 클릭했을때
	    $dotli.click(function() {
	      now_num = $(this).index();
	      slideMove();
	    });

	    // 이후 버튼 클릭했을때
	    $('.next').click(function() {
	      nextChkPlay();
	    });

	    // 이전 버튼 클릭했을때
	    $('.prev').click(function() {
	      prevChkPlay();
	    });

	    // 오토플레이
	    autoPlay();

	    // 오토플레이 멈춤
	    autoPlayStop();

	    // 오토플레이 재시작
	    autoPlayRestart();

	    // 화면크기 재설정 되었을때
	    resize();
	  }

	  // 자동실행 함수
	  function autoPlay() {
	    auto = setInterval(function() {
	      nextChkPlay();
	    }, 3000);
	  }

	  // 자동실행 멈춤
	  function autoPlayStop() {
	    $panelLi.mouseenter(function() {
	      clearInterval(auto);
	    });
	  }


	  // 자동실행 멈췄다가 재실행
	  function autoPlayRestart() {
	    $panelLi.mouseleave(function() {
	      auto = setInterval(function() {
	        nextChkPlay();
	      }, 3000);
	    });
	  }

	  // 이전 버튼 클릭시 조건 검사후 슬라이드 무브
	  function prevChkPlay() {
	    if (now_num == 0) {
	      now_num = slide_length - 1;
	    } else {
	      now_num--;
	    }
	    slideMove();
	  }

	  // 이후 버튼 클릭시 조건 검사후 슬라이드 무브
	  function nextChkPlay() {
	    if (now_num == slide_length - 1) {
	      now_num = 0;
	    } else {
	      now_num++;
	    }
	    slideMove();
	  }

	  // 슬라이드 무브
	  function slideMove() {
	    $panel.stop().animate({
	      'margin-left': -wid * now_num
	    });
	    $dotli.removeClass('on');
	    $dotli.eq(now_num).addClass('on');
	  }

	  // 화면크기 조정시 화면 재설정
	  function resize() {
	    $(window).resize(function() {
	      init();
	      $panel.css({
	        'margin-left': -wid * now_num
	      });
	    });
	  }
	  init();
	  slideEvent();
	}
	// 슬라이드 

</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>

</html>