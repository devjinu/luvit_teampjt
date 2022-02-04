<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
</head>
<body>

	<section id="MainContainer">
		<div id="MainArea">
		<!-- 슬라이드 영역 -->
			<div class="slide">
			  <ul class="panel">
			    <li>1번슬라이드</li>
			    <li>2번슬라이드</li>
			    <li>3번슬라이드</li>
			  </ul>
			  <ul class="dot">
			    <li class="on">슬라이드 버튼1번</li>
			    <li>슬라이드 버튼2번</li>
			    <li>슬라이드 버튼3번</li>
			  </ul>
			  <div class="prev">
			  	<a href="javascript:" class="code_view actionBtn11">
				 <span class="hover"></span>
				 <span class="txt">Preview</span>
				</a>
			  </div>
			  <div class="next">
			  	<a href="javascript:" class="code_view actionBtn10">
				 <span class="hover"></span>
				 <span class="txt">Next</span>
				</a>
			  </div>
			  <div class="MainCopy">
			  	<h4>오늘 뭐 먹지?</h4>
			  	<h1>당신을 위한 레시피를<br>
			  	확인해보세요.</h1>
			  	
			  	<div class="searchBox">
			  	<form method="get"> 
			  		<div style="display:none;">
			  		<select name="searchType">
					<option value="title" selected>제목</option>
					</select>
				    </div>
				     <input type="text" id="searchForm" name="keyword" placeholder="케이크"><input type="button" id="searchBtn">
			  	</form>
			  		<button class="tagButton" onclick="location.href='/recipe/search?num=1&tag=자취생요리'">#자취생요리</button>
			  		<button class="tagButton" onclick="location.href='/recipe/search?num=1&tag=고기'">#고기</button>
			  		<button class="tagButton" onclick="location.href='/recipe/search?num=1&tag=베이킹_디저트'">#디저트만들기</button>
			  		<button class="tagButton" onclick="location.href='/recipe/search?num=1&tag=술안주'">#술안주</button>
			  	</div>
			  </div>
			</div>
			<div class="dark"></div>
		<!-- 슬라이드 영역 -->
		<!-- 애잇 소개 -->
		<div id="introduce">
			<div class="introCopy">
				<div class="view_tit">
					오늘은 뭐라도 직접 해 먹어야지.
				</div>
				<div class="view_txt">
				단단히 마음을 먹고 요리 레시피를 찾아보면<br />
				먹다 남은 채끝살이 어쩌고, 냉장고에 있던 로즈마리 잎이 어쩌고...<br />
				도무지 내 냉장고에는 없을 것 같은 재료 목록에 맥이 빠졌던 당신을 위해.<br />
				'내 냉장고'에 있는 재료들로도 가능한 요리 레시피들을 소개합니다!
				</div>
			</div>
		</div>
		<!-- 애잇 소개 -->
		<div id="ContentsArea">
			<h1>LOVE.EAT</h1>
			<p>애잇의 주요 콘텐츠들을 한 눈에 확인해보세요.</p>
			<div id="conBoxSet">
				<div id="conBox1" class="colorGSB shadowEf">
					<img src="/resources/img/main/content01.jpg" class="img100">
					<div class="textBox">
						<p>LOVE.EAT CONTENTS<span class="line"></span>#1</p>
						<h1>Recipe<br/>Review</h1>
					</div>
					<div class="btnBox">
						<a href="/Recipe_review/listPageSearch?num=1" class="actionBtn14">
						 <span class="lb">VIEW PAGE</span>
						 <span class="line"></span>
						</a>
					</div>
				</div>
				<div id="conBox2" class="colorGSB shadowEf">
					<img src="/resources/img/main/content02.jpg" class="img100">
					<div class="textBox">
						<p>LOVE.EAT CONTENTS<span class="line"></span>#2</p>
						<h1>Try this<br/>Recipe</h1>
					</div>
					<div class="btnBox">
						<a href="/recipe/recipeList?num=1" class="actionBtn14">
						 <span class="lb">VIEW PAGE</span>
						 <span class="line"></span>
						</a>
					</div>
				</div>
				<div id="conBox3" class="colorGSB shadowEf">
					<img src="/resources/img/main/content03.jpg" class="img100">
					<div class="textBox">
						<p>LOVE.EAT CONTENTS<span class="line"></span>#3</p>
						<h1>Love.EAT <br/>STORE</h1>
					</div>
					<div class="btnBox">
						<a href="/store/storeList?num=1" class="actionBtn14">
						 <span class="lb">VIEW PAGE</span>
						 <span class="line"></span>
						</a>
					</div>
				</div>
				<div id="conBox4" class="colorGSB shadowEf">
					<img src="/resources/img/main/content04.jpg" class="img100">
					<div class="textBox">
						<p>LOVE.EAT CONTENTS<span class="line"></span>#4</p>
						<h1>Living tip<br/>For you</h1>
					</div>
					<div class="btnBox">
						<a href="/tip/listPage?num=1" class="actionBtn14">
						 <span class="lb">VIEW PAGE</span>
						 <span class="line"></span>
						</a>
					</div>
				</div>
			</div>
		</div>	
		<!-- 애잇 소개 -->
		<!-- 애잇 셀렉트 -->
		<div id="SelectArea">
			<h1>YOUR SELECT</h1>
			<p>레시피에 맞춰서 재료를 준비하는 게 아니라, 내 재료에 맞춘 레시피로!</p>
			<div class="selectView BlindWord">
				<div class="con">
					<div class="title">
						<a href="javascript:">
							<span class="line1">
								내 재료로 가능한 요리
							</span>
							<br />
							<span class="line2">
								확인하러 가기
							</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<!-- 애잇 셀렉트 -->
		
		<!-- 오늘의 추천 레시피 -->
		<div id="RecipeArea">
			<h1>TODAY'S RECIPE</h1>
			<p>오늘은 뭘 해볼까? 지금 가장 인기있는 레시피들을 둘러보세요!</p>
			<div class="imgSlider" data-slick='{"slidesToShow": 4, "slidesToScroll": 4}'>
			<c:forEach items="${rvo }" var="rvo">
			  <div class="slideThum actionImg">
			 	 <a href="/recipe/recipeDetail?r_bno=${rvo.r_bno}"><img src="/resources/photo_upload/${rvo.r_thumbnail}"></a>
			 	 <div class="hover">
					<span class="sub_tit">${rvo.r_subject}
					</span>
					<div class="desc">
						<span><fmt:formatDate value="${rvo.r_date }" pattern="yyyy.MM.dd" /></span>
					</div>
				</div>
			  </div>
			  </c:forEach>
			</div>
		</div>
	
		<!-- 오늘의 추천 레시피 -->
		</div>
	</section>
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

	// 레시피 컨텐츠 슬라이드

</script>
<script>
	<!-- 검색버튼 제어 -->
	document.getElementById("searchBtn").onclick = function(){
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
	location.href="/recipe/recipeListSearch?num=1"+"&searchType"+searchType+"&keyword="+keyword;
	};
</script>
<script>
$('.imgSlider').slick({
	  centerMode: true,
	  centerPadding: '60px',
	  slidesToShow: 3,
	  responsive: [
	    {
	      breakpoint: 768,
	      settings: {
	        arrows: false,
	        centerMode: true,
	        centerPadding: '40px',
	        slidesToShow: 3
	      }
	    },
	    {
	      breakpoint: 480,
	      settings: {
	        arrows: false,
	        centerMode: true,
	        centerPadding: '40px',
	        slidesToShow: 1
	      }
	    }
	  ]
	});
			
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
