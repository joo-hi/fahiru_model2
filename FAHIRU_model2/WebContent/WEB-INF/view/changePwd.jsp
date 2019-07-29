<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change PWD</title>
<link rel="stylesheet" href="css/changePassword.css" />
</head>
<body>
<div id="bg">
    <form id="pwdSearch" action="">
        <fieldset>
            <h1>Password 변경하기</h1>
            <div class="password">
                <span>Password </span><input type="password" id="newPwd" class="pwd" name="pwd"
                                             placeholder="영문,숫자,특수문자를 포한한 8자이상 입력해주세요.">
            </div>
            <div class="new_pwd msg "></div>
            <div class="password">
                <span>Password Check </span><input type="password" id="newPwdCheck" class="pwd" name="pwd"
                                                   placeholder="비밀번호 확인">
            </div>
            <div class="new_pwd_check msg "></div>
            <button><h2><a href="/login.jsp">비밀번호 변경</a></h2></button>
        </fieldset>
    </form>
</div>

<script src="js/jquery.js"></script>
<script>
    let $pwdSearch = $("#pwdSearch");

    let $newPwd = $("#newPwd");
    let $newPwdCheck = $("#newPwdCheck");

    const $newPwdMsg = $(".new_pwd");
    const $newPwdCheckMsg = $(".new_pwd_check");

    const pwdExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;

        $pwdSearch.submit(function () {
            if(!testPw()){
                return false;
            }
            if(!testPwCheck()){
                return false;
            }
        });

    function testPw() {
        let pw1 = $newPwd.val().trim();
        if (pw1 == '' | pw1 == ' ') {
            $newPwdMsg.removeClass("ok").text("비밀번호에 공백 또는 빈칸은 들어갈 수 없습니다.");
        }
        if (!pwdExp.test(pw1)) {
            $newPwdMsg.removeClass("ok").text("비밀번호를 다시 설정해주세요.");
        }else{
            $newPwdMsg.addClass("ok").text("좋은 비밀번호네요!");
        }
    }
    function testPwCheck(){
        let pw1 = $newPwd.val().trim();
        let pw2 = $newPwdCheck.val().trim();
        if(!pwdExp.test(pw2)){
            $newPwdCheckMsg.removeClass("ok").text("비밀번호를 다시 설정해주세요.");
        }

        if(pw1!=pw2){
            $newPwdCheckMsg.removeClass("ok").text("비밀번호가 일치하지않습니다.");
        }else{
            $newPwdCheckMsg.addClass("ok").text("비밀번호가 일치합니다");
        }
    }
    $newPwd.keyup(testPw);
    $newPwdCheck.keyup(testPwCheck);
</script>
</body>
</html>