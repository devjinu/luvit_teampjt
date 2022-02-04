<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<div id="RecipeContainer">
		
		<div id="RecipeCreate">
			<div class="RecipeCreateArea">
				<h2>레시피 등록</h2>
				<form action="/recipe/create" method="post" name="frm" id="frm" onsubmit="return checked()">
					<ul>
						<li class="infoArea">아이디</li>
						<li>${user.id }</li>
						<li class="infoArea">닉네임</li>
						<li>${user.nickname }</li>
					</ul>					
					<input type="hidden" name="r_nickname" value="${user.nickname }">
					<input type="hidden" name="r_id" value="${user.id}">
					<input type="text" name="r_subject" placeholder="레시피 이름"> <br>
					<input type="text" name="r_introduce" placeholder="레시피 한줄소개"> <br>
					<input type="text" name="r_ing" placeholder="레시피 재료: ,로 구분하세요"> <br>
					<textarea rows="20" cols="100" name="r_content" id="r_content"></textarea> <br>
	
					어느 나라 요리인가요? <br>
							<button type="button" name="c1" class="uncheckedButton"> 한식 </button>
							<button type="button" name="c2" class="uncheckedButton"> 중식 </button>
							<button type="button" name="c3" class="uncheckedButton"> 양식 </button>
							<button type="button" name="c4" class="uncheckedButton"> 일식 </button>
							<button type="button" name="c5" class="uncheckedButton"> 퓨전 </button>
							<button type="button" name="c6" class="uncheckedButton"> 동남아,인도 </button>
							<button type="button" name="c7" class="uncheckedButton"> 이 중에 없어요 </button>
							<div class="hiddenBox">
							한식: <input type="checkbox" name="r_tag1" value="한식" id="c1"> 
							중식: <input type="checkbox" name="r_tag1" value="중식" id="c2"> 
							양식: <input type="checkbox" name="r_tag1" value="양식" id="c3"> 
							일식: <input type="checkbox" name="r_tag1" value="일식" id="c4"> 
							퓨전: <input type="checkbox" name="r_tag1" value="퓨전" id="c5">  
							동남아,인도: <input type="checkbox" name="r_tag1" value="동남아_인도" id="c6"> 
							이 중에 없어요: <input type="checkbox" name="r_tag1" value="이색요리" id="c7"> 
							</div>
					어떤 재료가 들어가나요? <br>
							<button type="button" name="d1" class="uncheckedButton"> 육류 </button>
							<button type="button" name="d2" class="uncheckedButton"> 채소류 </button>
							<button type="button" name="d3" class="uncheckedButton"> 해산물 </button>
							<button type="button" name="d4" class="uncheckedButton"> 콩,두부 </button>
							<button type="button" name="d5" class="uncheckedButton"> 과일 </button>
							<button type="button" name="d6" class="uncheckedButton"> 달걀,유제품 </button>
							<button type="button" name="d7" class="uncheckedButton"> 면,만두 </button>
							<button type="button" name="d8" class="uncheckedButton"> 김치 </button>
							<button type="button" name="d9" class="uncheckedButton"> 가공식품 </button>
							<button type="button" name="d10" class="uncheckedButton"> 이 중에 없어요 </button>
							<div class="hiddenBox">
								육류: <input type="checkbox" name="r_tag2" value="육류" id="d1">
								채소류: <input type="checkbox" name="r_tag2" value="채소류" id="d2">
								해산물: <input type="checkbox" name="r_tag2" value="해산물" id="d3">
								콩,두부: <input type="checkbox" name="r_tag2" value="콩_두부" id="d4">
								과일: <input type="checkbox" name="r_tag2" value="과일" id="d5">
								달걀, 유제품: <input type="checkbox" name="r_tag2" value="달걀_유제품" id="d6">
								면, 만두: <input type="checkbox" name="r_tag2" value="면_만두" id="d7">
								김치: <input type="checkbox" name="r_tag2" value="김치" id="d8">
								가공식품: <input type="checkbox" name="r_tag2" value="가공식품" id="d9">
								이 중에 없어요: <input type="checkbox" name="r_tag2" value="상상하지못한재료" id="d10">
							</div>
					어떻게 조리되었나요? <br>
							<button type="button" name="e1" class="uncheckedButton"> 밥 </button>
							<button type="button" name="e2" class="uncheckedButton"> 면 </button>
							<button type="button" name="e3" class="uncheckedButton"> 국,죽 </button>
							<button type="button" name="e4" class="uncheckedButton"> 찜,조림,구이 </button>
							<button type="button" name="e5" class="uncheckedButton"> 볶음,튀김,부침 </button>
							<button type="button" name="e6" class="uncheckedButton"> 나물,샐러드 </button>
							<button type="button" name="e7" class="uncheckedButton"> 김장,절임 </button>
							<button type="button" name="e8" class="uncheckedButton"> 베이킹,디저트 </button>
							<button type="button" name="e9" class="uncheckedButton"> 양념,소스,잼 </button>
							<button type="button" name="e10" class="uncheckedButton"> 음료,차,커피 </button>
							<button type="button" name="e11" class="uncheckedButton"> 이 중에 없어요 </button>
							<div class="hiddenBox">
								밥: <input type="checkbox" name="r_tag3" value="밥" id="e1">
								면: <input type="checkbox" name="r_tag3" value="면" id="e2">
								국물: <input type="checkbox" name="r_tag3" value="국_죽" id="e3">
								찜, 조림, 구이: <input type="checkbox" name="r_tag3" value="찜_조림_구이" id="e4">
								볶음, 튀김, 부침: <input type="checkbox" name="r_tag3" value="볶음_튀김_부침" id="e5">
								나물, 샐러드: <input type="checkbox" name="r_tag3" value="나물_샐러드" id="e6">
								김장, 절임: <input type="checkbox" name="r_tag3" value="김장_절임" id="e7">
								베이킹, 디저트: <input type="checkbox" name="r_tag3" value="베이킹_디저트" id="e8">
								양념, 소스, 잼: <input type="checkbox" name="r_tag3" value="양념_소스_잼" id="e9">
								음료, 차, 커피: <input type="checkbox" name="r_tag3" value="음료_차_커피" id="e10">
								이 중에 없어요: <input type="checkbox" name="r_tag3" value="설명을_못하겠네" id="e11">
							</div>
					어떨 때 요리하면 좋나요? <br>
							<button type="button" name="f1" class="uncheckedButton"> 간식,야식 </button>
							<button type="button" name="f2" class="uncheckedButton"> 술안주 </button>
							<button type="button" name="f3" class="uncheckedButton"> 접대용요리 </button>
							<button type="button" name="f4" class="uncheckedButton"> 해장요리 </button>
							<button type="button" name="f5" class="uncheckedButton"> 자취생요리 </button>
							<button type="button" name="f6" class="uncheckedButton"> 파티,명절요리 </button>
							<button type="button" name="f7" class="uncheckedButton"> 다이어트 </button>
							<button type="button" name="f8" class="uncheckedButton"> 이 중에 없어요 </button>
							<div class="hiddenBox">
								간식, 야식: <input type="checkbox" name="r_tag4" value="간식_야식" id="f1">
								술안주: <input type="checkbox" name="r_tag4" value="술안주" id="f2">
								접대용 요리: <input type="checkbox" name="r_tag4" value="접대용요리" id="f3">
								해장 요리: <input type="checkbox" name="r_tag4" value="해장요리" id="f4">
								자취생 요리: <input type="checkbox" name="r_tag4" value="자취생요리" id="f5">
								파티,명절 요리: <input type="checkbox" name="r_tag4" value="파티_명절요리" id="f6">
								다이어트 요리:<input type="checkbox" name="r_tag4" value="다이어트" id="f7">
								이 중에 없어요:<input type="checkbox" name="r_tag4" value="용도는_배부름" id="f8">
							</div>
					<br>
					소요시간 : <input type="text" name="r_cooking_time" placeholder="요리 시간은 몇 분 걸리나요?" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'> <br>
					칼로리 : <input type="text" name="r_kcal" placeholder="1인분 당 칼로리는 얼마인가요?" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'> <br>
					<!-- 숫자만 입력 할 수 있게 하는 스크립트 -->
				    <script>
				        function onlyNumber(event){
				            event = event || window.event;
				            var keyID = (event.which) ? event.which : event.keyCode;
				            if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 

				            else
				                return false;
				        }
				        function removeChar(event) {
				            event = event || window.event;
				            var keyID = (event.which) ? event.which : event.keyCode;
				            if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 

				            else
				                event.target.value = event.target.value.replace(/[^0-9]/g, "");
				        }
				    </script>
				    <!-- 숫자만 입력 할 수 있게 하는 스크립트 -->
					<!-- <input type="file" name="r_file"> <br> -->
					<input type="button" value="등록하기" id="save">
					<input type="button" onclick="location.href='/recipe/recipeList?num=1'" value="취소하기">
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
          elPlaceHolder: "r_content", //textarea에서 지정한 id와 일치해야 합니다. 
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
    
              oEditors.getById["r_content"].exec("PASTE_HTML", [""]); //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["r_content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 유효성 제어	       
	         if($('[name=r_subject]').val() == ""){
		            alert("레시피 이름을 입력하시오!"); 
		            $('[name=r_subject]').focus(); 
		            return false; 
		          }
	         if($('[name=r_introduce]').val() == ""){
		            alert("레시피 한줄 소개를 입력하시오!"); 
		            $('[name=r_introduce]').focus(); 
		            return false; 
		          }
	         if($('[name=r_ing]').val() == ""){
		            alert("레시피 재료를 입력하시오!"); 
		            $('[name=r_ing]').focus(); 
		            return false; 
		          }
	      
	         var r_content = $("#r_content").val();
	
	         if( r_content == ""  || r_content == null || r_content == '&nbsp;' || r_content == '<p>&nbsp;</p>')  {
	              alert("내용을 입력하세요.");
	              oEditors.getById["r_content"].exec("FOCUS"); //포커싱
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


<script type="text/javascript">
	<!-- 체크박스 조건 체크 -->
	function checked() {	
		var tagCheck1 = false;
		var tagCheck2 = false;
		var tagCheck3 = false;
		var tagCheck4 = false;
		var tag1 = document.getElementsByName("r_tag1");
		var tag2 = document.getElementsByName("r_tag2");
		var tag3 = document.getElementsByName("r_tag3");
		var tag4 = document.getElementsByName("r_tag4");

		for(var i=0;i<tag1.length;i++){
			if(tag1[i].checked==true){
				tagCheck1 = true;
				break;
			}
		}
		for(var i=0;i<tag2.length;i++){
			if(tag2[i].checked==true){
				tagCheck2 = true;
				break;
			}
		}
		for(var i=0;i<tag3.length;i++){
			if(tag3[i].checked==true){
				tagCheck3 = true;
				break;
			}
		}
		for(var i=0;i<tag4.length;i++){
			if(tag4[i].checked==true){
				tagCheck4 = true;
				break;
			}
		}
		
		
		if(!tagCheck1||!tagCheck2||!tagCheck3||!tagCheck4){
			alert("태그를 하나 이상 선택해주세요.");
			return false;
		}
		
	}
   	</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>


</html>
