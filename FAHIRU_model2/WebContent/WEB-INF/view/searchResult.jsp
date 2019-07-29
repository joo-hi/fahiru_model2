<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<link rel="stylesheet" href="/css/default.css" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/searchDetailPage.css" />
<link rel="stylesheet" href="/css/searchNoResult.css" />
<link rel="stylesheet" href="/css/header.css"/>
<link rel="stylesheet" href="/css/sideBar.css"/>
<link rel="stylesheet" href="/css/fahAddForm.css"/>
<link rel="stylesheet" href="/css/footer.css">

<c:import url="/WEB-INF/template/link.jsp"/>


	<style>
	.spot_spotter_img>img{
		width: 65px;
		height: 65px;
		background-size:100% 100%;
		background-repeat:no-repeat;
		border-radius:50%;
	}
	
	.spot_img>img{
		width: 225px;
		height: 225px;
		background-size:100% 100%;
		background-repeat:no-repeat;
	}
	a {
		color:#222222;
	}
	</style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<main id="content">
    <div id="detailSearchWrap">
        <div id="searchForm">
            <form action="/search" method="post">
                <fieldset>
                    <div id="searchWrap">
                        <input id="searchInput" name="word" type="text" placeholder="">
                        <button class="fas fa-search inner_search cursor_pointer" type="submit"></button>
                    </div>
                </fieldset>
            </form>
        </div> <!--//searchForm end-->

    </div> <!--//detailSearchWrap end-->
    <section>
        <div id="contentTrendyFood" class="on">Trendy food</div>
        <div id="contentCook">Cook</div>
        <div id="contentSpot">Spot</div>
        <div id="contentUser">User</div>
    </section><!--//searchList end-->
<div id="searchResultWrap">
    
</div><!--//ssearchResultWrap end-->
</main>
<c:import url="/WEB-INF/template/footer.jsp"/>
<c:import url="/WEB-INF/template/headerScript.jsp"/>
<script type="text/template" id="searchSpotTmp">
<@ _.each(searchSpot,function(result){@>
    <div class="spot_card">
        <div class="spot_card_main">
            <span class="spot_name"><@=result.name@></span>
            <div class="spot_img"><img src="../img/<@=result.img@>" /></div>
            <div class="spot_score">
                <div class="totalTaste"> <i class="fas fa-thermometer-three-quarters"></i> <br/> <@=result.tftaste@>점</div>
                <div class="totalPlating"> <i class="fas fa-temperature-high"></i> <br/> <@=result.tfplating@>점</div>
            </div><!--//spot_score-->
            <div class="spot_fah">
                <ul>
                    <li>앙버터 &deg;F</li>
                    <li>앙 &deg;F</li>
                    <li>앙버 &deg;F</li>
                    <li>버터 &deg;F</li>
                </ul>
            </div><!--//spot_fah-->
        </div><!--//spot_card_main-->
        <div class="spot_card_menu">
            <span>Trendy food Menu</span>
            <div class="trendy_menu_wrap">
                <ul class="trendy_menu_box">
                    <li class="trendy_menu menu1"></li>
                    <li class="trendy_menu menu2"></li>
                    <li class="trendy_menu menu3"></li>
                    <li class="trendy_menu menu4"></li>
                    <li class="trendy_menu menu4"></li>
                </ul>
            </div><!--//trendy_menu_wrap-->
            <button class="menu_btn menu_prev fas fa-chevron-circle-left"></button>
            <button class="menu_btn menu_next fas fa-chevron-circle-right"></button>
        </div><!--//spot_card_menu-->
        <div class="spot_card_info">
            <ul>
                <li><i class="fas fa-map-marker-alt"></i> <@=result.address@></li>
                <li><i class="far fa-clock"></i> <@=result.timeInfo@></li>
            </ul>
        </div><!--//spot_card_info-->
        <div class="spot_card_buket">
            <button><i class="fas fa-shopping-basket cursor_pointer"></i></button>
            <br/>50
        </div><!--//spot_card_buket-->
        <div class="spot_card_spotter">
            <div class="spot_spotter_img"><img src="../profile/<@=result.profileImg@>"/></div>
            <div class="spot_spotter_name"><@=result.nickname@></div>
        </div><!--//spot_card_spotter-->
    </div><!--//spot_card-->
<@})@>
</script><!--//searchSpotTmp end-->

