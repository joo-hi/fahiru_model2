<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<header id="header">
    <ul class=" bold">
        <li class="category main f_l "><a href="/">fahiru</a></li>
        <li class="category fah f_l"><a href="/fah">Fahrenheit</a></li>
        <li class="category spot f_l"><a href="/spot">SPOT</a></li>
        <li class="category search f_l"><a href="/search">SEARCH</a></li>
        <li class="category add_fah f_r">+˚F</li>
    </ul>
</header>

<div id="bg"></div>
<div id="fahplus">
    <form id="fahForm" action="">
        <fieldset>
            <legend></legend>
            <div id="fah">
                <h1>˚F 등록</h1>
                <input class="input" id="fahInput" name="fah"/>
                <span class="input">˚F</span>
                <button id="fahOverlapBtn" type="button">중복체크</button>
                <div class="fah_add msg"></div>
                <h2 class="input">˚F 설명</h2>
                <textarea class="input" id="fahText" placeholder="500자 이내로 기재해주세요."></textarea>
                <span id="counter">(0 / 최대 500자)</span>
                <div id="namuwitky">
                    <span class="input namu"><a target="_blank" href="https://namu.wiki/w/">나무위키참고</a></span>
                </div>
                <buutton class="btn register">등록</buutton>
                <div class="btn cancel">취소</div>
            </div>
        </fieldset>
    </form>
</div><!--//fahplus-->	
		<c:choose>
		<c:when test="${loginUser!=null }">
		<img data-userNo="${loginUser.no}" class="login_user f_r" src="../profile/${loginUser.profileImg }"/>
		</c:when>
		<c:otherwise>
		<div class="login f_r"><a href="/session">LOGIN</a></div>
		</c:otherwise>
		</c:choose>
		
		
<div id="sideBar">
    <div id="sideProfile">
    <a href="/user/${loginUser.no }">	
        <img class="profile_image" src="/profile/${loginUser.profileImg }"/>
        <div id="nickname">${loginUser.nickname}</div></a>
        <button form="logoutForm" id="logout">logout</button>
        <form id="logoutForm" method="POST" action="/session">
			<input name="_method" value="DELETE" type="hidden"/>
        </form>
    </div><!--//sideProfile-->
    <div id="sideList">
        <ul id="sideText">
            <li>내가 쓴 글</li>
            <li>내가 쓴 댓글</li>
            <li>Bucket List</li>
        </ul>
    </div><!--//sideList-->
    <div id="sideSubscribe" >subscribe <img style="width: 25px; height: 25px;" src="../img/fire.png"/>
        <div id="subscribeList">
            <ul>
                
            </ul>
        </div>
    </div><!--//sideSubscirbe-->
</div><!--//sideBar-->