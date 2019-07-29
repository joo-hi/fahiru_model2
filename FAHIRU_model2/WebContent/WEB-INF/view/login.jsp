<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fahirugin</title>
<link rel="stylesheet" href="css/default.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/login.css" />
</head>
<body>
<div id="bg"></div>
    <div id="loginFormWrap">
    <form id="loginForm" method="post" action="/session">
        <div id="signLogo"></div>
        <fieldset>
            <legend></legend>
            <div id="loginbox">
                <h3>이메일</h3>
                <input name="email" id="email" class="input" placeholder="  이메일">
                <h3>비밀번호</h3>
                <input name="password" id="password" class="input" type="password" placeholder="  비밀번호">
                <div class="msg login"></div>
                <input id="loginInput" type="checkbox"/><span id="loginCheck">로그인 상태 유지</span>
                <div>
                    <button id="loginBtn"><h2>로그인</h2></button>
                </div>
                <div id="sign" class="f_r deco"><a href="/sign.jsp">회원가입</a></div>
                <div id="pwdSearch" class="f_l deco"><a href="/findPwd.jsp"> 비밀번호 찾기</a></div>
            </div>
        </fieldset>
    </form>
    </div><!--//loginFormWrap-->
<script src="/js/jquery.js"></script>

</body>
</html>