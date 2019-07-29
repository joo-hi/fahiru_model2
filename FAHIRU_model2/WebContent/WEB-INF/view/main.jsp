<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="/css/mainFeed.css" />
<link rel="stylesheet" href="/css/followingPage.css" />
<c:import url="/WEB-INF/template/link.jsp" />
<title>Fahiru</title>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<div id="banner"></div>
	<div id="bannerBtn" class="fas fa-angle-double-up"></div>
	<main id="content">
	<section>
		<ul>
			<li id="flaze" class="on">HOT</li>
			<c:if test="${loginUser!=null}">
			<li id="feed" data-userNo="${loginUser.no }">˚Feed</li>
			<li id="following" data-userNo="${loginUser.no }">˚Following</li>
			</c:if>
		</ul>
	</section>
	<!-- //section end -->

	<div id="mainWrap">
		<div id="flazeWrap">
			<c:forEach items="${list }" var="main">
			<div id="rankingBoxWrap${main.ranking}">
				<div class="ranking_fah">${main.name}˚F</div>
				<button class="subscribe_btn">
					<img src="../img/subscribeImg.PNG" width="40px" height="40px"><span>${main.cnt}</span>
				</button>
				<i class="fas fa-chevron-left btn prev_btn prev_event"></i>
				<div class="total_wrap">
					<ul id="firstTotalBox" class="total_box">
					<c:forEach items="${main.tfCook }" var="fah">
						<c:choose>
								<c:when test="${fah.categoryNo==2 }">
									<a href="/tf/${fah.no }">
								</c:when>
								<c:otherwise>
									<a href="/cook/${fah.no }">
								</c:otherwise>
								</c:choose>
							<li class="box1">
							<c:choose>
								<c:when test="${fah.categoryNo==2 }">
									<div class="card_foodrendy">
								</c:when>
								<c:otherwise>
									<div class="cook_card">
								</c:otherwise>
							</c:choose>
									<div class="cooking_score">${fah.score }</div>
									<img class="img_card_foodrendy" src="/img/${fah.img }">
									<div class="foodrendy_score"></div>
									<div class="top back">
										<div class="foodrendy_name">${fah.name }</div>
										<div class="badge_taste"></div>
										<div class="badge_plating"></div>
									</div>
									<div class="bottom back">
										<img class="fah_user" src="../profile/${fah.profileImg }" />
										<div class="fah_nickname">${fah.nickname }</div>
										<div class="fas fa-shopping-basket"></div>
										<div class="buketlist_cnt">${fah.bucketCnt }</div>
									</div>
								</div>
						</li>
						</a>
						</c:forEach>
					</ul>
				</div>
				<!--total_wrap end-->
				<i class="fas fa-chevron-right btn next_btn next_event"></i>
			</div>
			<!--//rankingBoxWrap end-->	
			</c:forEach><!-- //rankingBoxWrap foreach end -->


			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<div id="spotRankingBox" style="display: none">
				<div class="ranking_fah">Trendy SPOT...</div>
				<i class="fas fa-chevron-left btn spot_prev_btn spot_prev"></i>
				<div id="spotWrap">
					<div id="spotRanking">
						<div id="spot1"></div>
						<div id="spot2"></div>
						<div id="spot3"></div>
						<div id="spot4"></div>
						<div id="spot5"></div>
						<div id="spot6"></div>
					</div>
				</div>
				<!--//spotWrap end-->
				<i class="fas fa-chevron-right btn spot_next_btn spot_next"></i>
			</div>
			<!--//spotRankingBox end-->

			<div id="userRankingBox" style="display: none">
				<div class="ranking_fah">Trender...</div>
				<div class="">
					<div id="user1" class="trender_profile_image">
						<div class="user_nickname">닉네임</div>
					</div>
					<div id="user2" class="trender_profile_image">
						<div class="user_nickname">닉네임</div>
					</div>
					<div id="user3" class="trender_profile_image">
						<div class="user_nickname">닉네임</div>
					</div>
					<div id="user4" class="trender_profile_image">
						<div class="user_nickname">닉네임</div>
					</div>
					<div id="user5" class="trender_profile_image">
						<div class="user_nickname">닉네임</div>
					</div>
				</div>
			</div>
			<!--//userRankingBox end-->

		</div>
		<!-- //flazeWrap -->
	</div>
	<!-- //mainWrap --> </main>
	<!-- //main end -->

	<div id="bannerSub"></div>
	<div id="bannerRecommend">
		<div id="recommendTitle">RECOMMEND</div>
		<div id="recommendLeft"></div>
		<div id="recommendRight"></div>
	</div>

	<c:import url="/WEB-INF/template/footer.jsp" />
	<script type="text/template" id="feedTmp">
