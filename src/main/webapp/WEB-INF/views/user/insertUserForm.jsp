<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/mimic.css">
<section id="ViewContainer">
    <div id="UserContainer">
        <h4>회원 가입</h4>
        <div class="InsertArea">
            <fieldset>
                <!-- action="" 속성값이 없을 경우 자기 자신 페이지(/member/login(post))를 호출함 -->
                <legend>이메일/아이디/닉네임 중복 불가합니다</legend>
                <form action="" method="post" name="fr" id="fr" role="form" onsubmit="return formCheck();">
                    <input type="email" class="email" id="email" name="email" placeholder="이메일 주소를 입력해주세요."
                           minlength="4">

                    <span class="email_msg1" style="color: blue">
             사용하실 수 있는 이메일 입니다.
            </span>
                    <span class="email_msg2" style="color: red">
                현재 사용중인 이메일 입니다.
            </span> <br>

                    <input type="button" value="이메일 인증번호 받기" class="vericode" id="vericode">
                    <span id="veri1" class="tearDrop" style="color: #e09ddc">이메일 전송중... 잠시만 기다려주세요</span><br>
                    <span id="veri2" class="tearDrop" style="color: #e09ddc">전송 완료! 메일을 확인해 주세요</span>
                    <%--                    <span id="veri3" class="tearDrop" style="color: #e09ddc">곧 서버가 폭파되니, 제발 메일 확인 좀..?</span>--%>
                    <span id="veri3" class="tearDrop"
                          style="color: #e09ddc">주의!!! 해당 메일은 자동 폐기 대상이므로 곧 서버가 폭파됩니다.</span>
                    <span id="veri4" class="tearDrop" style="color: #e09ddc">펑퍼퍼퍼퍼펑 catcha じゃね~</span>
                    <span id="veri5" class="tearDrop" style="color: #e09ddc">곧 2라운드가 시작됩니다.</span>
                    <input type="text" class="hash_check" id="hash_check" name="hash_check"
                           placeholder="메일로 받은 인증번호를 입력해주세요.">
                    <input type="button" value="인증확인" class="hash_chkbtn" id="hash_chkbtn"><br>
                    <h5>유저정보</h5>
                    <input type="text" class="id" id="id" name="id" placeholder="사용할 아이디를 입력해주세요." minlength="2">

                    <span class="id_msg1" style="color: blue">
             사용하실 수 있는 아이디입니다.
            </span>
                    <span class="id_msg2" style="color: red">
                현재 사용중인 아이디입니다.
            </span> <br>


                    <input type="password" id="pw" class="pw" name="pw" placeholder="사용할 비밀번호를 입력해주세요."
                           minlength="4"><br>

                    <input type="text" class="nickname" id="nickname" name="nickname" placeholder="사용할 닉네임을 입력해주세요."
                           minlength="2">

                    <span class="nick_msg1" style="color: blue">
             사용하실 수 있는 닉네임입니다.
            </span>
                    <span class="nick_msg2" style="color: red">
                현재 사용중인 닉네임입니다.
            </span> <br>

                    <input type="submit" id="submit" class="submit" value="회원가입">
                </form>
            </fieldset>
        </div>
    </div>
</section>


