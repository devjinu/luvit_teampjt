<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <h1>WEB-INF/views/qna/board.jsp</h1>
  
  <h2>게시판 글정보 </h2>
  
       <table border="1">
         <tr>

           <th>닉네임</th>
           <th>제목</th> 
           <th>내용</th>               
        
         </tr>
         
         
           <tr>

             <td>${data.q_nickname }</td>
             <td>${data.q_subject }</td>
             <td>${data.q_contents }</td>
 
           </tr>
      
       </table>  
       
       <h2> <a href="/qna/main">main 페이지</a> </h2>
</body>
</html>