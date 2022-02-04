<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
 <script type="text/javascript">
 window.onload = function(){

	 /* 태그1에서 글 등록시 고른 다중선택 체크박스 유지 */
      var tagList1 = '${rvo.r_tag1 }';
      var tag1 = tagList1.split(',');
      for ( var i in tag1 ) {
		switch(tag1[i]){
			 case '한식' :
		    	  document.getElementById('c1').checked = true;
		    	  break;
		      case '중식' :
		    	  document.getElementById('c2').checked = true;
		    	  break;
		      case '양식' :
		    	  document.getElementById('c3').checked = true;
		    	  break;
		      case '일식' :
		    	  document.getElementById('c4').checked = true;
		    	  break;
		      case '퓨전' :
		    	  document.getElementById('c5').checked = true;
		    	  break;
		      case '동남아_인도' :
		    	  document.getElementById('c6').checked = true;
		    	  break;
		      case '이색요리' :
		    	  document.getElementById('c7').checked = true;
		    	  break;
		}
      }
	 /* 태그2에서 글 등록시 고른 다중선택 체크박스 유지 */
      var tagList2 = '${rvo.r_tag2 }';
      var tag2 = tagList2.split(',');
      for ( var i in tag2 ) {

		switch(tag2[i]){
			 case '육류' :  document.getElementById('d1').checked = true;
		    	  break;
		      case '채소류' :
		    	  document.getElementById('d2').checked = true;
		    	  break;
		      case '해산물' :
		    	  document.getElementById('d3').checked = true;
		    	  break;
		      case '콩_두부' :
		    	  document.getElementById('d4').checked = true;
		    	  break;
		      case '과일' :
		    	  document.getElementById('d5').checked = true;
		    	  break;
		      case '달걀_유제품' :
		    	  document.getElementById('d6').checked = true;
		    	  break;
		      case '면_만두' :
		    	  document.getElementById('d7').checked = true;
		    	  break;
		      case '김치' :
		    	  document.getElementById('d8').checked = true;
		    	  break;
		      case '가공식품' :
		    	  document.getElementById('d9').checked = true;
		    	  break;
		      case '상상하지못한재료' :
		    	  document.getElementById('d10').checked = true;
		    	  break;
		}
      }
		 /* 태그3에서 글 등록시 고른 다중선택 체크박스 유지 */
      var tagList3 = '${rvo.r_tag3 }';
      var tag3 = tagList3.split(',');
      for ( var i in tag3 ) {

		switch(tag3[i]){
			 case '밥' :  document.getElementById('e1').checked = true;
		    	  break;
		      case '면' :
		    	  document.getElementById('e2').checked = true;
		    	  break;
		      case '국물' :
		    	  document.getElementById('e3').checked = true;
		    	  break;
		      case '찜_조림_구이' :
		    	  document.getElementById('e4').checked = true;
		    	  break;
		      case '볶음_튀김_부침' :
		    	  document.getElementById('e5').checked = true;
		    	  break;
		      case '나물_샐러드' :
		    	  document.getElementById('e6').checked = true;
		    	  break;
		      case '김장_절임' :
		    	  document.getElementById('e7').checked = true;
		    	  break;
		      case '베이킹_디저트' :
		    	  document.getElementById('e8').checked = true;
		    	  break;
		      case '양념_소스' :
		    	  document.getElementById('e9').checked = true;
		    	  break;
		      case '음료_차_커피' :
		    	  document.getElementById('e10').checked = true;
		    	  break;
		      case '설명을_못하겠네' :
		    	  document.getElementById('e11').checked = true;
		    	  break;
		}
      }
		 /* 태그4에서 글 등록시 고른 다중선택 체크박스 유지 */
      var tagList4 = '${rvo.r_tag4 }';
      var tag4 = tagList4.split(',');
      for ( var i in tag4 ) {

		switch(tag4[i]){
			 case '간식_야식' :  document.getElementById('f1').checked = true;
		    	  break;
		      case '술안주' :
		    	  document.getElementById('f2').checked = true;
		    	  break;
		      case '접대용요리' :
		    	  document.getElementById('f3').checked = true;
		    	  break;
		      case '해장요리' :
		    	  document.getElementById('f4').checked = true;
		    	  break;
		      case '자취생요리' :
		    	  document.getElementById('f5').checked = true;
		    	  break;
		      case '파티_명절요리' :
		    	  document.getElementById('f6').checked = true;
		    	  break;
		      case '다이어트요리' :
		    	  document.getElementById('f7').checked = true;
		    	  break;
		      case '용도는_배부름' :
		    	  document.getElementById('f8').checked = true;
		    	  break;
		}
      }
 }
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

