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
		<%@ include file="/WEB-INF/views/include/adminSub.jsp" %>	
		<!-- 서브메뉴 -->
			
			<div id="contentArea">
				<h2>RECIPE / BOARD LIST</h2>
				<div id="userListArea">
					<div id="boardListTitle">
						<ul>
							<li>NO.</li>
							<li>ID</li>
							<li>Subject</li>
							<li>Introduce</li>
							<li>Date</li>
							<li>Hit</li>
							<li>Delete</li>
						</ul>
						<div class="clear"></div>
					</div>
					<c:forEach items="${list}" var="list">
						<div class="boardList">
							<ul>
								<li>${list.r_bno }</li>
								<li>${list.r_id }</li>
								<li><a href="/recipe/recipeDetail?r_bno=${list.r_bno}">${list.r_subject }</a></li>
								<li>${list.r_introduce }</li>
								<li><fmt:formatDate value="${list.r_date }" pattern="yyyy.MM.dd" /></li>
								<li>${list.r_hit }</li>
								<li><a href="/admin/deleteRecipe?rBno=${list.r_bno}"><i class="fas fa-trash-alt deleteIcon"></i></a></li>														
								<div class="clear"></div>
							</ul>
						</div>
					</c:forEach>
					<div class="paging">
						<c:if test="${page.prev}">
						 <span>[ <a href="/admin/userList?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
						</c:if>
						
						<c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
						 <span>
						 
						  <c:if test="${select != num}">
						   <a href="/admin/userList?num=${num}${page.searchTypeKeyword}">${num}</a>
						  </c:if>    
						  
						  <c:if test="${select == num}">
						   <b>${num}</b>
						  </c:if>
						    
						 </span>
						</c:forEach>
						
						<c:if test="${page.next}">
						 <span>[ <a href="/admin/userList?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
						</c:if>
					</div>
					<div id="searchBox">
						<select name="searchType">
							<option value="id" <c:if test="${page.searchType eq 'id'}">selected</c:if>>아이디</option>
					        <option value="nickname" <c:if test="${page.searchType eq 'nickname'}">selected</c:if>>닉네임</option>
						    <option value="email" <c:if test="${page.searchType eq 'email'}">selected</c:if>>이메일</option>
		
						</select>
						<input type="text" name="keyword" value="${page.keyword }"/>
						<input type="button" id="searchBtn" value="검색">
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