<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>WEB-INF/views/qna/listBoard.jsp</h1>
  
  <h2>listBoard </h2>
  
       <table border="1">
         <tr>
           <th>글번호</th>
           <th>닉네임</th>
           <th>제목</th> 
           <th>내용</th>               
           <th>작성일</th>
           <th>비밀여부</th>
           <th>비밀번호</th>           
         </tr>
         
         <c:forEach var="blist" items="${boardList }">
           <tr>
             <td>${blist.q_bno }</td>
             <td>${blist.q_nickname }</td>
             <td><a href="/qna/board?q_bno=${blist.q_bno }">${blist.q_subject }</a></td>
             <td>${blist.q_contents }</td>
             <td>${blist.q_date}</td>
             <td>${blist.q_secret }</td>
             <td>${blist.q_pw }</td>
           </tr>
         </c:forEach>
       </table>  
       
       <h2> <a href="/qna/main">main 페이지</a> </h2>
       
       
</body>
</html>