</head>
<body>
	<section id="ViewContainer">
		<div id="RecipeContainer">
			<div id="RecipeDetail">
				<form action="" method="post" id="frm" name="frm" onsubmit="return checked()">
				<div class="ModifyInfo"> 
					<img src="/resources/img/recipe_img/recipe_default_pro.png" class="default" />
					<p>${rvo.r_nickname }</p>
					<h2><input type="text" name="r_subject" value="${rvo.r_subject }"></h2>
					<span><fmt:formatDate value="${rvo.r_date }" pattern="yyyy.MM.dd" /></span><br>
				
				태그1 : <br>
						
						<button type="button" name="c1" class="uncheckedButton"> 한식 </button>
						<button type="button" name="c2" class="uncheckedButton"> 중식 </button>
						<button type="button" name="c3" class="uncheckedButton"> 양식 </button>
						<button type="button" name="c4" class="uncheckedButton"> 일식 </button>
						<button type="button" name="c5" class="uncheckedButton"> 퓨전 </button>
						<button type="button" name="c6" class="uncheckedButton"> 동남아,인도 </button>
						<button type="button" name="c7" class="uncheckedButton"> 이 중에 없어요 </button>
						<div class="hiddenBox">
							한식: <input type="checkbox" name="r_tag1" value="한식" id="c1" > 
							중식: <input type="checkbox" name="r_tag1" value="중식" id="c2"> 
							양식: <input type="checkbox" name="r_tag1" value="양식" id="c3"> 
							일식: <input type="checkbox" name="r_tag1" value="일식" id="c4"> 
							퓨전: <input type="checkbox" name="r_tag1" value="퓨전" id="c5">  
							동남아,인도: <input type="checkbox" name="r_tag1" value="동남아_인도" id="c6"> 
							이 중에 없어요: <input type="checkbox" name="r_tag1" value="이색요리" id="c7"> 
						</div>
				태그2 : <br>
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
				태그3 : <br>
						<button type="button" name="e1" class="uncheckedButton"> 밥 </button>
						<button type="button" name="e2" class="uncheckedButton"> 면 </button>
						<button type="button" name="e3" class="uncheckedButton"> 국 </button>
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
							국물: <input type="checkbox" name="r_tag3" value="국" id="e3">
							찜, 조림, 구이: <input type="checkbox" name="r_tag3" value="찜_조림_구이" id="e4">
							볶음, 튀김, 부침: <input type="checkbox" name="r_tag3" value="볶음_튀김_부침" id="e5">
							나물, 샐러드: <input type="checkbox" name="r_tag3" value="나물_샐러드" id="e6">
							김장, 절임: <input type="checkbox" name="r_tag3" value="김장_절임" id="e7">
							베이킹, 디저트: <input type="checkbox" name="r_tag3" value="베이킹_디저트" id="e8">
							양념, 소스, 잼: <input type="checkbox" name="r_tag3" value="양념_소스_잼" id="e9">
							음료, 차, 커피: <input type="checkbox" name="r_tag3" value="음료_차_커피" id="e10">
							이 중에 없어요: <input type="checkbox" name="r_tag3" value="설명을_못하겠네" id="e11">
						</div>
				태그4 : <br>
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
					<hr>					
				</div>
				<div class="RecipeInfo">
					<div class="kcalAndTime">
						<ul>
							<li><span class="point"><input tyle="text" name="r_kcal" value="${rvo.r_kcal }"  onkeyup='removeChar(event)' style='ime-mode:disabled;'></span> kcal</li>
							<li><span class="point"><input tyle="text" name="r_cooking_time" value="${rvo.r_cooking_time }"  onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'></span> min</li>
						</ul>	
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
						<hr>
						<p><span class="color">어떤 음식인가요? | </span> <input type="text" name="r_introduce" value="${rvo.r_introduce }"></p>
						<p><span class="color">필요한 재료 | </span><input type="text" name="r_ing" value="${rvo.r_ing }"></p>

					</div>
					<div class="RecipeContent">
						<h2>HOW TO MAKE?</h2>
						<textarea rows="20" cols="100" id="r_content" name="r_content">${rvo.r_content }</textarea>
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
			            alert("어떤 음식인가요?를 입력하시오!"); 
			            $('[name=r_introduce]').focus(); 
			            return false; 
			          }
		         if($('[name=r_ing]').val() == ""){
			            alert("필요한 재료를 입력하시오!"); 
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

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>