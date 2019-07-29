<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String searchWord = request.getParameter("searchWord");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/default.css" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/searchNoResult.css" />
</head>
<body>
<main id="content">
    <div id="detailSearchWrap">
        <div id="searchForm">
            <form action="">
                <fieldset>
                    <div id="searchWrap">
                        <input id="searchInput" name="searchWord" type="text" placeholder="">
                        <button class="fas fa-search inner_search cursor_pointer" type="submit"></button>
                    </div>
                </fieldset>
            </form>
        </div> <!--//searchForm end-->

    </div> <!--//detailSearchWrap end-->
    <section>
        <div id="contentTrendyFood">Trendy food</div>
        <div id="contentCook">Cook</div>
        <div id="contentSpot">Spot</div>
        <div id="contentUser" class="on">User</div>
    </section><!--//searchList end-->
</main>
<div id="searchNoResultWrap">
    <div class="no_result">
        <span >"앙버터"<span>
            <span style="color: #424242">에 대한 결과가 없습니다.<span>
    </div>
    <div class="no_result_detail">
        검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해보세요.<br/>
        두 단어 이상을 검색하신 경우, 정확하게 띄어쓰기를 한 후 검색해 보세요.<br/>
        키워드에 있는 특수문자를 뺀 후에 검색해보세요.
    </div>
</div>
</body>
</html>