<div id="feedFah">
	<button class="fah_btn left fas fa-chevron-left" type="button"></button>
	<div id="feedWrap">
		<div id="fahListUL">


			<@ _.each(feedList, function(feed){ 
				var fName = feed.name;
				if(fName.length>=6){
				fName= fName.substring(0,3)+"...";
			}
			@>
			<div class="fah_list"><a href="/fah/<@=feed.no@>"><@=fName@>˚F</a></div>
			<@})@>

		</div> 
	</div>
	<button class="fah_btn right fas fa-chevron-right" type="button"></button>
</div>
	<ul id="fahListDiv">
		<@ _.each(feedList, function(tfCook){

			var tcScore = tfCook.score;
			
			var bool = (tcScore.toString()).length==2;
			
			if(bool){
				tcScore += ".0";
			}
			
			var tcName = tfCook.name;

            if(tcName.length>=7){
            	tcName = tcName.substring(0, 7) + "...";
            }
		@>
		
		<@if(tfCook.categoryNo==2){@>
		<a href="/fah/<@=tfCook.no@>">
		<li class="fah_menu_card tf">
		<@}else{@>
			<a href="/cookDetailPage.jsp?no=<@=tfCook.no@>">
			<li class="fah_menu_card cook"> <@}@>
           	<div class="cooking_score"><@=tcScore @></div>
			<img class="fah_menu_img" src="../img/<@=tfCook.fahImg@>"/>
           	<div class="foodrendy_score"><@=tfCook.score@></div>
            <div class="top back">
	            <div class="food_name"><@=tcName@>˚F</div>
                <div class="badge_taste"></div>
               	<div class="badge_plating"></div>
            </div>
            <div class="bottom back">	               
				<div class="fah_card_user">
                	<img class="fah_user" src="../profile/<@=tfCook.profileImg@>"/>
                   	<div class="fah_nickname"><@=tfCook.nickname@></div>
               	</div>
               	<div class="fah_card_bucket">
	                <div class="bucket_icon fas fa-shopping-basket"></div>
                   	<div class="buketlist_cnt"><@=tfCook.cnt@></div>
               	</div>
           	</div>
        </li>
		</a>
		<@})@>
        <div class="fah_menu_add">
            <span class="more_btn">+more</span>
        </div>
	</ul>

</script>

	<script type="text/template" id="followingTmp">

<div id="followingSection">

<h2 class="screen_out">following 목록</h2>
<ul id="followingList">
	<@ 
	_.each(followList,function(follow,idx){  
	@>

    <li class="following_list<@=idx@> user_box_section">
        <a href="/myPage.jsp?no=<@=follow.no@>"><h3 class="following_profile">
            <img class="following_profile_img" src="../profile/<@=follow.userProfileImg@>" />
            <strong class="following_profile_nickname"><@=follow.nickname@></strong>
        </h3></a>
		<div class="following_foodrendy_list">
                <h4 class="screen_out">follower의 foodrendy 목록</h4>
                <ul class="item_card_foodrendy_wrap list_idx<@=idx@>">
					<@ 
						var one = followList[idx].tfCooks;
						console.log(one);
						var cardCnt = one.length;
						_.each(one,function(user){
						var tcScore = user.score;
			
						var bool = (tcScore.toString()).length<=2;
			
						if(bool){
							tcScore += ".0";
						}
						var fName = user.name;
						if(fName.length>=6){
							fName= fName.substring(0,6)+"...";
						}
					 @>
                    <li class="item_card_foodrendy" data-cardcnt="<@=cardCnt@>">
						<@ if(user.categoryNo==2) { @>
                        <div class="card_foodrendy"><@}else{@><div class="cook_card"><@}@>
                            <div class="cooking_score"><@=tcScore @></div>
                            <img class="img_card_foodrendy" src="../img/<@=user.img @>">
                            <div class="top back">
                                <div class="foodrendy_name"><@=fName @></div>
                                <div class="badge_taste"></div>
                                <div class="badge_plating"></div>
                            </div>
                            <div class="bottom back">
                                <div class="buketlist_icon"></div>
                                <div class="buketlist_cnt"><@=user.cnt @></div>
                            </div>
                        </div>
                    </li>
					<@
							})
					 @>
             	</ul>
        </div>
        <button class="fas fa-chevron-circle-left foodrendy_btn_left foodrendy_btn moveBtn<@=idx@>"></button>
        <button class="fas fa-chevron-circle-right foodrendy_btn_right foodrendy_btn moveBtn<@=idx@>"></button>
    </li>
	<@})@>