<script type="text/template" id="searchUserTmp">
    <div class="search_user_multi_card">
<@_.each(searchUser,function(result){@>
		<a href="/myPage.jsp?no=<@=result.no@>">
        <div class="search_user_wrap">
            <div class="user_nickname"><@=result.nickname@></div>
            <div>팔로워 <@=result.followCnt@></div>
            <div>게시글 수 <@=result.totalCnt@></div>
            <div class="search_user_img cursor_pointer"><img class="profile_image" src="../profile/<@=result.profileImg@>"></div>
        </div>
		</a>
<@})@>
    </div> <!--search_user_multi_card end-->
    <button class="more_btn cursor_pointer">+ more</button>
</script><!--//searchUserTmp end-->

<script type="text/template" id="searchTrendyFoodTmp">
    <div class="search_trendy_food_list cursor_pointer">
        <ul>
			<@ _.each(searchTrendyFood,function(result){@>
            <li>
            	<div class="search_trendy_food_card">
            		<img src="../img/<@=result.img@>"/>
            	</div>
           	</li>
			<@})@>
        </ul>
    </div> <!--//searchTrendyFoodTotalWrap end-->
    <button class="trendy_food_more_btn cursor_pointer"> + more </button>
</script><!--//searchTrendyFoodTmp end-->

<script type="text/template" id="searchCookTmp">
    <div class="search_trendy_food_list cursor_pointer">
        <ul>
			<@ _.each(searchCook,function(result){@>
            <li>
            	<div class="search_trendy_food_card">
            		<img src="../img/<@=result.img@>"/>
            	</div>
           	</li>
			<@})@>
        </ul>
    </div> <!--//searchTrendyFoodTotalWrap end-->
    <button class="trendy_food_more_btn cursor_pointer"> + more </button>
</script><!--//searchTrendyFoodTmp end-->

<script type="text/template" id="searchNoResultTmp">
<div id="searchNoResultWrap">
<div class="no_result">
    <span >"<@=word@>"<span>
        <span style="color: #424242">에 대한 결과가 없습니다.<span>
</div>
<div class="no_result_detail">
    검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해보세요.<br/>
    두 단어 이상을 검색하신 경우, 정확하게 띄어쓰기를 한 후 검색해 보세요.<br/>
    키워드에 있는 특수문자를 뺀 후에 검색해보세요.
</div>
</div>
</script>



