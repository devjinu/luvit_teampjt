<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	Date now = new Date();
	request.setAttribute("now", now);
%>
<div id="AdminProfileArea" class="bgcolor">
				<div id="proArea">
					<div class="propic">
						<img src="/resources/img/recipe_img/recipe_default_pro.png">
					</div>
					<h2>${nickname}님, 환영합니다.</h2>
					<span>오늘은 <fmt:formatDate value="${now}" pattern="yyyy년 MM월 dd일 E요일 입니다."/></span>
				</div>
				<div id="newCountArea">
				<p>신규가입자</p>
				<p>n명</p>
				</div>
				<div id="newCountArea">신규주문 n건</div>
				<div class="clear"></div>
			</div>
			
			<div id="subMenuArea">
				<div class="menubar"> 
					<ul> 
						<li><a href="/admin/userList?num=1">회원목록</a></li> 
						<li><a href="/admin/boardList?num=1" id="current">게시글 조회</a>
						<ul class="innerMenu"> 
							<li><a href="/admin/boardList?num=1">오늘뭐먹지</a></li> 
							<li><a href="#">레시피 후기</a></li> 
							<li><a href="#">상품보기</a></li> 
							<li><a href="#">스토어 후기</a></li> 
							<li><a href="#">생활노하우</a></li> 
							<li><a href="#">QNA</a></li> 
					 	</ul> 
						 </li> 
						 <li><a href="/cart/adminOrderList">배송 관리</a></li> 
						 <li><a href="#">매출 관리</a></li> 
						 <li><a href="#">블랙리스트</a></li> 
	 					 <div class="clear"></div>
					 </ul> 
				</div>
			</div>