<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
var t_c_bno = '${readTip.t_bno}'; //게시글 번호
var nickname = '${nickname}'; // 닉네임
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	// 유효성 제어	  
	  if($('[name=t_c_content]').val() == ""){
       alert("내용을 입력하시오!"); 
       $('[name=t_c_content]').focus(); 
       return false; 
     }  

	/* alert("t_c_bno" + t_c_bno); */
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});


// 별점 별표
// 	.click(function(){
// 		  $(this).parent().children('span').removeClass('on');
// 		  $(this).addClass('on').prevAll('span').addClass('on');
// 		  return false;
// 		});
////////////////////////////////////////////////////

// 	if($('.commentInsertForm').length){
// 		var rating = $('.review_content .rating');
// 		/* 
// 			rating 마다 할일
// 			각각이 가지고 있는 별점을 변수면 starscore 3에 저장한다.
// 			svg nht:child 몇번째 1~3 번째
// 			color를 F05522로 변경한다.
// 		*/
	
// 		rating.each(function(){
// 			var starsore = $(this).attr('data-rate');
// 			$(this).find('sav:nth-child(-n+' + starscore + ')').css(color:'#Fe5000');
// 			});
		
// 	}

// 댓글 스크립트
  // star rating
    $(document).ready(function() {
        var $star = $(".t_c_rating");
          $result = $star.find("output>b");
      });
       var starRating = function(){
      $(document)
        .on("focusin", ".t_c_rating>.input", function(){
        $(this).addClass("focus");
      })
        .on("focusout", ".t_c_rating>.input", function(){
        var $this = $(this);
        setTimeout(function(){
          if($this.find(":focus").length === 0){
            $this.removeClass("focus");
          }
        }, 100);
      })
        .on("change", ".t_c_rating :radio", function(){
        $result.text($(this).next().text());
      })
        .on("mouseover", ".t_c_rating label", function(){
        $result.text($(this).text());
      })
        .on("mouseleave", ".t_c_rating>.input", function(){
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
            url : '/comment/list',
            type : 'get',
            data : {'t_c_bno':t_c_bno},
            success : function(data){
                var a =''; 
                var star = '<div class="startRadio"><label class="startRadio__box"><span class="startRadio__img" style="background-color: #bf956b"></span></div>';
    			
                $.each(data, function(key, value){ 
                     
                     a += '<div class="commentArea">';
                     a += '<div class="commentInfo'+value.t_c_cno+'"><div class="commentNum">'+'No.'+value.t_c_cno+'</div>';
                     a += '<div class="commentName">'+value.t_c_nickname+'</div>';
                     let sum = "";
                     for(let i=1; i<=value.t_c_rating; i++){
                         
      		 			sum += star;
      		 			
      					}
                     a += '<div class="commentRating'+value.t_c_cno+'"><p>'+ sum +'</p>';
                     if ((nickname != null && nickname == value.t_c_nickname)|| (nickname == '관리자')){ // 답글 본인, 관리자만 수정 삭제 가능 
	                     a += '<a onclick="commentUpdate('+value.t_c_cno+',\''+value.t_c_content+'\');"><button class="CommentMod"> 수정 </button></a>';
	                     a += '<a onclick="commentDelete('+value.t_c_cno+');"><button class="CommentDel"> 삭제 </button></a></div> ';
	                     a += '<div class="commentCon commentContent'+value.t_c_cno+'"><p>' + value.t_c_content +'</p>';
	                     a += '</div></div></div>';
	               	}else{
	                    a += '<div class="commentCon commentContent'+value.t_c_cno+'"><p>' + value.t_c_content +'</p>';
	                    a += '</div></div></div></div>';
	               	}
                });
                
                $(".commentList").html(a);
            }
        });
    }
 
//댓글 등록
function commentInsert(insertData){
	/* alert("insertData : " +insertData) */
    $.ajax({
        url : '/comment/insert',
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
function commentUpdate(t_c_cno, t_c_content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+t_c_cno+'" value="'+t_c_content+'"/>';
   
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+t_c_cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+t_c_cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(t_c_cno){
    var updateContent = $('[name=content_'+t_c_cno+']').val();
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'t_c_content' : updateContent, 't_c_cno' : t_c_cno },
        success : function(data){
        	// 유효성 제어	  
         	  if(updateContent == ""){
                 alert("내용을 입력하시오!"); 
                 $('[name=content_'+t_c_cno+']').focus(); 
                 return false; 
               }  
         // 유효성 제어	
            if(data == 1) commentList(t_c_bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(t_c_cno){
    $.ajax({
        url : '/comment/delete/'+t_c_cno,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(t_c_bno); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>

