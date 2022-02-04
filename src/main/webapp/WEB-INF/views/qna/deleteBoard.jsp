<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
	<section id="ViewContainer">
	
	 <c:if test="${deleteCheck > 0}">
	   <script type="text/javascript">
           alert("비밀번호가 일치 않습니다.")
	   </script>
	 
	 </c:if>
	 
	<fieldset>
		<!-- action="" 속성값이 없을 경우 자기 자신 페이지(/member/login(post))를 호출함 -->
		<!-- 오후에 테스트해봄 -->
<!-- 		<form action="/qna/insert" method="post" enctype="multipart/form-data"> -->
	  <form action="" method="post">
	       <input type="hidden" name="pageNum" value="${pageNum}">
	       글번호 : <input type="text" name="q_bno" value="${qnaVO.q_bno}"> <br>

	       비밀번호 : <input type="password" name="q_pw" value=""> <br>
	  
	   <input type="submit" value="글쓰기삭제" >
	  
	  </form>
	</fieldset>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>