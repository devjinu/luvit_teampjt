<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
	<section id="ViewContainer">

 <!--  <h1>WEB-INF/views/qna/listBoardPage.jsp</h1>  -->
  
 <!--  <h2>listBoard </h2>  -->
  
       <table border="1">
         <tr>
           <th>글번호</th>
           <th>닉네임</th> 
           <th>제목</th> 
    <!--   <th>내용</th>  -->             
           <th>작성일</th>
    <!--   <th>비밀여부</th> -->
    <!--   <th>비밀번호</th> -->          
           <th>카운트</th>          
         </tr>
         
         <c:forEach var="blist" items="${boardList }">
            <tr>
            	<th>${blist.q_bno }</th>
           	    <th>${blist.q_nickname }</th>  
            	<td>
             	<c:set var="wid" value="0" /> 
            	  <c:if test="${blist.q_re_lev  > 0}">
            
            	    <c:set var="wid" value =" ${10* blist.q_re_lev}"  />
           <!--  	<c:out value="${wid }" />   --> 
            	   
           <!--     <img src="./qna/level.gif" width=${wid} height="15">  -->
           <!--     <img src="./qna/re.gif">                              -->
                    <img src="${pageContext.request.contextPath}/resources/img/level.gif" width=${wid} height="15">
                    <img src="${pageContext.request.contextPath}/resources/img/re.gif">
            	  </c:if>
            	
            	<a href="/qna/board?q_bno=${blist.q_bno}&pageNum=${pageNum}">
            	${blist.q_subject }
            	</a>
            	</td>
        <!--    <td>${blist.q_contents }</td>   -->
            	<th>${blist.q_date }</th>
        <!--   	<td>${blist.q_secret }</td>   -->
        <!--  	<td>${blist.q_pw }</td>    -->
            	<th>${blist.q_hit }</th>
            </tr>
         </c:forEach>
      </table>
  
  <c:if test="${cnt > 0}">
    <c:if test="${startPage > pageBlock }" >
      <a href="/qna/listpage?pageNum=${startPage-pageBlock}">[이전]</a>
    </c:if>
    
    <c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
      <a href="/qna/listpage?pageNum=${i}">[${i}]</a>
    </c:forEach>
    
    
    <c:if test="${endPage < pageCount }" >
      <a href="/qna/listpage?pageNum=${startPage+pageBlock}">[다음]</a>
    </c:if>  
  </c:if>
  

  <br>
  <br>
  <c:if test="${nid > 0}">
    <button type="submit" class="btn-insert">글쓰기</button>
    <button type="submit" class="btn-finsert">파일업로드 글쓰기</button>
  </c:if>
	</section>   
	
  <script type="text/javascript">

    $(document).ready(function(){

        // 글쓰기
        $(".btn-insert").on("click", function(){
             location.href="/qna/insert";
        }); 
        // 파일업로드 글쓰기
        $(".btn-finsert").on("click", function(){
             location.href="/qna/finsert";
        });      
 
    	
    });




  
  </script>	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>       
</body>
</html>