<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생활꿀팁</title>
<%@ include file="/WEB-INF/views/include/header.jsp"%>
</head>
<body>
<section id="ViewContainer">
		<div id="RecipeContainer">
			<div id="RecipeDetail">
				<form action="" method="post" id="frm" name="frm" onsubmit="">
				<div class="ModifyInfo"> 
					<img src="/resources/img/recipe_img/recipe_default_pro.png" class="default" />
					<p>${tips.t_nickname }</p>
					<h2><input type="text" name="t_subject" value="${tips.t_subject }"></h2>
					<span><fmt:formatDate value="${tips.t_date }" pattern="yyyy.MM.dd" /></span><br>
					<hr>					
				</div>
				<div class="RecipeInfo">
					<div class="RecipeContent">
						<h2>HOW TO MAKE?</h2>
						<textarea rows="20" cols="100" id="t_content" name="t_content">${tips.t_content }</textarea>
					</div>
					<div class="RecipeFooter">
						<hr>
						<ul class="RightSide">
							<li><input type="button" id="save" value="수정하기"></li>
							<li><input type="button" onclick="location.href='/recipe/recipeList?num=1'" value="목록보기"></li>
						</ul>
						
					</div>
						
				</div>
				
				</form>
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
	$(function(){
		for(var i=0;i<=7;i++){
			if($('#c'+i).is(":checked")){
				$('button[name=c'+i+']').attr('class','checkedButton');
			}	
		}
		for(var i=0;i<=10;i++){
			if($('#d'+i).is(":checked")){
				$('button[name=d'+i+']').attr('class','checkedButton');
			}	
		}
		for(var i=0;i<=11;i++){
			if($('#e'+i).is(":checked")){
				$('button[name=e'+i+']').attr('class','checkedButton');
			}	
		}
		for(var i=0;i<=8;i++){
			if($('#f'+i).is(":checked")){
				$('button[name=f'+i+']').attr('class','checkedButton');
			}	
		}
			
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
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>