<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var r_c_bno = '${rvo.r_bno}'; //게시글 번호
var nickname = '${nickname}'; // 닉네임
// var r_c_content = $('#content').val();
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	/* alert("r_c_bno" + r_c_bno); */
	
	 // 유효성 제어	  
   	  if($('[name=r_c_content]').val() == ""){
           alert("내용을 입력하시오!"); 
           $('[name=r_c_content]').focus(); 
           return false; 
         } 
   
    // 유효성 제어	 
    
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});


// 댓글 스크립트
  // star rating
    $(document).ready(function() {
        var $star = $(".r_c_rating");
          $result = $star.find("output>b");
          
      });
       var starRating = function(){
      $(document)
        .on("focusin", ".r_c_rating>.input", function(){
        $(this).addClass("focus");
      })
        .on("focusout", ".r_c_rating>.input", function(){
        var $this = $(this);
        setTimeout(function(){
          if($this.find(":focus").length === 0){
            $this.removeClass("focus");
          }
        }, 100);
      })
        .on("change", ".r_c_rating :radio", function(){
        $result.text($(this).next().text());
      })
        .on("mouseover", ".r_c_rating label", function(){
        $result.text($(this).text());
      })
        .on("mouseleave", ".r_c_rating>.input", function(){
        var $checked = $star.find(":checked");
        if($checked.length === 0){
          $result.text("0");
          
        } else {
          $result.text($checked.next().text());
        }
      });
    };

   
    starRating();


    
 
  //댓글 목록 
    function commentList(){
        $.ajax({
            url : '/comment/rlist',
            type : 'get',
            data : {'r_c_bno':r_c_bno},
            success : function(data){
                var a =''; 
                var star = '<div class="startRadio"><label class="startRadio__box"><span class="startRadio__img" style="background-color: #bf956b"></span></div>';
                $.each(data, function(key, value){ 
                     a += '<div class="commentArea">';
                     a += '<div class="commentInfo'+value.r_c_cno+'"><div class="commentNum">'+'No.'+value.r_c_cno+'</div>';
                     a += '<div class="commentName">'+value.r_c_nickname+'</div>';
                     let sum = "";
                     for(let i=1; i<=value.r_c_rating; i++){
                         
      		 			sum += star;
      		 			
      					}
                     a += '<div class="commentRating'+value.r_c_cno+'"><p>'+ sum +'</p>';
                     if ((nickname != null && nickname == value.r_c_nickname)|| (nickname == '관리자')){ // 답글 본인, 관리자만 수정 삭제
	                     a += '<a onclick="commentUpdate('+value.r_c_cno+',\''+value.r_c_content+'\');"><button class="CommentMod"> 수정 </button></a>';
	                     a += '<a onclick="commentDelete('+value.r_c_cno+');"><button class="CommentDel"> 삭제 </button></a></div> ';
	                     a += '<div class="commentCon commentContent'+value.r_c_cno+'"><p>' + value.r_c_content +'</p>';
	                     a += '</div></div></div>';
      
		               }
                     else{ 
                     a += '<div class="commentCon commentContent'+value.r_c_cno+'"><p>' + value.r_c_content +'</p>'; 
                     a += '</div></div></div></div>';
                     }
                });
                
                $(".commentList").html(a);
            }
        });
    }
//댓글 등록
function commentInsert(insertData){
	/*  alert("insertData : " +insertData)  */
    $.ajax({
        url : '/comment/rinsert',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
          }
    	}).error(function () {
        alert("평점을 입력하시오!");
        $('[name=r_c_rating]').focus(); 
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(r_c_cno, r_c_content, r_c_rating){
    var a ='';
    
    a += '<div class="input-group">';
    //a += '<input type="text" class="form-control" name="content_'+r_c_cno+'" value="'+r_c_content+'"/>';
     a += '<textarea rows="5" cols="85" name="content_'+r_c_cno+'" class="form-control commentTextFrom">'+r_c_content+'</textarea>';
   	// -> 댓글수정창 input text에서 textarea로 변경 예정
    a += '<button class="btn btn-default" type="button" onclick="commentUpdateProc('+r_c_cno+');">수정</button>';
    a += '</div>';
    
    $('.commentContent'+r_c_cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(r_c_cno){
    var updateContent = $('[name=content_'+r_c_cno+']').val();
    $.ajax({
        url : '/comment/rupdate',
        type : 'post',
        data : {'r_c_content' : updateContent, 'r_c_cno' : r_c_cno },
        success : function(data){
        	// 유효성 제어	  
         	  if(updateContent == ""){
                 alert("내용을 입력하시오!"); 
                 $('[name=content_'+r_c_cno+']').focus(); 
                 return false; 
               }  

             if(data == 1) commentList(r_c_bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(r_c_cno){
    $.ajax({
        url : '/comment/rdelete/'+r_c_cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(r_c_bno); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>
