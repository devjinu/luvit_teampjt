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
	
	<form action="/store/storeModify" method="post">
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
	      <td><input type="text" name="s_subject" value="${vo.s_subject }"></td>
	    </tr>
	     <tr>
	      <td>판매가격</td>
	      <td><input type="text" name="s_price" id = "s_price" value="${vo.s_price}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
	    </tr>
	     <tr>
	      <td>수량</td> 
	      <td><input type="text" name="s_amount" id = "s_amount" value="${vo.s_amount}" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></td>
	    </tr>
	    <!-- 숫자만 입력 할 수 있게 하는 스크립트 -->
	    <script>
	        function onlyNumber(event){
	            event = event || window.event;
	            var keyID = (event.which) ? event.which : event.keyCode;
	            if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	                return;
	            else
	                return false;
	        }
	        function removeChar(event) {
	            event = event || window.event;
	            var keyID = (event.which) ? event.which : event.keyCode;
	            if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
	                return;
	            else
	                event.target.value = event.target.value.replace(/[^0-9]/g, "");
	        }
	        document.getElementById('s_price').addEventListener('keyup', function(event) {
	        	// 0으로 시작하면 0 지우기 / 숫자 외 문자 입력방지
	        	this.value = this.value.replace(/^[0]|[^0-9,]/g, '')
	        })
	         document.getElementById('s_amount').addEventListener('keyup', function(event) {
	        	// 0으로 시작하면 0 지우기 / 숫자 외 문자 입력방지
	        	this.value = this.value.replace(/^[0]|[^0-9,]/g, '')
	        })
	    </script>
	    <!-- 숫자만 입력 할 수 있게 하는 스크립트 -->
	    <tr>
	      <td>옵션</td> 
	      <td><input type="text" name="s_option" value="${vo.s_option}"></td>
	    </tr>
	    <tr>
	      <td>제품 정보</td> 
	      <td>	<textarea rows="20" cols="100" id="s_content" name="s_content">${vo.s_content }</textarea></td>
	    </tr>
	    <tr>
	   
	   
	  </table>	<br>
	   <input type="submit" id="save" value="상품수정" ><%-- onclick="location.href='/store/storeDetail?no=${vo.s_pno}'" --%>
	   <input type="reset" value="상품수정취소" onclick="location.href='/store/storeDetail?no=${vo.s_pno}'">
	</form>
	
	<script type="text/javascript">
	
	var oEditors = [];
	$(function(){
	      nhn.husky.EZCreator.createInIFrame({
	          oAppRef: oEditors,
	          elPlaceHolder: "s_content", //textarea에서 지정한 id와 일치해야 합니다. 
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
	    
	              oEditors.getById["s_content"].exec("PASTE_HTML", [""]); //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	          },
	          fCreator: "createSEditor2"
	      });
	     
	    //저장버튼 클릭시 form 전송
	      $("#save").click(function(){
			oEditors.getById["s_content"].exec("UPDATE_CONTENTS_FIELD", []);

	       	// 유효성 제어
	         if($("select[name=s_cate] option:selected").val() == ""){
		            alert("카테고리 입력하시오!"); 
		            $("#s_cate").focus(); 
		            return false; 
		          }  
		       
	         if($('[name=s_product]').val() == ""){
		            alert("상품이름을 입력하시오!"); 
		            $("#s_product").focus(); 
		            return false; 
		          }
	          
	         if($('[name=s_price]').val() == ""){
		            alert("판매가격을 입력하시오!"); 
		            $("#s_price").focus(); 
		            return false; 
		          }
	          
	         if($('[name=s_amount]').val() == ""){
		            alert("수량을 입력하시오!"); 
		            $("#s_amount").focus(); 
		            return false; 
		          }

	         var s_content = $("#s_content").val();
	         
	           if( s_content == ""  || s_content == null || s_content == '&nbsp;' || s_content == '<p>&nbsp;</p>')  {
	                alert("내용을 입력하세요.");
	                oEditors.getById["s_content"].exec("FOCUS"); //포커싱
	                return false;
	           }
	      // 유효성 제어
	      
	           $("#frm").submit(); 
	      }); 
	     
	});

</script>
	      
  </div>
	</section>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>