<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 후기</title>
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
 
 .select_img img{margin:20px 0;}
</style>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>

	<div id="reply">
	
	
	  <section class="replyForm">
	  <form action="/store_review/insert" method="post" enctype="multipart/form-data">
	   <div class="input_area">
		작성자 <input type = "text" id = "s_r_nickname" name = "s_r_nickname" /><!-- readonly로 수정할수 없게 하고 s_r_nickname 받아오도록 하기 sql로만? -->
	   </div>
	   <div class="input_area">
		 제목 <input type = "text" id = "s_r_subject" name = "s_r_subject"/>
	   </div>
	     내용 <div class="input_area"> 
		   <textarea rows = "5" cols = "50" name="s_r_contents" id="s_r_contents" ></textarea>
	   </div>

	   <input type = "text" id = "s_r_pno" name ="s_r_pno" > <!-- hidden으로 숨겨야 하고 s_r_pno번호 받아오도록 하기 sql로만? -->
	   <div class="input_area"> 
	    <button type="submit" id="reply_btn">소감 남기기</button>
	   </div>
	           
	  </form>
	 </section>

	</div>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>