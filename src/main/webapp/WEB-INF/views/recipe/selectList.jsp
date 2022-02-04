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
        <div id="selectArea">
            <hr class="boldLineU">
            <div class="selectBig">
                <h4>STEP 1. 내 냉장고엔 뭐가 들었을까</h4>
                <ul class="type">
                    <li value="1">곡류</li>
                    <li value="2">육류</li>
                    <li value="3">어패류</li>
                    <li value="4">야채류</li>
                    <li value="5">빵류</li>
                    <li value="6">과일류</li>
                    <li value="7">유제품류</li>
                    <li value="8">견과류</li>
                    <li value="9">양념류</li>
                </ul>
                <div class="clear"></div>
                <i class="fas fa-arrow-down mgt10"></i>
            </div>

            <div class="selectGroup" onload="listout();">

                <h4>STEP 2. 좀 더 자세히 말하자면</h4>
                <!--  img src="resources/img/Elephant.jpg" width="280" height="430" class="elephant"-->

            </div>
            <div class="arrowArea">
                <i class='fas fa-arrow-down mgt10'></i></div>
            <form id="sendResult" name="sendResult" method="get" action="/recipe/getRecipe">
                <div class="selectMaterial">
                    <h4>STEP 3. 이 재료들로 가능한 요리가 궁금해요</h4>

                </div>

                <button type="submit" id='resultSubmit'><span class="buttonText">재료 선택 끝!</span></button>
            </form>
            <div class="clear"></div>
        </div>
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

    /* . -> class , # -> id */
    $(".type").on("click", "li", function () {
        $(".elephant").hide()
        $.ajax({
            url: "/recipe/searchIngreds",
            type: "get",
            data: {
                "data": $(this).val(),
            },
            success: function (result) {
                $(".ingreds").remove();
                for (var i = 0; i < result.length; i++) {

                    $(".selectGroup").append("<button class='ingreds' value=" + result[i] + ">" + result[i] + "</button>" + " ");

                }
            }
        });
    });
</script>
<script>
    $(".selectGroup").on("click", "button", function () {
        this.setAttribute("disabled", "disabled");
        $.ajax({
            url: "/recipe/choice",
            type: "get",
            data: {
                "data": $(this).val(),
            },
            success: function (data) {

                $(".selectMaterial").append("<button class='result' value=" + data + ">" + data+ " " + "</button>");
                $(".selectMaterial").append("<input class='test1' type='hidden' name='result' value=" + data + ">");
            }
        });
    });

    $(".selectMaterial").on("click", "button", function () {
        var ss = $(this).val();
//         alert(ss);
        $(this).remove();
        
        $("input[value="+ss+"]").remove();
        $(".ingreds").removeAttr("disabled");
    });



</script>
<script>

</script>


<%--// Get the image and insert it inside the modal - use its "alt" text as a caption
var img = document.getElementById('myImg');
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
modal.style.display = "block";
modalImg.src = this.src;
modalImg.alt = this.alt;
captionText.innerHTML = this.alt;
}--%>

