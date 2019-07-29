<%@page import="com.fas.fahiru.dao.UsersDAOImpl"%>
<%@page import="com.fas.fahiru.vo.User"%>
<%@page import="com.fas.fahiru.dao.SpotsDAOImpl"%>
<%@page import="com.fas.fahiru.vo.Spot"%>
<%@page import="com.fas.fahiru.dao.FahsDAOImpl"%>
<%@page import="com.fas.fahiru.vo.Fah"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
<link rel="stylesheet" href="/css/search.css" />
<c:import url="/WEB-INF/template/link.jsp" />
<style>

	.now_fah_img>img {
		width: 120px;
		height: 120px;
		border-radius: 50%;
		background-size:100% 100%;
	}
	
	.now_spot_img>img {
		width: 120px;
		height: 120px;
		border-radius: 50%;
		background-size:100% 100%;
	}
	
	.now_user_img>img {
		width: 120px;
		height: 120px;
		border-radius: 50%;
		background-size:100% 100%;
	}
	
	a{
		color:#222222;
		font-weight:700;
		font-family:'Noto Sans Kr', 'sans-serif'
	}

</style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<div id="wrap">
        <div id="searchForm">
            <form action="/search" method="post">
                <fieldset>
                    <div id="searchWrap">
                    <input id="searchInput" name="word" type="text" placeholder="검색어를 입력해주세요. ex) ____˚F">
                    </div>
                </fieldset>
                    <button class="fas fa-search inner_search cursor_pointer" type="submit"></button>
            </form>
        </div> <!--//searchForm end-->


    <div id="nowPopulerFah">
        <div class="title">New˚F</div>
        <div>
     	   <c:forEach items="${fahNew }" var="fah">
        	<a href="/fahDetailPage.jsp?no=${fah.no }">
            <div class="now_fah_img cursor_pointer">
                <img src="../img/${fah.fahImg }">
                <div class="fah_name cursor_pointer">${fah.name }</div>
            </div>
            </a>
            </c:forEach>
        </div>
    </div><!--//nowPopulerFah end-->

    <div id="nowPopulerSpot">
        <div class="title">New Spot</div>
        <div>
        	<c:forEach items="${spotNew }" var="spot">
        	<a href="/spotDetailPage.jsp?spotNo=${spot.no}">
            <div class="now_spot_img cursor_pointer">
                <img src="../img/${spot.img}"/>
                <div class="spot_name cursor_pointer">${spot.name}</div>
            </div>
            </a>
          </c:forEach>
        </div>
    </div><!--//nowPopulerSpot end-->

    <div id="nowPopulerUser">
        <div class="title">New Trender</div>
        <div>
        	<c:forEach items="${userNew }" var="user">
        	<a href="/myPage.jsp?no=${user.no }">
            <div class=" now_spot_img profile_image cursor_pointer">
                <img src="../profile/${user.profileImg }"/>
                <div class="user_nickname cursor_pointer">${user.nickname }</div>
            </div>
            </a>
          </c:forEach>
        </div>
    </div><!--//nowPopulerUser end-->

</div> <!--//Wrap end-->
<c:import url="/WEB-INF/template/footer.jsp"/>
</body>
</html>