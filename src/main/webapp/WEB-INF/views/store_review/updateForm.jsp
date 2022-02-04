<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">    
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
	<section id="ViewContainer">
	<div id="StoreContainer">
	<br>
	<h1> 상품 후기 수정 </h1><br><br>
	 
	  <form action="" method="post" id="frm" name="frm" >
	  
	   <table border="1">
	    <input type="hidden" name="s_r_pno" value="${review.s_r_pno }"/> 
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
		    <td><input type = "hidden" id = "s_r_id" name = "s_r_id" value="${id}"/></td>
		 </tr>
		    
	     <tr>
		     <td>작성자</td>
			 <td><input type = "text" name = "s_r_nickname" value="${review.s_r_nickname}" readonly></td> 
	   	</tr>
	   	<tr>
			 <td>제목</td>
			 <td><input type = "text" name = "s_r_subject" value="${review.s_r_subject}"></td>
	   	</tr>
	   	<tr>
		     <td>내용</td>
		     <td><textarea rows="20" cols="100" id="s_r_contents" name="s_r_contents">${review.s_r_contents }</textarea></td>
	   	</tr>
	   	
		</table><br>
		
	   <input type="button" id="save" value="후기 수정">
	   <input type="button" onclick="location.href='/store_review/listAll2?num=1'" value="목록보기">
	   
	  </form>
	  
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
			      $("#save").click(function(){
			          oEditors.getById["s_r_contents"].exec("UPDATE_CONTENTS_FIELD", []);
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
			          $("#frm").submit();
			      }); 
			     
			});
		
		</script>
	  
	  </div>
	 </section>
	
<%@ include file="/WEB-INF/views/include/footer.jsp" %>         
    </form>  
 
</body>
</html>