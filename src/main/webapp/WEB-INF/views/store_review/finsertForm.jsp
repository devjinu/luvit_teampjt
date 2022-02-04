<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/resources/ckeditor/ckeditor.js"></script>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
<%
     if(id == null){
    	// 로그인 페이지로 이동
    	response.sendRedirect("/user/login");
     }    
%>

	<section id="ViewContainer">
	<div id="StoreContainer">
		
	<br><br>
	<h1> 후기 등록 </h1><br><br><br>
		
	  <form action="/store_review/finsert?no=${s_r_pno}" name = "frm" id = "frm" method="post" autocomplete="off" > 

		<table border="1">
		    <tr>
		      <td>카테고리</td>
		      <td>
		        <select name="s_r_cate">
		          <option value="">선택하시오</option>
		          <option value="국/찌개/탕">국/찌개/탕</option>
		          <option value="파스타/면류">파스타/면류</option>
		          <option value="즉석조리">즉석조리</option>
		          <option value="기타">기타</option>          
		        </select>
		      </td>
		    </tr>
		    <tr>
		    
		    <td><input type = "hidden" id = "s_r_id" name = "s_r_id" value = ${id} ></td>
		    </tr>
		    <!-- 평점시작 -->
			  <label>평점</label>
			  <div class="startRadio" style="transform:translateY(3px);">
				    <label class="startRadio__box">
				        <input type="radio" name="s_r_rating" id="p1" value="1">
				        <span class="startRadio__img" ><span class="blind">별 1개</span></span>
				    </label>								    
				
				    <label class="startRadio__box">
				        <input type="radio" name="s_r_rating" id="p2" value="2">
				        <span class="startRadio__img"><span class="blind">별 2개</span></span>
				    </label>						    
					    
				    <label class="startRadio__box">
				        <input type="radio" name="s_r_rating" id="p3" value="3">
				        <span class="startRadio__img"><span class="blind">별 3개</span></span>
				    </label>							    
				
				    <label class="startRadio__box">
				        <input type="radio" name="s_r_rating" id="p4" value="4">
				        <span class="startRadio__img"><span class="blind">별 4개</span></span>
				    </label>							    
				
				    <label class="startRadio__box">
				        <input type="radio" name="s_r_rating" id="p5" value="5">
				        <span class="startRadio__img"><span class="blind">별 5개</span></span>
				    </label>
	          </div>
		     <tr>
				<td>작성자</td>
	 			<td><input type = "text" id = "s_r_nickname" name = "s_r_nickname"  value ="${nickname}" readonly></td>
   			 </tr>
   			<tr>
		 		<td>제목</td> 
		 		<td><input type = "text" id = "s_r_subject" name = "s_r_subject" ></td>
   			</tr>
   			<input type = "hidden" id = "s_r_pno" name ="s_r_pno" value = ${s_r_pno} > 
   			<tr>
   				<td>내용</td>
   				<td><textarea id = "s_r_contents" name="s_r_contents" rows = "20" cols = "100"></textarea></td>
	  		 </tr>
	   
	    </table>	<br>
	    	<input type="submit" id = "submit" value = "소감 남기기">
			<input type="reset" value="취소">
	           
	     <script type="text/javascript">
			var oEditors = [];
			$(function(){
		      nhn.husky.EZCreator.createInIFrame({
		          oAppRef: oEditors,
		          elPlaceHolder: "s_r_contents", //textarea에서 지정한 id와 일치해야 합니다. 
		          //SmartEditor2Skin.html 파일이 존재하는 경로
		          sSkinURI: "/resources/se2/SmartEditor2Skin.html",  
		          htParams : {
		              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseToolbar : true,             
		              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseVerticalResizer : true,     
		              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		              bUseModeChanger : true,         
		              fOnBeforeUnload : function(){
		                   
		              }
		          }, 
		          fOnAppLoad : function(){
		    
		              oEditors.getById["s_r_contents"].exec("PASTE_HTML", [""]); //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
		          },
		          fCreator: "createSEditor2"
		      });
		    //저장버튼 클릭시 form 전송
		      $("#submit").click(function(){
		           oEditors.getById["s_r_contents"].exec("UPDATE_CONTENTS_FIELD", []); 
						// 유효성 제어
			           /* if($('[name=s_r_rating]').val() == '0'){
				            alert("별점을 입력하시오!"); 
				            $('[name=s_r_rating]').focus(); 
				            return false; 
				          }	 */			
						
			            if($("select[name=s_r_cate] option:selected").val() == ""){
				            alert("카테고리 입력하시오!"); 
				            $("#s_r_cate").focus(); 
				            return false; 
				          } 
				       
			           if($("#s_r_subject").val() == ""){
				            alert("제목을 입력하시오!"); 
				            $("#s_r_subject").focus(); 
				            return false; 
				          }
			        
			           var s_r_contents = $("#s_r_contents").val();
			         
			            if( s_r_contents == ""  || s_r_contents == null || s_r_contents == '&nbsp;' || s_r_contents == '<p>&nbsp;</p>')  {
			                alert("내용을 입력하세요.");
			                oEditors.getById["s_r_contents"].exec("FOCUS"); //포커싱
			                return false;
			           } 
					 // 유효성 제어
			       
		           $("#frm").submit(); 
		      });  
		      
		});
		 
		</script>      
	           
	  </form>
	  
	  </div>
	 </section>
	 
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>