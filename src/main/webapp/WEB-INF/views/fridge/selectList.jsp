<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="replyModal">
    <div class="modalContent">
        <div class="contentBox">
            <P>recommend you recipes!</P>
            <h3>오늘은 뭘로 요리하지?</h3>
        </div>
        <hr class="boldLineU">
        <form method="get" action="/recipe/selectFood">

            <div class="selectGroup" >

                <button>곡류</button><br>
                <button>육류</button><br>
                <button>어패류</button><br>
                <button>야채류</button><br>
                <button>빵류</button><br>
                <button>과일류</button><br>
                <button>유제품류</button><br>
                <button>견과류</button><br>
                <button>양념류</button><br>


            </div>

            <div class="selectMaterial" >

                <table border="1">
                    <tr>
                        <td>곡류</td>
                    </tr>

                    <c:forEach items="${flist}" var="flist">

                    <tr>
                        <td>${flist.grain}</td>
                    </tr>

                    </c:forEach>

            </div>
            <button type="submit"><span class="buttonText">재료 선택 끝!</span></button>
        </form>
        <div class="clear"></div>
        <div class="modalComment">
            <hr class="boldLineD">
            <h4>가진 재료를 선택하면 맞춤 레시피를 추천해드려요!</h4>
        </div>
    </div>
    <div class="modalBackground"></div>
</div>




<!-- 레시피 모달 창 제이쿼리 영역-->
<script>
    $(document).on("click", ".recipeIcon", function () {
        $(".replyModal").fadeIn(400);
    });

    $(document).on("click", function (e) {
        if ($(".modalBackground").is(e.target)) {
            $(".replyModal").fadeOut(400);
        }
    });
</script>

<script>
    window.onclick = function (e) {
        if (e.target == modal) {
            modal.style.visibility = "hidden";
            modal.style.opacity = 0;
        }
    }
</script>
