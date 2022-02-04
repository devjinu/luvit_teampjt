<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recipe_review modify</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>

<section id="ViewContainer">
	<div id="RecipeContainer">
		<div id="RecipeDetail">
			<form method="post" id="form">
			<div class="ModifyInfo">
				<img src="/resources/img/recipe_img/recipe_default_pro.png" class="default" />
				<p>${view.r_r_nickname}</p>
				<h2><input type="text" name="r_r_subject" value="${view.r_r_subject}"></h2>
				<span><fmt:formatDate value="${view.r_r_date }" pattern="yyyy.MM.dd" /></span><br>
			</div>
			<div class="RecipeInfo">
				<div class="RecipeContent">
					<h2>HOW TO MAKE?</h2>
					<textarea rows="20" cols="100" name="r_r_content" id="r_r_content">${view.r_r_content}</textarea><br>
				</div>
				<div class="RecipeFooter">
					<hr>
					<ul class="RightSide">
						<li><input type="button" value="수정하기" id="modify"></li>
						<li><input type="button" onclick="location.href='/Recipe_review/view?r_r_bno=${view.r_r_bno}'" value="취소하기"></li>
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
        	elPlaceHolder: "r_r_content", // textarea에서 지정한 id와 일치해야 합니다. 
        	// SmartEditor2Skin.html 파일이 존재하는 경로
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
				oEditors.getById["r_r_content"].exec("PASTE_HTML", [""]); // 기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			},
			fCreator: "createSEditor2"
		});
		// 수정버튼 클릭시 form 전송
		$("#modify").click(function(){
			oEditors.getById["r_r_content"].exec("UPDATE_CONTENTS_FIELD", []);
			// 유효성 제어
	           if($('[name=r_r_subject]').val() == ""){
		            alert("레시피 이름을 입력하시오!"); 
		            $('[name=r_r_subject]').focus(); 
		            return false; 
		          }
	           var r_r_content = $("#r_r_content").val();

	           if( r_r_content == ""  || r_r_content == null || r_r_content == '&nbsp;' || r_r_content == '<p>&nbsp;</p>')  {
	                alert("내용을 입력하세요.");
	                oEditors.getById["r_r_content"].exec("FOCUS"); //포커싱
	                return false;
	           } 
	        // 유효성 제어
			$("#form").submit();
		});    
	});
</script>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>