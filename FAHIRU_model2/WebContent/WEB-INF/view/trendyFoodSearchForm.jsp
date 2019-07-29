<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TrendyFood 중복검사</title>
<link rel="stylesheet" href="/css/default.css" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/trendyFoodSearchForm.css" />
</head>
<body>
	<div id="bg">
		<form id="trendyFoodForm" action="/">
			<div class="tf_form">
				<div class="trendy_food name">
					<span class="tf_name">음식명: </span>
					<div id="trendyFoodInputLine">
						<label for="trendyFoodInput"> <input id="trendyFoodInput">
						</label>
					</div>
					<div class="tf_auto">
						<ul id="tfAuto">

						</ul>
					</div>
				</div>
				<div id=spotSearch>
					<span id="spotFoodName">장소명:</span>
					<div id="spotInputLine">
						<label for="spotInput"> </label> <input id="spotInput">
					</div>
				</div>
				<button type="button" id="searchBtn">검색</button>
			</div>
			<div class="spot_list">
				<ul id="spotList">

				</ul>
			</div>
			<div class="cancel_btn">
				<a href="${header.referer }" id="cancel" class="f_l deco" type="button">취소</a>
			</div>
		</form>
	</div>
	<script type="text/template" id="tfAutoTmp">
	<@ _.each(tfList,function(tf){ @>
		<li class="tf_auto_item" data-name="<@=tf.name@>"><@=tf.name @></li>
	<@ }); @>
</script>
	<script type="text/template" id="tFSearchSpotListTmp">
    <@ _.each(spotList,function(spot){@>
    <li class="spot_auto_item">
        <div class="spot_detail">
            <span class="spot_name"> <@=spot.name@></span>
            <span class="address" data-address="<@=spot.address@>"> <@=spot.address@></span>
            <span class="accept">
			<@ if(spot.exist == 'F') {@>
                 <button type="button" onclick="location='/trendy/food'" data-no="<@=spot.no@>" data-name="<@=spot.name@>" class="accept_btn" >등록가능</button>
			<@}else {@>
				<button type="button" class="disable_btn" >등록 불가</button>
			<@}@>
            </span>
        </div>
    </li>
    <@})@>
</script>
	<script src="/js/jquery.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};

		const tfAutoTmp = _.template($("#tfAutoTmp").html());
		const tFSearchSpotListTmp = _
				.template($("#tFSearchSpotListTmp").html());

		let $tfList = $("#tfAuto");
		let $spotList = $("#spotList");

		let flag = true;

		$("#trendyFoodInputLine").on("keyup", "#trendyFoodInput", function() {

			let trendyFoodName = $("#trendyFoodInput").val().trim();

			console.log(trendyFoodName);

			if (trendyFoodName.length == 0) {
				return;
			}
			console.log("test1");

			$.ajax({
				url : "/ajax/trendy/food/check/auto/" + trendyFoodName,
				dataType : "json",
				type : "get",
				error : function() {
					alert("서버 검정 중");
				},
				success : function(json) {

					console.log(json);

					$tfList.empty();

					$tfList.append(tfAutoTmp({
						"tfList" : json
					}));

				}//success end
			});//ajax end
			$(".tf_auto").show();
		});//#trendyFoodInputLine keyup end

		let tfName = "";
		let checkName="";
		let spotName = "";

		$tfList.on("click", ".tf_auto_item", function() {

			$("#trendyFoodInput").val(this.dataset.name);
			
			checkName = $("#trendyFoodInput").val();

			console.log(tfName);

			$(".tf_auto").empty().hide();

			$("#spotSearch").show();

		});//$tfList click end
		

		$searchBtn = $("#searchBtn");
		
		$searchBtn.on("click", function() {
			
			spotName = $("#spotInput").val().trim();

			if (spotName.length == 0) {
				alert("스팟입력하세요");
				return false;
			}

			console.log(spotName);
			console.log(tfName);

			$.ajax({
				url : "/ajax/trendy/food/check/final/" + spotName,
				dataType : "json",
				data : {
					tfName : checkName
				},
				type : "get",
				error : function() {
					alert("서버 검정 중");
				},
				success : function(json) {

					console.log(json);

					$spotList.empty();

					$spotList.append(tFSearchSpotListTmp({
						"spotList" : json
					}));

				}//success end
			});//ajax end
			$(".spot_list").show();
		});//#trendyFoodInputLine click end
		
		
		$("#spotSearch").keypress(function(e){
		     if ( e.which == 13 ) {
		    	 $searchBtn.click();
		         return false;
		     }
		});//enter event 
		
		
		$("#spotList").on("click", ".accept_btn", function () {
			
			//alert("tesstst");
			
			// 세션 스토리지에 저장..
			//tfName.text(tfName);
			//spotName.text(spotName);
			
			//let test = $(this).parents(".spot_name").attr("data-name");
			let spotName = this.dataset.name;
			let spotNo = this.dataset.no;
			
			//console.log(test);
	                        
	        sessionStorage.setItem('tfName', checkName);
	        sessionStorage.setItem('spotName', spotName);
	        sessionStorage.setItem('spotNo', spotNo);

	        console.log(sessionStorage.getItem('spotNo'));
	        //console.log(spotName);
			
		});//accept_btn click end
	</script>
</body>
</html>