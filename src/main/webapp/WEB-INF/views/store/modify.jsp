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
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
	<section id="ViewContainer">
	<div id="StoreContainer">
	
	<h1> 상품 수정 </h1><br><br>
	
	<form action="/store/modify" method="post">
	<input type="hidden" name="s_pno" value="${vo.s_pno }"/>
	  <table border="1">
	    <tr>
	      <td>카테고리</td>
	      <td>
	        <select name="s_cate">
	          <option value="">선택하시오</option>
	          <option value="국/찌개/탕">국/찌개/탕</option>
	          <option value="파스타/면류">파스타/면류</option>
	          <option value="즉석조리">즉석조리</option>
	          <option value="기타">기타</option>          
	        </select>
	      </td>
	    </tr>
	     <tr>
	      <td>상품이름</td> 
	      <td><input type="text" name="s_product" value="${vo.s_product }"></td>
	    </tr>
	     <tr>
	         <td>제목</td> 
	      <td><input type="text" id="s_subject" name="${s_subject }"></td>
	    </tr>
	     <tr>
	      <td>판매가격</td>
	      <td><input type="text" name="s_price" value="${vo.s_price}"></td>
	    </tr>
	     <tr>
	      <td>수량</td> 
	      <td><input type="text" name="s_amount" value="${vo.s_amount}"></td>
	    </tr>
	    <tr>
	      <td>옵션</td> 
	      <td><input type="text" name="s_option" value="${vo.s_option}"></td>
	    </tr>
	    <tr>
	      <td>제품 정보</td> 
	      <td><input type="text" name="s_content" value="${vo.s_content}"></td>
	    </tr>
	    <tr>
	      <td>메인 이미지</td>
	      <td><input type="file" name="s_thumbnail" value="${vo.s_thumbnail}"></td>
	    </tr>
	    <tr>
	      <td>제품이미지1</td>
	      <td><input type="file" name="s_file"></td>
	    </tr>
	   
	  </table>	<br>
	   <input type="submit" value="상품수정" onclick="location.href='/store/product?no=${vo.s_pno}'">
	   <input type="reset" value="상품수정취소" onclick="location.href='/store/product?no=${vo.s_pno}'">
	</form>
	
	
  </div>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>