<script type="text/javascript">
    $(document).ready(function () {

        $('.submit').attr('disabled', true);
        var shareVal;

        $(".email_msg1").hide();
        $(".email_msg2").hide();
        $(".email").on("focusout", () => {
            $.ajax({
                url: /*contextPath + */"/user/emailCheck",
                type: "POST",
                data: {
                    "email": $(".email").val()
                },
                // 값 1 = 이미 존재
                success: function (responseData) {
                    var data = responseData.vo;
                    // $("#ajax").remove();
                    // if (responseData == 1 && $(".email").val() != null) {
                    //     alert("중복된 이메일입니다. 다른 이메일을 사용해주세요");
                    //     document.fr.email.readOnly = false;
                    //     $(".email").focus();
                    //     return false;
                    // }
                    shareVal = responseData;

                    if (responseData == 1) {
                        $(".email_msg2").show();
                        $(".email_msg1").hide();
                        return false;
                    } else if (responseData == 2) {
                        $(".email_msg2").show();
                        $(".email_msg1").hide();
                        return false;
                    } else {
                        $(".email_msg1").show();
                        $('.email').readOnly = true;
                        $(".email_msg2").hide();
                    }
                }
            });
        });
        $('#veri1').hide();
        $('#veri2').hide();
        $('#veri3').hide();
        $('#veri4').hide();
        $('#veri5').hide();
        $(".vericode").one("click", function () {
            // function triggerAnimation() {
            //     var animation = selectBox.value;
            //     header.className = "";
            //     setTimeout(function () {
            //         header.className = "mimic " + animation;
            //     }, 10);
            // }

            // alert("이메일 전송중입니다. 잠시만 기다려주세요");
            $('#email').readOnly = true;

            if (shareVal == 0) {
                $('#veri1').show()
                $.ajax({
                    url: /*contextPath + */"/user/emailVeri",
                    type: "POST",
                    data: {
                        "email": $(".email").val()
                    },
                    success: function (responseData) {
                        var data = responseData.random;
                        // alert("이메일 전송완료");
                        $('#veri1').hide();
                        $('#veri2').show();
                        $("#ajax").remove();
                        setTimeout(() => plsCheck(), 20000);

                        plsCheck = () => {
                            console.log("time attack mode has been activated");

                            setTimeout(() => attackSet(), 25000);
                            $('#veri1').hide();
                            $('#veri2').hide();
                            $('#veri3').show();
                            $('#veri4').hide();
                            $('#veri5').hide();
                            attackSet = () => {

                                var xcode = $(".hash_check").val();
                                setTimeout(() => $('#veri3').text("서버가 타임어택 모드로 변환되었습니다."), 1000)
                                setTimeout(() => $('#veri3').text("tik"), 3000);
                                setTimeout(() => $('#veri3').text("tok"), 6000);
                                setTimeout(() => $('#veri3').text("뻥아닙니다"), 9000);
                                setTimeout(() => $('#veri3').text("당신은 시간이 없습니다. 서두르세요"), 12000);
                                setTimeout(() => $('#veri3').text("마지막 기회입니다."), 14000);
                                setTimeout(() => $('#veri3').text("아아....터진다"), 19000);
                                setTimeout(() => $('#veri3').text("뻥이야"), 22000);

                                // var btn = $('#hash_check').one('keydown', () => {
                                //
                                //
                                //     $('#veri3').text("해체 완료.");
                                //     clearTimeout(attackSet(), plsCheck());
                                //     setTimeout(() => $('#veri5').show(), $('#veri3').hide(), 2000);
                                //
                                //
                                //     $('#veri5').text("2 라운드 시작 준비 중");
                                //     var beg = confirm("살려는 드릴께?");
                                //     if (beg) {
                                //         $('#veri5').text("살려 드렸습니다.");
                                //         removeEventListener('keydown', btn, false);
                                //         $('.id').focus();
                                //         return;
                                //         // clearTimeout(round2());
                                //     } else {
                                //         $('#veri5').text("확인 사살!");
                                //         setTimeout(() => byebye(), 5000);
                                //         $('#veri1').hide();
                                //         $('#veri2').hide();
                                //         $('#veri3').hide();
                                //
                                //         byebye = () => {
                                //             $('#veri4').show();
                                //             $('#veri5').hide();
                                //
                                //             location.href = "asd"
                                //         }
                                //     }
                                // });

                            };

                            // var xcode = $(".hash_check").val();
                            // stopit = () => {
                            //     if (xcode != '') {
                            //         $('#veri3').text("해체 완료.");
                            //
                            //     }
                            // }


                        }
                    }
                });
            } else {
                alert("이메일을 먼저 작성하세요");
                return false;
            }
        });


        $(".hash_chkbtn").on("click", () => {
            $.ajax({
                url: /*contextPath + */"/user/hashCheck",
                type: "GET",
                data: {
                    "hashCheck": $(".hash_check").val()
                },
                success: function (responseData) {
                    var data = responseData.code;
                    $("#ajax").remove();
                    // alert(data);
                    if (data == 1) {
                        alert("인증완료");
                        document.fr.hash_check.readOnly = true;
                        $('.submit').removeAttr("disabled");
                    } else {
                        alert("인증실패! 정확한 코드를 적으세요");
                        $('.submit').setAttribute('disabled', true);
                        return false;
                        $(".hash_check").focus();
                    }
                }
            });
        });

        $(".id_msg1").hide();
        $(".id_msg2").hide();
        $(".id").on("focusout", () => {

            $.ajax({
                url: /*contextPath + */"/user/idCheck",
                type: "POST",
                data: {
                    "id": $(".id").val()
                },
                success: function (responseData) {
                    var data = responseData.vo;

                    // $("#ajax").remove();
                    // if (responseData == 1 && $(".id").val() != null) {
                    //     alert("사용 불가능한 아이디입니다");
                    //     document.fr.email.readOnly = false;
                    //     $(".id").focus();
                    //     return false;
                    // }
                    // document.fr.email.readOnly = true;

                    if (responseData == 1) {
                        $(".id_msg2").show();
                        $(".id_msg2").text("중복입니다.");
                        $(".id_msg1").hide();
                        return false;
                    } else {
                        $(".id_msg1").show();
                        $(".id_msg2").hide();
                    }

                    if ($('.id').val() == '') {
                        // alert("공백입니다");
                        $(".id_msg1").hide();
                        $(".id_msg2").show();
                        $(".id_msg2").text("사용불가합니다");
                    }
                }
            });
        });

        $(".nick_msg1").hide();
        $(".nick_msg2").hide();
        $(".nickname").on("focusout", () => {

            $.ajax({
                url: /*contextPath + */"/user/nicknameCheck",
                type: "POST",
                data: {
                    "nickname": $(".nickname").val()
                },
                success: function (responseData) {
                    var data = responseData.vo;

                    $("#ajax").remove();
                    // if (!data) {
                    //     alert("이메일 인증이 틀렸습니다.");
                    //     return false;
                    // }

                    // if (responseData == 1 && $(".nickname").val() != null) {
                    //     alert("사용 불가능한 닉네임입니다");
                    //     document.fr.email.readOnly = false;
                    //     $(".nickname").focus();
                    //     return false;
                    // }
                    // document.fr.email.readOnly = true;

                    if (responseData == 1) {
                        $(".nick_msg2").show();
                        $(".nick_msg2").text("중복입니다");
                        $(".nick_msg1").hide();
                        return false;
                    } else {
                        $(".nick_msg1").show();
                        $(".nick_msg2").hide();
                    }
                    if ($('.nickname').val() == '') {
                        $(".nick_msg1").hide();
                        $(".nick_msg2").show();
                        $(".nick_msg2").text("사용불가합니다");
                    }
                }
            });
        });

        $(".pw").on("focusout", () => {
            if ($('.pw').val() == '' || $('.pw').val().length < 4) {
                // alert("입력해주세요");
                // $(".pw").focus();
                return false;
            }
        })
    });

    function formCheck() {

        if ($(".email").val() == '') {
            alert("입력해주세요");
            $(".email").focus();
            return false;
        }
        if ($(".hash_check").val() == '') {
            chk();
            alert("입력해주세요");
            $(".hash_check").focus();

            return false;
        }
        if ($(".id").val() == '') {
            alert("입력해주세요");
            $(".id").focus();
            return false;
        }
        if ($(".nickname").val() == '') {
            alert("입력해주세요");
            $(".nickname").focus();
            return false;
        }
        if ($(".pw").val() == '') {
            alert("입력해주세요");
            $(".pw").focus();
            return false;
        }
    }

</script>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>