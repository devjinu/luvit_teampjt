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
  
       <table border="1">
	     <tr>
	      <td>글번호</td>
	      <td>${board.q_bno }</td>
	      <td>조회수</td>
	      <td>${board.q_hit }</td>
	    </tr>      
	    <tr>
	      <td>닉네임</td>
	      <td>${board.q_nickname }</td>
	      <td>작성일</td>
	      <td>${board.q_date}</td>
	    </tr>      
        <tr>
          <td>제목</td>
          <td colspan="3">${board.q_subject }</td>
        </tr> 
        <tr>
          <td>첨부파일</td>
          <td colspan="3">
<%--             <a href="file_down.jsp?file_name=<%=bb.getFile()%>"><%=bb.getFile() %></a> --%>
             <a href="/qna/file_down?file_name=${board.q_file }">${board.q_file }</a> 
          </td>
        </tr> 
        <tr>
          <td>글 내용</td>
          <td colspan="3">${board.q_contents }</td>
        </tr> 
	    <tr>
	      <td colspan="4">
	      <!-- 로그인정보가 없거나, 글쓴이 이름과 아이디가 다를 경우
	                        수정하기, 삭제학기 버튼을 숨김
	                        로그인한 아이디의 정보가 글쓴이 이름과 같다면 수정하기,삭제하기 버튼을 보여주기
	       -->
	 <c:if test="${nicknameCheck > 1}">
	        <input type="button" value="수정하기" 
	        onclick="location.href='/qna/update?q_bno=${board.q_bno }&pageNum=${pageNum}'"
	        >
	        <input type="button" value="삭제하기" 
	        onclick="location.href='/qna/delete?q_bno=${board.q_bno }&pageNum=${pageNum}'"
	        >
	 </c:if>
	 <c:if test="${nicknameCheck > 0}">
	        <input type="button" value="답글쓰기"
	               onclick="location.href='/qna/rewrite?q_bno=${board.q_bno }&q_re_ref=${board.q_re_ref}&q_re_lev=${board.q_re_lev}&q_re_seq=${board.q_re_seq}&pageNum=${pageNum}'">
	 </c:if>              
	        
	        <input type="button" value="목록으로" onclick="location.href='/qna/listpage?pageNum=${pageNum}'">
	      </td>
	
	    </tr>                
       </table>  
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>