<script src="/js/underscore-min.js"></script>
<script>
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
    ////////////////////////// on 클래스 붙이기 //////////////////////

    $("section div").click(function () {

        // alert("z");

        $(".on").removeClass("on");
        $(this).addClass("on");

        // e.preventDefault();
    })

    let page = 1;
    let word = "${word}";
    
    const $contentTrendyFood = $("#contentTrendyFood");
    const $contentCook = $("#contentCook")
    const $contentSpot = $("#contentSpot");
    const $contentUser = $("#contentUser")

    
    // 기준이 되는..
    var $userTotalWrap = $("#searchResultWrap");
    
    var searchNoResultTmp = _.template($("#searchNoResultTmp").html());
    var searchUserTmp = _.template($("#searchUserTmp").html());
    var searchCookTmp = _.template($("#searchCookTmp").html());

    $userTotalWrap.on("click", ".more_btn", function () {

        $(this).remove();

        $userTotalWrap.append(searchUserTmp);

    }); // searchUserTotalWrap more end


    ///////////////////////// spot ////////////////////////

    var searchSpotTmp = _.template($("#searchSpotTmp").html());

    var $searchSpotTotalWrap = $("#searchResultWrap");

    $searchSpotTotalWrap.on("click", ".spot_more_btn", function () {

        $(this).remove();

        $searchSpotTotalWrap.append(searchSpotTmp);

    }); // searchSpotTotalWrap more end

    //// spot 의 trendy food move ///////////
    var $menuNext = $(".menu_next")
    var $trendyMenuBox = $(".trendy_menu_box")

    let cardMove1 = 0;
    let cardMove2 = 0;

    $("#searchResultWrap").on("click",".menu_next",function () {

        if(cardMove1==-180){
            cardMove1 = 0;
        }else{
            cardMove1 -= 90;
        }
        $(this).parent().find(".trendy_menu_box").css("left",cardMove1).css("transition", "ease .2s")

    })

    $("#searchResultWrap").on("click",".menu_prev",function () {
        if(cardMove1==0){
            cardMove1 = -180;
            $(this).parent().find(".trendy_menu_box").css("left",cardMove1).css("transition","ease .2s");
        }else{
            cardMove1 += 90;
            $(this).parent().find(".trendy_menu_box").css("left",cardMove1).css("transition","ease .2s");
        }
    })


    ////////////// trendy food or cook search //////////////////

    var searchTrendyFoodTmp = _.template($("#searchTrendyFoodTmp").html());

    var $searchTrendyFoodTotalWrap = $("#searchResultWrap");

    $searchTrendyFoodTotalWrap.on("click", ".trendy_food_more_btn", function () {

        $(this).remove();

        $searchTrendyFoodTotalWrap.append(searchTrendyFoodTmp);

    }); // searchTrendyFoodTotalWrap more end
    
    ////////////////////////////// 붙이기 ////////////////////
    $contentUser.click(function(){
    	$("#searchResultWrap").empty();
    	userResult();
    })

    $contentSpot.click(function(){
    	$("#searchResultWrap").empty();
    	spotResult();
    })

    $contentTrendyFood.click(function(){
    	$("#searchResultWrap").empty();
    	trendyFoodResult();
    })

    $contentCook.click(function(){
    	$("#searchResultWrap").empty();
    	cookResult();
    })


    // $(".inner_search").on("click",function () {
    //
    //     $("#searchInput").css("left",-100);
    // });
    trendyFoodResult();
    
	function trendyFoodResult(){
    	$.ajax({
    		url : "/ajax/search/${word}/tf/page/"+page,
			dataType : "json",
			type : "get",
			error : function() {
				alert("점검중!");
			},
			success : function(json) {
				if(json==""){
					$("#searchResultWrap").html(searchNoResultTmp({word:word}));
				}else{
					$("#searchResultWrap").html(searchTrendyFoodTmp({"searchTrendyFood":json}));
				}
			}//success end
    	})//ajax() end
    }// trendyFoodResult() end
    
    function cookResult(){
    	$.ajax({
    		url : "/ajax/search/${word}/cook/page/"+page,
			dataType : "json",
			type : "get",
			error : function() {
				alert("점검중!");
			},
			success : function(json) {
				if(json==""){
					$("#searchResultWrap").html(searchNoResultTmp({word:word}));
				}else{
					$("#searchResultWrap").html(searchCookTmp({"searchCook":json}));
				}
			}//success end
    	})//ajax() end
    }// trendyFoodResult() end
    
    function spotResult(){
    	$.ajax({
    		url : "/ajax/search/${word}/spot/page/"+page,
			dataType : "json",
			type : "get",
			error : function() {
				alert("점검중!");
			},
			success : function(json) {
				if(json==""){
					$("#searchResultWrap").html(searchNoResultTmp({word:word}));
				}else{
					$("#searchResultWrap").html(searchSpotTmp({"searchSpot":json}));
				}
			}//success end
    	})//ajax() end
    }// trendyFoodResult() end
    
    function userResult(){
    	$.ajax({
    		url : "/ajax/search/${word}/user/page/"+page,
			dataType : "json",
			type : "get",
			error : function() {
				alert("점검중!");
			},
			success : function(json) {
				if(json==""){
					$("#searchResultWrap").html(searchNoResultTmp({word:word}));
				}else{
					$("#searchResultWrap").html(searchUserTmp({"searchUser":json}));
				}
			}//success end
    	})//ajax() end
    }// trendyFoodResult() end

</script>

</body>
</html>