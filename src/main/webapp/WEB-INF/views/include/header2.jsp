<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>애잇LOVE EAT</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&family=Roboto:ital,wght@0,300;1,300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700;1,800&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link href="<c:url value="/resources/css/common.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/starR.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/slick.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/slick-theme.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/common.js" />"></script>
    <!-- 제이쿼리 라이브러리 -->
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <!-- SmartEditor2 라이브러리 -->
    <script type="text/javascript" src="/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
    <!-- font awesome 사용 -->
    <script src="https://kit.fontawesome.com/386395290f.js" crossorigin="anonymous"></script>
    <!-- 슬릭 이미지 슬라이드 라이브러리 -->
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>
<body>
    <%
		// 로그인 처리 할 세션 id값 받아오기
		String id = (String)session.getAttribute("id");
		String nickname = (String)session.getAttribute("nickname");
	%>
<header id="headerBox">
    <div id="topMenu">
       <div class="logoNav"><a href="javascript:void(0);"><img src="/resources/img/main/aeat_logo.png"></a></div>
        <nav id="mainMenu" class="nav">
            <ul class="leftSide">
                <li><a href="javascript:void(0);" >애잇이란</a></li>
                <li><a href="javascript:void(0);" >오늘뭐먹지</a>
                </li>
                <li><a href="javascript:void(0);" >스토어</a></li>
                <li><a href="javascript:void(0);"> 생활노하우</a></li>
                <li><a href="javascript:void(0);" >고객지원</a>
                </li>
            </ul>
            <ul class="rightSide">
                <%
                    if(id!=null){
                %>
                <li><span class="gold"></span>환영합니다.</li>
                <li><a href="/user/logout" >Logout</a></li>
                <li><a href="javascript:void(0);" >My Page</a></li>

                <%
                }else{
                %>
                <li><a href="javascript:void(0);" ><i class="fas fa-key normalIcon"></i></a></li>
                <li><a href="javascript:void(0);"><i class="fas fa-user-plus normalIcon"></i></a></li>

                <%
                    }
                %>
                <li><a href="javascript:void(0);"><i class="fas fa-shopping-cart normalIcon mgt3"></i></a></li>
                <li><i class="fas fa-utensils recipeIcon"></i></li>

            </ul>

            <div id="sliding_menu">
                <div class="section">
                    <ul>
                        <li><a href="javascript:void(0);">애잇이란</a></li>
                    </ul>
                    <ul>
                        <li><a href="javascript:void(0);">오늘뭐먹지</a></li>
                        <li><a href="javascript:void(0);">레시피후기</a></li>
                    </ul>
                    <ul>
                        <li><a href="javascript:void(0);">상품보기</a></li>
                        <li><a href="javascript:void(0);">스토어 후기</a></li>
                    </ul>
                    <ul>
                        <li><a href="javascript:void(0);"> 생활노하우</a></li>
                    </ul>
                    <ul>
                        <li><a href="javascript:void(0);">공지사항</a></li>
                        <li><a href="javascript:void(0);">QNA</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="clear"></div>
    </div>

    <!-- 레시피 셀렉트 모달 창 -->
    <%@ include file="/WEB-INF/views/recipe/selectList.jsp" %>


    <script>

        <!-- 풀다운 메뉴 -->
        $(document).ready(function() {
            $(".nav").hover(function(){
                    $("#sliding_menu", this).stop().slideDown(600);
                },
                function(){
                    $("#sliding_menu", this).stop().slideUp(600);
                });
        })
    </script>

    <script>
        <!-- 스크롤 올리면 메뉴 드러나도록 처리 -->
        var didScroll;
        var lastScrollTop = 0;
        var delta = 5;
        var navbarHeight = $('#topMenu').outerHeight();

        $(window).scroll(function(event){
            didScroll = true;
        });

        setInterval(function() {
            if (didScroll) {
                hasScrolled();
                didScroll = false;
            }
        }, 250);

        function hasScrolled() {
            var st = $(this).scrollTop();

            // Make sure they scroll more than delta
            if(Math.abs(lastScrollTop - st) <= delta)
                return;

            // If they scrolled down and are past the navbar, add class .nav-up.
            // This is necessary so you never see what is "behind" the navbar.
            if (st > lastScrollTop && st > navbarHeight){
                // Scroll Down
                $('#topMenu').removeClass('nav-down').addClass('nav-up');
            } else {
                // Scroll Up
                if(st + $(window).height() < $(document).height()) {
                    $('#topMenu').removeClass('nav-up').addClass('nav-down');
                }
            }

            lastScrollTop = st;
        }
    </script>


</header>

