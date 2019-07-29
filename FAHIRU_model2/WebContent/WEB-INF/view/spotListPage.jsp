<%@page import="com.fas.fahiru.dao.LikesDAOImpl"%>
<%@page import="com.fas.fahiru.util.PaginateUtil"%>
<%@page import="com.fas.fahiru.vo.PageVO"%>
<%@page import="com.fas.fahiru.vo.Spot"%>
<%@page import="java.util.List"%>
<%@page import="com.fas.fahiru.dao.SpotsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spot List</title>
<%@ include file="/WEB-INF/template/link.jsp"%>
<link rel="stylesheet" href="/css/spotListPage.css" />

<style>
	.menu_prev {
		display:none;
	}
	
	a{
		color:#424242;
	}
	.add_fah {
		top:50px;
	}
	
	
	.spot_fah .fahs:hover{
		color:rgb(238,49,36);
		transform: scale(1.1);
	}
	
</style>
</head>
<body>
<%@ include file="/WEB-INF/template/header.jsp"%>
<div id="spotListWrap">
    <div id="spotFunctionSection">
        <div id="searchFieldset">

            </span>
            <form id="innerForm">
            <input id="place" name="searchWord" type="text" placeholder="Search">
            <button id="get" class="fas fa-search inner_search cursor_pointer"></button>
            </form>
        </div><!--//searchFieldset-->
        <div id="spotInsert"><a href="/spotCheck">spot 등록</a></div>
        <div class="custom-dropdown orderBy small">
            <select id="orderBy">
                <option value="score">점수순</option>
                <option value="new">최신순</option>
            </select>
        </div>
    </div><!--//spotFunctionSection-->
