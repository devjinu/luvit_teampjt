<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="/WEB-INF/views/include/header.jsp" %>
</head>
<body>
<!-- <img src="/resources/img/store_review_img/background-2068215_960_720.jpg" width = "1300" height ="270"/>  -->
<section id="ViewContainer">
<div class="store_main_banner img2">
	<img src="/resources/img/store_review_img/alexander-schimmeck-vxJvvlJ0gWc-unsplash.jpg"/> 
</div>
	<div id="TipContainer">
		<div id="TipDetail">
			<div class="WriterInfo">

				<%-- <c:forEach var = "i" begin = "1" end = "review.s_r_rating" items = "${list}" var = "list">
					<img src = "starline.png" style="background-color: #bf956b">
				</c:forEach>
				평점 : ${star} --%>
				<script>
					var innerHtml = "";
	
					 switch(${review.s_r_rating}){
					 	case 1 : innerHtml  +=   "★☆☆☆☆" 
						 break; 
					 	case 2 : innerHtml  +=   "★★☆☆☆" 
					 	 break;  
					 	case 3 : innerHtml  +=   "★★★☆☆" 
					 	 break; 
					 	case 4 : innerHtml  +=   "★★★★☆" 
					 	 break;
					 	case 5 : innerHtml  +=   "★★★★★"
					 	 break;	
					 	default : innerHtml  +=   "☆☆☆☆☆";
					 	
					  }
	
					document.write("평점 "+innerHtml); 
	
					/* var star = '<img src ="starline.png" style="background-color: #bf956b">;
	                     let sum = "";
	                     for(let i=1; i<=${review.s_r_rating}; i++){
	                         
	      		 			sum += star;
	      		 			document.write("평점 "); 
	      					}
	                     /* document.write("평점 "+sum);  */ 
					
				</script>
			
				<p><i class="fa fa-user">&nbsp${review.s_r_nickname}</i></p>
				<h2>${review.s_r_subject}</h2>
				
				<span><i class="fa fa-calendar">&nbsp<fmt:formatDate value="${review.s_r_date }" pattern="yyyy.MM.dd" /></i></span>
				&nbsp&nbsp<span class="point"><i class="fa fa-eye"></i> ${review.s_r_hit }</span>
				<hr>
			</div>
			
			<form role="form" method="post" autocomplete="off">

				<div class="TipContent">
						<div class="tipContent">
							${review.s_r_contents }
						</div>
				</div>
			</form>
			

				<div class="TipFooter">
					<hr>
					<ul>
						
						<%-- <!-- 추천 기능 -->
						<li>
							 <c:if test="${ id == null }">
							 
								추천 기능은 <button type="button" onClick = "location.href = '../user/login'"><b class="w3-text-blue">로그인</b></button> 후 사용 가능합니다.<br />
								<i class="fa fa-heart" style="font-size:16px;color:red"></i>
								<span class="srl_count">좋아요</span>					
							 </c:if>
							 <c:if test="${ id != null }">
								<button type = "button" id="srl_update">
									<i class="fa fa-heart" style="font-size:16px;color:red"></i>
									&nbsp;<span class="srl_count"></span>
								</button> 
							</c:if>
						</li> --%>
						<!-- <li><span class="point">좋아요</span> 0${review.s_r_like_count } </li> -->
					</ul>
					
					<ul class="RightSide">
					 <!-- 아이디 있으면서, 이름이랑 아이디랑 같은경우 -->
					 <c:if test="${(id ne null && id eq review.s_r_id)||(id eq 'admin')}">  
						 <li><button type = "button" onclick = "location.href='/store_review/update?s_r_bno=${review.s_r_bno}&no=${review.s_r_pno}'">수정하기</button></li>
						 <li><button onclick="del(${review.s_r_bno})">삭제하기</button></li>
					 </c:if>  
						<li><button onclick="location.href='/store_review/listAll2?num=1'">목록보기</button></li>
					</ul>
					
					<div class = "">
					<script>
						function del(s_r_bno) {
							var chk = confirm("정말 삭제하시겠습니까?");
							if (chk) {
								location.href='/store_review/delete?s_r_bno='+${review.s_r_bno}+'&no='+${review.s_r_pno}
							}
						}	
						/*
						  $(function(){
							// 추천버튼 클릭시(추천 추가 또는 추천 제거)
						
							$("#srl_update > i").click(function(){
							alert("하트실행 : " );
								  $.ajax({
									url: "/store_review/review",
					                type: "get",
					                data: {
					                	s_r_bno: ${review.s_r_bno},
					                    id:  "${id}"
					                },
					                success: function () {

									/* 	alert("DATA : " + data);  */
						                
						              /*  var s_r_bno = data.s_r_bno;
						               var id = data.id;
						             
						                alert("s_r_bno" + s_r_bno);
						                alert("id" + id);
						                 */
								          /*srlCount(); 
					                }/* ,error: function (request, status, error){
					                	alert(error);
					                }, 
								});
							});
						 });
						 
						 // 게시글 추천수
					    function srlCount() {
							$.ajax({
								url: "/store_review/review",
				                type: "get",
				                data: {
				                	s_r_bno: ${review.s_r_bno}
				                },
				                success: function (count) {
					                if("${id}" != null){
					                	alert("sfaaaaaaa"); /* url을 어떻게 처리 해야 할까요*/
										/*console.log(count.message);
									

					                	/*  srlCount(${review.s_r_bno});  */
 					                	/* $(".srl_count").html(count); */
									/*}/* ,error: function (request, status, error){
					                	alert("ajax실패");
					                }, */
				               /* },
							})
					    }; */
					     
					 // 댓글 스크립트
					    // star rating
					      $(document).ready(function() {
					          var $star = $(".s_r_rating");
					            $result = $star.find("output>b");
					            
					        });
					         var starRating = function(){
					        $(document)
					          .on("focusin", ".s_r_rating>.input", function(){
					          $(this).addClass("focus");
					        })
					          .on("focusout", ".s_r_rating>.input", function(){
					          var $this = $(this);
					          setTimeout(function(){
					            if($this.find(":focus").length === 0){
					              $this.removeClass("focus");
					            }
					          }, 100);
					        })
					          .on("change", ".s_r_rating :radio", function(){
					          $result.text($(this).next().text());
					        })
					          .on("mouseover", ".s_r_rating label", function(){
					          $result.text($(this).text());
					        })
					          .on("mouseleave", ".s_r_rating>.input", function(){
					          var $checked = $star.find(":checked");
					          if($checked.length === 0){
					            $result.text("0");
					            
					          } else {
					            $result.text($checked.next().text());
					          }
					        });
					      };

					     
					      starRating();

					     
						</script> 
						<!-- 추천기능 -->
					</div>
					
				</div>
			</div>
	  </div> 

</section>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>