<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>
<body>
<section id="ViewContainerGrey">
    <div id="AdminContainer">
        <div class="InfoArea">
            <br><br><br><br>
            <form action="" method="" name="fr">
                <h2>아이디 찾기</h2>
                <p>
                    아래 이메일주소를 입력하시면,<br> 입력하신 이메일로 가입된 기존아이디를 보내드립니다.<br>
                </p>
                <input type="text" id="email" class="email" name="email" placeholder="이메일주소를 입력하세요">
                <p>'@'포함한 이메일주소를 정확히 입력해주세요.
                </p>
                <input type="button" value="아이디 찾기" class="check" id="check" name="check">
                <input type="button" value="메인으로" onclick="location.href='/'">
            </form>
        </div>
    </div>
</section>


<script>

    $(document).ready(function () {

        function serachID() {
            document.getElementById("email").valueOf().submit();
        }

        $('#exit').on('click', function () {
            // window.location.assign("/");
            location.href = "/";
        })


        // setTimeout(function() {
        //     window.location.href = "https://www.example.com";
        // }, 3000);


        // $('.exit').on('keyup', () => {
        //     if ($('.email').val() == '') {
        //         alert("이메일을 입력해 주세요");
        //         $('.email').focus();
        //     }
        // })


        $(".check").on("click", function () {

            if ($('.mail').val() == '') {
                alert("이메일을 입력해 주세요");
                $('.email').focus();
                return false;
            }
            alert("이메일 발송 시도중, 잠시만 기다려주세요");
            $.ajax({
                url: "/user/searchId",
                type: "post",
                data: {
                    "email": $(".email").val()
                },
                success: function (responseData) {
                    var code = responseData.code;
                    if (code == 1) {
                        alert("발송 성공");
                        document.fr.email.readOnly = true;
                    } else {
                        alert("존재하지 않는 이메일입니다");
                    }

                }
            }).error(function () {
                alert("아이디 찾기 실패");
            });
        });


        $(".hash_chkbtn").on("click", () => {
            $.ajax({
                url: /*contextPath + */"/user/hashCheck",
                type: "get",
                data: {
                    "hashCheck": $(".hash_check").val()
                },
                success: function (responseData) {
                    alert(responseData.code);
                    if (responseData.code == 1) {
                        alert("인증완료");
                        document.fr.hash_check.readOnly = true;
                    } else {
                        alert("인증실패! 정확한 코드를 적으세요");
                    }
                }
            }).error(function () {
                alert("서버 에러");
                return false;
                document.fr.hash_chkbtn.focus();
            });
        });


    })
</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
