<%@page import="java.util.List"%>
<%@page import="com.luvit.domain.StoreVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
	<section id="ViewContainer">
	<div id="StoreListContainer">
<h1>STORE</h1><br><br>


	<table border="1">
     <tr>
       <td><a href="/store/storeList">전체</a></td>
       <td><a href="/store/storeList?cate=best">BEST</a></td>
       <td><a href="/store/storeList?cate=soup">국/찌개/탕</a></td>
       <td><a href="/store/storeList?cate=noodle">파스타/면류</a></td>
       <td><a href="/store/storeList?cate=instant">즉석조리</a></td>
       <td><a href="/store/storeList?cate=etc">기타</a></td>
     </tr>
      <tr>
  		 <th></th>
  		 <th>번호</th>
  		 <th>이름</th>
  		 <th>가격</th>
  		 <th>등록날짜</th>
 	 </tr>
     	<c:forEach items="${list }" var="list">
  	  <tr>
   <td><img src="${list.s_thumbnail}"></td>
   <td>${list.s_pno}</td>
   <td><a href="/store/product?no=${list.s_pno }">${list.s_product}</a></td>
   <td><fmt:formatNumber value="${list.s_price }" pattern="###,###,###"/></td>
   <td><img src="${list.s_date}"></td>
  </tr>  
  		</c:forEach>
     </table>
     
     <input type="button" value="상품등록" onclick="location.href='/store/storeWrite'">
     
     </div>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>