</ul>
</div><!--//followingSection-->

</script>

	<script type="text/template" id="subscribeMoreTmp">
<ul>
<@ _.each(subList.fahs,function(sub){@>
	<@if(!sub){@>
	<li>구독한 화씨가 없습니다.</li>
	<@}else{@>
    <li>
        <img class="subscribe_img" src="../img/<@=sub.fahImg@>"/>
        <div class="subscribe_name"> <@=sub.name@>˚F</div>
        <div class="subscribe_alarm"></div>
    </li>
	<@}@>
<@})@>
	<li class="subscribe_list_add">
        <i class="fas fa-angle-double-down"></i>
    </li>
</ul>

</script>

	<script src="/js/underscore-min.js"></script>
	<script src="/js/jquery.js"></script>
	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};

		/*** 화씨 move 이동 변수 ***/
		let fahMove = 0;
		let spotMove = 0;

		let cardCnt = 0;

		var $fahList = $(".fah_list");
		var $fahBtn = $(".fah_btn");

		let fahListEnd;

		let foodrendyMoveEnd = 0;

		const subscribeMoreTmp = _.template($("#subscribeMoreTmp").html());

		const feedTmp = _.template($("#feedTmp").html());
		const followingTmp = _.template($("#followingTmp").html());

		const $flaze = $("#flaze");
		const $feed = $("#feed");
		const $following = $("#following");

		$loginUser = $(".login_user")
		let $sideBar = $("#sideBar");

		const $subscribeListUl = $("#subscribeList ul");

		let userNo = 0;

		$loginUser.on("click", function() {

			userNo = this.dataset.userno;
			getSubscribeList();
			$sideBar.css("transform", "translate(0px)").css("transition",
					"linear .3s ");
		})

		function getSubscribeList() {

			$.ajax({
				url : "/ajax/SubscribeList.json",
				dataType : "json",
				type : "get",
				data : {
					userNo : userNo
				},
				error : function() {
					alert("점검중!");
				},
				success : function(json) {
					$("#subscribeList").append(subscribeMoreTmp({
						"subList" : json
					}));
				}//success end
			});//ajax end

		}//getSubscribeList() end

		$("#content, #header").on(
				"click",
				function() {
					$sideBar.css("transform", "translate(300px)").css(
							"transition", "linear .2s ");
				})

		$subscribeListUl.on("click", ".subscribe_list_add", function() {

			console.log(this.dataset.userno);
			$subscribeListUl.empty();
			$(this).remove();
			getSubscribeList();

		})

		/************** 화씨 버튼 클릭시 이동 이벤트 **************/

		$("#mainWrap").on("click", ".prev_event", function() {

			var nowLeft = $(this).parent().find(".total_box").css("left");

			var res = nowLeft.split("px");
			$(this).parent().find(".next_event").css("display", "block");

			if (res[0] == 0) {
				fahMove = 0;
			}

			fahMove = res[0];

			fahMove = Number(fahMove);

			if (fahMove == -300) {
				$(this).parent().find(".total_box").css("transition", "0.1s");
				fahMove += 300;
				$(this).parent().find(".prev_event").css("display", "none");
			} else {
				fahMove += 300;
				$(this).parent().find(".total_box").css("transition", "0.1s");
			}
			$(this).parent().find(".total_box").css("left", fahMove);
		});

		$("#mainWrap").on("click", ".next_event", function() {
			
			
			var nowLeft = $(this).parent().find(".total_box").css("left");

			var res = nowLeft.split("px");

			if (res[0] == 0) {
				fahMove = 0;
			}

			fahMove = res[0];

			$(this).parent().find(".prev_event").css("display", "block");
			if (fahMove == -900) {
				$(this).parent().find(".total_box").css("transition", "0.1s");
				fahMove -= 300;
				$(this).parent().find(".next_event").css("display", "none");
			} else {
				$(this).parent().find(".total_box").css("transition", "0.1s");
				fahMove -= 300;
			}

			$(this).parent().find(".total_box").css("left", fahMove);
		});

		/************** spot 버튼 클릭시 이동 이벤트 **************/

		$(".spot_prev").click(function() {
			if (spotMove == 0) {
				spotMove = -4000;
				$("#spotRanking").css("transition", "0.2s");
			} else {
				spotMove += 800;
				$("#spotRanking").css("transition", "0.2s");
			}
			$("#spotRanking").css("left", spotMove);

		});

		$(".spot_next").click(function() {
			if (spotMove == -4000) {
				spotMove = 0;
				$("#spotRanking").css("transition", "0.2s");
			} else {
				spotMove -= 800;
				$("#spotRanking").css("transition", "0.2s");
			}

			$("#spotRanking").css("left", spotMove);

		});

		//    fahAddTmp

		$("#mainWrap").on("mouseenter", ".card_foodrendy", function() {
			$(this).find(".cooking_score").slideUp(200);
		})
		$("#mainWrap").on("mouseenter", ".cook_card", function() {
			$(this).find(".cooking_score").slideUp(200);
		})
		$("#mainWrap").on("mouseleave", ".card_foodrendy", function() {
			$(this).find(".cooking_score").slideDown(200);
		})
		$("#mainWrap").on("mouseleave", ".cook_card", function() {
			$(this).find(".cooking_score").slideDown(200);
		})

		$("#mainWrap").on("mouseenter", ".tf", function() {
			$(this).find(".cooking_score").slideUp(200);
		})
		$("#mainWrap").on("mouseenter", ".cook", function() {
			$(this).find(".cooking_score").slideUp(200);
		})
		$("#mainWrap").on("mouseleave", ".tf", function() {
			$(this).find(".cooking_score").slideDown(200);
		})
		$("#mainWrap").on("mouseleave", ".cook", function() {
			$(this).find(".cooking_score").slideDown(200);

		})

		$(".cook_card").hover(function() {
			$(this).find(".cooking_score").toggle(0);
		});

		$addFah = $(".add_fah")

		$addFah.click(function() {
			$("#bg").show()
			$("#fahplus").show()
		});

		$("#bg, .cancel").click(function() {
			$("#bg").hide()
			// = $(this).hide()
			$("#fahplus").hide()
		});

		$flaze.click(function() {

			$(".on").removeClass("on");

			$(this).addClass("on");
			$("#feedFah").remove();
			$("#fahListDiv").remove();
			$("#followingSection").remove();
			$("#flazeWrap").css("display", "block");
			fahList();
		})

		
		$feed.click(function() {

			$("#flazeWrap").css("display", "none");
			$("#followingSection").remove();
			$("#feedFah").remove();
			$("#fahListDiv").remove();
			$(".on").removeClass("on");

			$(this).addClass("on");

			///ajax/SubscribeList.json
			
			$.ajax({
				url : "/ajax/main/feed/${loginUser.no}",
				dataType : "json",
				type : "get",
				error : function() {
					alert("점검중!");
				},
				success : function(json) {
					
					console.log(json.mainFeed);
					
					$("#mainWrap").append(feedTmp({"feedList" : json.mainFeed}));
					fahList();
				}//success end
			});

		});

		$following.click(function() {

			$("#flazeWrap").css("display", "none");
			$("#feedFah").remove();
			$("#fahListDiv").remove();
			$("#followingSection").remove();

			$(".on").removeClass("on");

			$(this).addClass("on");

			followingList();
		})

		//"/ajax/followingList.json"
		//main/following/{no}
		function followingList() {
			console.log($(".item_card_foodrendy").length);
			$.ajax({
				url :"/ajax/main/following/${loginUser.no}",
				dataType : "json",
				type : "get",
				error : function() {
					alert("점검중!");
				},
				success : function(json) {
					console.log(json);
					console.log(json.mainFollowing);
				
					$("#mainWrap").append(followingTmp({
						"followList" : json
					}));

					/*
					$.each(json, function(cnt) {
						console.log(json[cnt].tcCnt);
						$(".list_idx" + cnt)
								.css("width", 270 * json[cnt].tcCnt);

						if (json[cnt].tcCnt <= 4) {
							console.log($(".user_box" + cnt))
							$('.moveBtn' + cnt).css("display", "none");
						}
					})
					*/
					
				}//success end
			});//ajax end
		}

		let fahListMove = 0;
 
		$("#mainWrap").on("click", ".right", function() {
			if (fahListMove == 800 - fahListEnd) {
				$(".right").css({
					"disabled" : "disabled",
					display : "none"
				});
				fahListMove -= 100;
				$(".left").css({
					display : "block"
				});
			} else {
				$(".fah_btn").css("display", "block")
				fahListMove -= 100;
			}
			$("#mainWrap #fahListUL").css("left", fahListMove);
		})

		$("#mainWrap").on("click", ".left", function() {
			if (fahListMove == -100) {
				$(".left").css({
					"disabled" : "disabled",
					display : "none"
				});
				$(".right").css({
					display : "block"
				});
				fahListMove += 100;
			} else {
				$(".fah_btn").css("display", "block")
				fahListMove += 100;
			}
			$("#mainWrap #fahListUL").css("left", fahListMove);
		})

		$("body").on(
				"click",
				".fa-angle-double-up",
				function() {

					$("#banner").slideToggle(200);

					$("#bannerBtn").removeClass("fa-angle-double-up").addClass(
							"fa-angle-double-down");
				})

		$("body").on(
				"click",
				".fa-angle-double-down",
				function() {

					$("#banner").slideToggle(200);

					$("#bannerBtn").removeClass("fa-angle-double-down")
							.addClass("fa-angle-double-up");
				})

		$fahListUL = $("#fahListUL");

		function fahList() {
			fahListEnd = $(".fah_list").length * 100;
			if ($(".fah_list").length <= 6) {
				$(".fah_list").addClass("i_b");
				$(".fah_list").removeClass("f_l");
				$(".fah_btn").css("display", "none");
			} else if ($(".fah_list").length == 7) {
				$(".fah_list").removeClass("i_b");
				$(".fah_list").addClass("f_l");
				$("#fahListUL").css("width", fahListEnd);
				$(".fah_btn").css("display", "none");
			} else {
				$(".fah_list").removeClass("i_b");
				$(".fah_list").addClass("f_l");
				$("#fahListUL").css("width", fahListEnd);
				$(".left").css({
					"display" : "none"
				});
			}
		}

		let foodrendyMove = 0;

		$("#mainWrap").on(
				"click",
				".foodrendy_btn_left",
				function() {
					var nowLeft = $(this).parent().find(
							".item_card_foodrendy_wrap").css("left");

					var res = nowLeft.split("px");

					if (res[0] == 0) {
						foodrendyMove = 0;
					}
					foodrendyMove = res[0];
					foodrendyMove = Number(foodrendyMove);
					$(this).parent().find(".foodrendy_btn_right").css(
							"display", "block");

					if (foodrendyMove == -270) {
						$(this).parent().find(".foodrendy_btn_left").css(
								"display", "none");
						foodrendyMove += 270;
					} else {
						foodrendyMove += 270;
					}
					$(this).parent().find(".item_card_foodrendy_wrap").css(
							"left", foodrendyMove);
				})

		$("#mainWrap").on(
				"click",
				".foodrendy_btn_right",
				function() {

					$(this).parent().find(".foodrendy_btn_left").css("display",
							"block");

					var total = $(this).parent().find("li").length;

					foodrendyMoveEnd = (1350 - 270 * total);

					var nowLeft = $(this).parent().find(
							".item_card_foodrendy_wrap").css("left");

					var res = nowLeft.split("px");

					if (res[0] == 0) {
						foodrendyMove = 0;
					}
					foodrendyMove = res[0];
					foodrendyMove = Number(foodrendyMove);

					if (foodrendyMove == foodrendyMoveEnd) {
						$(this).parent().find(".foodrendy_btn_right").css(
								"display", "none");
						foodrendyMove -= 270;
					} else {
						foodrendyMove -= 270;
					}
					$(this).parent().find(".item_card_foodrendy_wrap").css(
							"left", foodrendyMove);
				})
	</script>
</body>
</html>