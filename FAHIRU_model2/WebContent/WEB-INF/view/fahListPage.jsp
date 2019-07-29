<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>화씨 리스트 페이지</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="/css/fahListPage.css" />
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp" />
<div id="fahWrap">
    <div id="fahSearch">
        <div id="fahSearchForm">
            <form id="fahForm">
                <fieldset>	
                    <select name="type" id="type">
                        <option value="fah" selected>&deg;F</option>
                        <option value="writer">작성자</option>
                    </select>
                    <input id="fahInputForm" name="name" width="200px" type="text" placeholder="검색어를 입력해주세요.">
                    <button class="fas fa-search innerSearch"></button>
                </fieldset>
            </form>
        </div>
    </div><!--//fahSearch-->

    <div id="fahFilter">
<!--         <select id="fahFilterForm"> -->
<!--             <option value="trendy" selected>트렌드지수순</option> -->
<!--             <option value="new">최신순</option> -->
<!--             <option value="subscribe">subscribe순</option> -->
<!--         </select> -->
    </div>
  
    <div id="fahSection">
        <ul>
              <li class="clear">
            </li>
        </ul>
    </div><!--//fahSection-->

</div><!--//fahWrap-->
<!--fahTmp-->
	<c:import url="/WEB-INF/template/footer.jsp" />
<script type="text/template" id="fahTmp">
    <@
    _.each(fahs, function(fah) { @>

    <li class="card_fah_list">
        <div class="card_fah">
            <img class="img_card_fah" src="/img/<@=fah.fahImg@>"/>
			<a href="/fah/<@=fah.no@>">
            <h4><strong class="title"><@=fah.name@></strong><span class="fah">&deg;F</span></h4>
			</a>
            <div class="top back">
                <span class="trend_score"><@=fah.score@></span>
            </div>
            <div class="bottom back">
				<a href="/user/<@=fah.userNo@>">
                <img class="fah_user" src="/profile/<@=fah.profileImg@>"/>
                <span class="fah_nickname"><@=fah.nickname@></span>
				</a>
                <img class="subscribe_icon" src="/img/fire.png"/>
                <span class="subscribe_cnt"><@=fah.cnt@></span>
            </div>
        </div>
    </li>
    <@})@>
	<@if(fahs.length==8){@>
	<button class="more_btn">+more</button>
	<@}@>
</script>

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
    _.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    const fahTmp = _.template($("#fahTmp").html());
    const $fahSectionUl = $("#fahSection ul");
    let page = 1;
    
    function getFahList() {
    	 $.ajax({
             url:"/ajax/fah/page/"+page,
             error:function () {
                 alert("에러");
             },
             success:function (json) {
            	 console.log(json);
                 $(".clear").before(fahTmp({"fahs":json}));
             }
         }); //ajax() end
	}//getFahList() end

    $("#fahSection ul").on("click",".more_btn",function() {
    	let name = $("#fahInputForm").val();
    	page++;
    	$(this).remove();
    	if(name==null||name==""){
    		getFahList();
    	}else{
    		getFahListSearch();
    	}
    		
    }); //click() end
    
    $("form").on("submit",function(){
		page = 1;
    	getFahListSearch();
    	return false;
    });//fahForm end
    
    getFahList();
    
    function getFahListSearch() {
    	let name = $("#fahInputForm").val();
    	let type = $("#type").val();
    	console.log(type);
    	if(name==null||name==""){
    		alert("검색어를 입력해주세요.");
    		return false;
    	}
    	$("#fahSection ul").empty();
		$.ajax({
			url:"/ajax/fah/search/type/"+type+"/name/"+name+"/page/"+page,
			type:"GET",
			dataType:"json",
			error:function(){
				alert("에러");
			},	
			success:function(json){
				console.log(json);
				$("#fahSection ul").append(fahTmp({"fahs":json}));
			}
		});//ajax() end
	}
    
//  fahAddTmp
 	$(".card_foodrendy").hover(function () {
        $(this).find(".cooking_score").toggle(0);
    });

    $addFah = $(".add_fah")

    $addFah.click(function () {
        $("#bg").show()
        $("#fahplus").show()
    });

    $("#bg, .cancel").click(function () {
        $("#bg").hide()
        // = $(this).hide()
        $("#fahplus").hide()
    });
</script>
</body>
</html>