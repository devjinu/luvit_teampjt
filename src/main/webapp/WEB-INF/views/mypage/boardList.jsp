<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>

	<section id="ViewContainerGrey">
		<div id="AdminContainer">
		<!-- 서브메뉴 -->
		<%@ include file="/WEB-INF/views/include/userSub.jsp" %>	
		<!-- 서브메뉴 -->
			
			<div id="contentArea">
				<h2>내가 쓴 글</h2>
				<div id="userListArea">
					<div id="myBoardListTitle">
						<ul>
							<li>Category</li>
							<li>Subject</li>
							<li>Hit</li>
							<li>DATE</li>
							<li>Like</li>
							<li>Delete</li>
						</ul>
						<div class="clear"></div>
					</div>
					<c:forEach items="${list}" var="list">
						<div class="MyboardList">
							<ul>
								<li>
								<c:choose>
									<c:when test="${list.TblName=='recipe'}">
										<span class="cateSelect1">레시피</span>
									</c:when>
									<c:when test="${list.TblName=='recipe_review'}">
										<span class="cateSelect2">레시피후기</span>
									</c:when>
									<c:when test="${list.TblName=='tip'}">
										<span class="cateSelect3">생활노하우</span>
									</c:when>
									<c:when test="${list.TblName=='store_review'}">
										<span class="cateSelect3">스토어후기</span>
									</c:when>
								</c:choose>
								
								</li>
								<li>${list.subjectName }</li>
								<li>${list.hit }</li>
								<li><fmt:formatDate value="${list.regdate }" pattern="yyyy.MM.dd" /></li>
								<li>${list.likey }</li>
								<li><a href="/mypage/delete?TblName=${list.TblName}&Bno=${list.bno}"><i class="fas fa-trash-alt deleteIcon"></i></a></li>														
								<div class="clear"></div>
							</ul>
						</div>
					</c:forEach>
					<div class="paging">
						<c:if test="${page.prev}">
						 <span>[ <a href="/mypage/boardList?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
						</c:if>
						
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
						 <span>
						 
						  <c:if test="${select != num}">
						   <a href="/mypage/boardList?num=${num}${page.searchTypeKeyword}">${num}</a>
						  </c:if>    
						  
						  <c:if test="${select == num}">
						   <b>${num}</b>
						  </c:if>
						    
						 </span>
						</c:forEach>
						
						<c:if test="${page.next}">
						 <span>[ <a href="/mypage/boardList?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
						</c:if>
					</div>
				</div>
			</div>
			
		</div>
	</section>
<script type="text/javascript">
	document.getElementById("searchBtn").onclick = function(){
		let searchType = document.getElementsByName("searchType")[0].value;
		let keyword =  document.getElementsByName("keyword")[0].value;
	location.href="/admin/userList?num=1"+"&searchType="+searchType+"&keyword="+keyword;
};
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>

</body>
</html>