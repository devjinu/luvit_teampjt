<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생활꿀팁</title>
<%@ include file="../include/header.jsp" %>
</head>
<body>
<%
     if(id == null){
    	// 로그인 페이지로 이동
    	response.sendRedirect("/user/login");
     }    
%>

	<section id="ViewContainer">
		<div id="RecipeContainer">
		<div id="RecipeCreate">
			<div class="RecipeCreateArea">
			<h2>나만의 노하우</h2>
			<hr>
			<form action="/tip/insertTip" method="post">
					<ul>
						<li class="infoArea">아이디</li>
						<li>${user.id }</li>
						<li class="infoArea">닉네임</li>
						<li>${user.nickname }</li>
					</ul>	

					<input type="hidden" name="t_id" value = "${user.id}">
					<input type="hidden" name="t_nickname" value = "${user.nickname}"> <br>
					<input type="text" name="t_subject" placeholder="어떤 팁 인가요?"> <br>
					<textarea rows="20" cols="100" name="t_content" id="t_content" placeholder="나만의 노하우를 알려주세요"></textarea> <br>
			<div class="">
				<input type="submit" value="등록하기" id="save"> <input
					type="button" value="취소하기"
					onclick="location.href='/tip/listPage?num=1'">
			</div>
				</form>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "t_content", //textarea에서 지정한 id와 일치해야 합니다. 
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
    
              oEditors.getById["t_content"].exec("PASTE_HTML", [""]); //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["t_content"].exec("UPDATE_CONTENTS_FIELD", []);

     	// 유효성 제어
          if($('[name=t_subject]').val() == ""){
	            alert("팁을 입력하시오!"); 
	            $('[name=t_subject]').focus(); 
	            return false; 
	          }
          var t_content = $("#t_content").val();

          if( t_content == ""  || t_content == null || t_content == '&nbsp;' || t_content == '<p>&nbsp;</p>')  {
               alert("내용을 입력하세요.");
               oEditors.getById["t_content"].exec("FOCUS"); //포커싱
               return false;
          } 
          
          $("#frm").submit();
      });    
});
 
 
 
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('button').click(function() { // 버튼을 눌렀을 때 실행됨 
		var selectID = $(this).attr("name"); // 이 버튼의 name값을 selectID에 저장함
	    $(this).toggleClass('uncheckedButton'); // 버튼을 누르면 .uncheckedButton, .checkedButton 클래스가 반복해서 실행됨 
	    $(this).toggleClass('checkedButton');
		 // 이 버튼의 name값과 같은 id명을 가진 checkebox의 값이 check, unchecked 반복되도록 함.
		$('#'+selectID).prop('checked', !$('#'+selectID).prop('checked')); 
		$('#'+selectID).trigger('change');

	});
});
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>