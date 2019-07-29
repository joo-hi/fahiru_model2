<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기이</title>
<link rel="stylesheet" href="css/default.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/findPassword.css" />

</head>
<body>
<div id="bg"></div>
        <div id="pwdSearchWrap">
            <form id="emailForm">
                <div id="signLogo"></div>
                <div id="emailBox">
                    <h3>이메일</h3>
                    <input id="email" name="email" placeholder="   이메일 입력">
                        <div class="email_check msg"></div>
                </div><!--//signLogo-->
                <div>
                    <button id="pwdBtn"><h2><a href="/findPwdCheck.jsp">비밀번호 찾기</a></h2></button>
                </div>
            </form>
        </fieldset>
        </div><!--//pwdSearchWrap-->

<script src="js/jquery.js"></script>
<script>
    let $emailForm = $("#emailForm");
    let $email = $("#email");

    const $emailCheck = $(".email_check");
    const emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{2,3}/;

    $emailForm.on("submit",function () {
        let email = $email.val().trim(' ');
        console.log(email);
        if(!emailExp.test(email)){
            $emailCheck.addClass("ok").text("이메일을 확인해 주세요.");
            return false;
        }
    });
</script>
</body>
</html>