<%--     <%for(Spot spot : list){ %> --%>
    <div id="spotCardSection">

        
     </div><!--//spotCardSection -->
 </div><!--//spotListWrap -->
 
<c:import url="/WEB-INF/template/footer.jsp"/>

<!-- spotCardTmp 템플릿 -->
<script type="text/template" id="spotCardTmp">

	<@_.each(spots, function(spot) { @>

    <div class="spot_card">

            <div class="spot_card_main">
 				<div class="spot_name curor_pointer"><a href="/spot/<@=spot.no@>"><@=spot.name@></a></div>
                <a href="/spot/<@=spot.no@>">
                <div class="spot_img"><img src="../img/<@=spot.img@>" width="225" height="225"></div>
                </a>
			</div>
               
				<div class="spot_score">
                    <div class="totalTaste"><i class="fas fa-thermometer-three-quarters"></i> <br/> <@=spot.tftaste@></div>
                    <div class="totalPlating"><i class="fas fa-temperature-high"></i> <br/> <@=spot.tfplating@></div>
                </div>
				
                <div class="spot_fah">
                    <ul>
						<@ _.each(spot.fahList, function(fahList){ 
							let fahName = fahList.name;
							if(fahName.length > 6){ fahName = fahName.substring(0,6)+"...";} @>	
						<a href="/fah/<@=fahList.no@>"><li class="fahs"><@=fahName@> &deg;F</li></a>
						<@ }) @>
                    </ul>
                </div>
            <div class="spot_card_menu">
                <span style="margin-left: 20px;">Trendy food Menu</span>
                <div class="trendy_menu_wrap">
                    <ul class="trendy_menu_box">
					<@ _.each(spot.tfList, function(tfList){ 
						@>	
						<a href="/tf/<@=tfList.no@>"><li class="trendy_menu menu1"><img src="../img/<@=tfList.img@>"/></li></a>
					<@ }) @>
					</ul>
                </div>
				<@ if(spot.tfList.length > 3){@>
                <button class="menu_btn menu_prev fas fa-chevron-circle-left"></button>
                <button class="menu_btn menu_next fas fa-chevron-circle-right"></button>
				<@ }@>
            </div>
		<div class="spot_card_right">
            <div class="spot_card_info">
                <ul>
                    <li><i class="fas fa-map-marker-alt"></i> <@=spot.address@><br/><@=spot.subAddress@></li>
                    <li><i class="far fa-clock"></i> <@=spot.timeInfo@></li>
                </ul>
            </div>


            <div class="spot_card_buket">
                <button><i class="fas fa-shopping-basket cursor_pointer"></i></button>
				<div id="bucketCnt"><@=spot.spotBucketCnt@></div>
            </div>


            <a href="/user/<@=spot.userNo@>"><div class="spot_card_spotter">
                <div class="spot_spotter_img"><img src="/profile/<@=spot.profileImg@>"/></div>
                <div class="spot_spotter_name"><@=spot.nickname@></div>
            </div></a>

            </div>
 		</div>
	</div>
		
	<@})@>

        <button class="more_btn"> + more</button>
</script>

<script type="text/template" id="searchNoResultTmp">
<div id="searchNoResultWrap">
<div class="no_result">
    <span >"<@= $("#place").val() @>"<span>
        <span style="color: #424242">에 대한 결과가 없습니다.<span>
</div>
<div class="no_result_detail">
    검색어의 단어 수를 줄이거나, 보다 일반적인 검색어로 다시 검색해보세요.<br/>
    두 단어 이상을 검색하신 경우, 정확하게 띄어쓰기를 한 후 검색해 보세요.<br/>
    키워드에 있는 특수문자를 뺀 후에 검색해보세요.
</div>
</div>
</script>



<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>

    var $menuNext = $(".menu_next")
    var $trendyMenuBox = $(".trendy_menu_box")
   
    let cardMove1 = 0;
    
	//**************************************** click .menu_next
	

    $("#spotCardSection").on("click", ".menu_next", function () {

    	var nowLeft = $(this).parent().find(".trendy_menu_box").css("left");
    	
    	var res = nowLeft.split("px");

		if (res[0] == 0) {
			cardMove1 = 0;
		}

		cardMove1 = res[0];
		
		$(this).parent().find(".menu_prev").css("display", "block");
		
    	// li의 개수
        var liSize = $(this).parent().find(".trendy_menu_box li").length;
    	let changeSize = liSize * 90;
    	
    	$(this).parent().find(".trendy_menu_box").css("width", changeSize);

        let realSize = ($(this).parent().find(".trendy_menu_box").css("width")).split("px");
        console.log(realSize[0]);
   

 		if (cardMove1 == -(realSize[0]-360)) {
 				cardMove1 -= 90;
				$(this).parent().find(".menu_next").css("display", "none");
		} else {
				cardMove1 -= 90;
		}
        
        $(this).parent().find(".trendy_menu_box").css("left", cardMove1).css("transition", "ease .2s");
        

    }) // click next btn() end



  //**************************************** click .menu_prev
	
    $("#spotCardSection").on("click", ".menu_prev", function () {

        var liSize = $(this).parent().find(".trendy_menu_box li").length;
    	let changeSize = liSize * 90;
    	
    	$(this).parent().find(".trendy_menu_box").css("width", changeSize);

        let realSize = ($(this).parent().find(".trendy_menu_box").css("width")).split("px");
        console.log(realSize[0]);
        
		var nowLeft = $(this).parent().find(".trendy_menu_box").css("left");
    	
    	var res = nowLeft.split("px");

		if (res[0] == 0) {
			cardMove1 = 0;
		}

		cardMove1 = res[0];
		cardMove1 = Number(cardMove1);
		
		$(this).parent().find(".menu_next").css("display", "block");
 
		
 		if (cardMove1 == -90) {
 				console.log(cardMove1);	
 				cardMove1 += 90;
 				console.log(cardMove1);	
				$(this).parent().find(".menu_prev").css("display", "none");
		} else {
				cardMove1 += 90;
		}
        
        $(this).parent().find(".trendy_menu_box").css("left", cardMove1).css("transition", "ease .2s");
        
    }) // click prev btn() end

    //********************************************* getSpotList() 
    
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    const spotCardTmp = _.template($("#spotCardTmp").html());
    const searchNoResultTmp = _.template($("#searchNoResultTmp").html());

    let pageNo = 1;
    
    getSpotList();
    
    function getSpotList() {
    	
    	 $.ajax({
             url:"/ajax/spotList/"+pageNo,
             data:{
             	pageNo:pageNo
             },
             error:function () {
                 alert("에러");
             },
             success:function (json) {
            	 console.log(json);
            	 $("#spotCardSection").append(spotCardTmp({"spots":json.spots}));
                 
             }
         }); //ajax() end
	}// getSpotList() end
	
	function getSpotListByNew() {
    	
   	 $.ajax({
            url:"/ajax/spotListByNew/"+pageNo,
            data:{
            	pageNo:pageNo
            },
            error:function () {
                alert("에러");
            },
            success:function (json) {
           	 console.log(json);
           	 $("#spotCardSection").append(spotCardTmp({"spots":json.spots}));
                
            }
        }); //ajax() end
	}// getSpotListByNew() end
	

	
    $("#spotCardSection").on("click", ".more_btn", function() {
    	
    	$(this).remove();
    	
    	pageNo++;
    	console.log($("#orderBy").val());
    	
		if($("#orderBy").val() == "new"){
		
			getSpotListByNew();
			
		} else if($("#orderBy").val() == "score"){
			
			getSpotList();
			
		}
    }); // click() btn end
    
    
	$("#orderBy").on("change",function(){
		
		pageNo = 1;
		
 		console.log($(this).val());
		
		if($(this).val() == "new"){
			
			$("#spotCardSection").empty();
			getSpotListByNew();
			
		} else if($(this).val() == "score"){
			
			$("#spotCardSection").empty();
			getSpotList();
			
		}
	}); // change() end
	
	let searchWord ="";
	
	$("#innerForm").on("submit",function (e) {
    	
    	e.preventDefault();
		console.log($("#place").val());
		
		searchWord = $("#place").val();
		
		$.ajax({
    		url : "/ajax/innerSearchSpot/"+pageNo+"/search/"+searchWord,
			dataType : "json",
			type : "get",
			data : {
				searchWord:searchWord,
				pageNo:pageNo
			},
			error : function() {
				alert("점검중!");
			},
			success : function(json) {
				console.log(json);

				if(json.spots.length==0){
					$("#spotCardSection").empty();
					$("#spotCardSection").append(searchNoResultTmp);
				}else{
					$("#spotCardSection").empty();
					$("#spotCardSection").append(spotCardTmp({"spots":json.spots}));
				}
			}//success end
    	})//ajax() end

    });
	
	
	

   

</script>

</body>
</html>
