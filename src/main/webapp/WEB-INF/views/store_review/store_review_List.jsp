
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 section.replyForm { padding:30px 0; }
 section.replyForm div.input_area { margin:10px 0; }
 section.replyForm textarea { font-size:16px; font-family:'맑은 고딕', verdana; padding:10px; width:500px;; height:150px; }
 section.replyForm button { font-size:20px; padding:5px 10px; margin:10px 0; background:#fff; border:1px solid #ccc; }
 
 section.replyList { padding:30px 0; }
 section.replyList ol { padding:0; margin:0; }
 section.replyList ol li { padding:10px 0; border-bottom:2px solid #eee; }
 section.replyList div.userInfo { }
 section.replyList div.userInfo .userName { font-size:24px; font-weight:bold; }
 section.replyList div.userInfo .date { color:#999; display:inline-block; margin-left:10px; }
 section.replyList div.replyContent { padding:10px; margin:20px 0; }
</style>

</head>
<body>
	<section class="replyList">
	  <ol>
	   <li>댓글 목록</li> 
	   
	   <li>글 개수: count</li> 

	   </ol>    
		<ol>
		<c:forEach var = "list" items="${list }"> 
			<li>
		       <div class="userInfo">
			         <span class="userName">${list.s_r_nickname }</span> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <span class="date">${list.s_r_date }</span>
			         <!-- &nbsp&nbsp&nbsp&nbsp 좋아요 ${list.s_r_like_count } -->
			    </div> 
			    
			    <div class="replyContent">   
					${list.s_r_file } 
			    </div>    
			    <div class="replyContent">   
			        ${list.s_r_subject }
			     </div>   
			     <div class="replyContent">   
					${list.s_r_contents }
					
				</div>
				
				<div class="replyContent">
					${list.s_r_rating }
				</div>
				
				
				  <button type="button" onclick="location.href='/store_review/update?s_r_bno=${list.s_r_bno}'">수정</button>
				  <button type="button" onclick="del(${list.s_r_bno})">삭제</button>
				  <button type="button" onclick="location.href='/store_review/review?s_r_bno=${list.s_r_bno}'">상세보기</button>
				 <%--  <button type="button" onclick="location.href='/store_review/review?s_r_bno=${list.s_r_bno}'">좋아요</button> --%>
					<script>
						function del(s_r_bno) {
							var chk = confirm("정말 삭제하시겠습니까?");
							if (chk) {
								location.href='/store_review/delete?s_r_bno='+s_r_bno;
							}
						}	
					</script> 
			</li>
			
			</c:forEach> 
				  

		 </ol>  
		</section>
	</div> 
	
</body>
</html>