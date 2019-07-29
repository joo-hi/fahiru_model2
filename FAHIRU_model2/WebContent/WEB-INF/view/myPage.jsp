<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="/css/myPage.css" />

<style>
.spot_name>a {
	text-decoration: none;
	color: #222222;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<!-- 7/2 myPage 전체 수정 -->
	<div id="mypageWrap">
		<div id="mypageInfoSection">
			<div id="mypageInfoContent">
				<form id="writeForm" action="/intro" method="post"
					enctype="multipart/form-data">
					<fieldset>
						<input type="hidden" name="profileImage" id="uploadImage" />
						<div id="mypageImg">
							<label class="fas fa-camera"> <img
								src="/profile/${user.profileImg }" width="250px" height="250px">
								<input type="file" name="upload" id="upload" />
							</label>
						</div>
						<div id="mypageNickname">
							<h3>${user.nickname }</h3>
						</div>
						<div id="mypageIntroduce">
							<div id="introduce">${user.message }</div>
							<textarea id="introduceContent" name="intro">${user.message }</textarea>
							<button form="writeForm" class="mypage_btn intro_btn"
								type="button">수정</button>
						</div>
					</fieldset>
				</form>
			</div>
			<div id="mypageInfoFunction">
				<div class="infoFunction mypage_follow">팔로워
					${user.followerCnt}명</div>
				<div class="infoFunction mypage_following">팔로잉
					${user.followingCnt }명</div>

			</div>
			<c:choose>
				<c:when test="${user.no == loginUser.no }">
					<div id="mypageInfoBadge">
						<button class="mypage_btn my_info_btn">
							<a href="/information/${user.no }">내 정보수정</a>
						</button>
					</div>
				</c:when>
				<c:otherwise>
					<div id="mypageInfoBadge">
						<button data-no="${user.no }" class="follow_btn">팔로우</button>
						<input type="hidden" name="_method" value="DELETE" />
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<!--//mypageInfoSection-->
		<div id="mypageListSection">
			<c:if test="${user.no == loginUser.no }">
				<div id="mypagePostList">
					<div id="mypageWritePost" class="mypagelist_on">내가 쓴 글</div>
					<div id="mypageWriteComment">내가 쓴 댓글</div>
					<div id="mypageBucketlist">Bucket list</div>
				</div>
			</c:if>
			<div id="myChange">
				<div id="mypageList">
					<div id="mypageFah" class="categoryList_on">˚F</div>
					<div id="mypageTrendyFood">Trendy food</div>
					<div id="mypageCook">Cook</div>
					<div id="mypageSpot">Spot</div>
				</div>
				<div id="mypageListContent">
					<ul id="listBox"></ul>
				</div>
			</div>
		</div>
		<!--//mypageListSection-->
	</div>
	<!--//mypageWrap-->
	<div id="followBg"></div>
	<div id="followWrap">
		<div id="followTitle">
			<h2>팔로워</h2>
			<button class="fas fa-times close"></button>
		</div>
		<div id="followBox">
			<ul></ul>
		</div>
		<!--//followBox-->
	</div>
	<!--//followWrap-->
	<div id="followingBg"></div>
	<div id="followingWrap">
		<div id="followingTitle">
			<h2>팔로잉</h2>
			<button class="fas fa-times close"></button>
		</div>
		<div id="followingBox">
			<ul></ul>
		</div>
		<!--//followingBox-->
	</div>
	<c:import url="/WEB-INF/template/footer.jsp" />
	<!--//followingWrap-->
	<!--///////////////////////////template start//////////////////////////////////-->
	<script type="text/template" id="followTmp">
				<@_.each(followers,function(follower){
				nickname = follower.nickname;
				if(follower.nickname.length>7){
				nickname = nickname.substring(0,7) + "...";
				}@>
                <li class="follow">
					<a href="/user/<@=follower.no@>">
                    <div class="follow_img"><img src="/profile/<@=follower.userProfileImg@>"/></div>
                    <div class="follow_nickname"><@=nickname@></div>
					</a>
					<form>
                    <button <@if(follower.no==${loginUser.no}){@>style="display: none;"<@}@> data-no="<@=follower.no@>"
					class="follow_btn <@if(follower.follow==true){@>on<@}else{@> <@}@>">
					<@if(follower.follow==true){@>팔로잉<@}else{@>팔로우<@}@></button>
					</form>
				</li>
				<@})@>
				<@if(followers.length==8){@>
				<li class="follow_list_add">
                <i class="fas fa-angle-double-down"></i>
                </li>
				<@}@>
</script>
	<!--followTmp-->

	<script type="text/template" id="followingTmp">
				<@_.each(followings,function(following){
				nickname = following.nickname;
				if(this.nickname.length>7){
				nickname = nickname.substring(0,7) + "...";
				}@>
                <li class="following">
					<a href="/user/<@=following.no@>">
                    <div class="following_img"><img src="/profile/<@=following.userProfileImg@>"/></div>
                    <div class="following_nickname"><@=nickname@></div>
					</a>
                    <button <@if(following.no==${loginUser.no}){@> style="display: none;"<@}@> data-no="<@=following.no@>"  
					class="follow_btn <@if(following.follow==true){@>on<@}else{@> <@}@>">
					<@if(following.follow==true){@>팔로잉<@}else{@>팔로우<@}@></button>
				</li>
				<@})@>
				<@if(followings.length==8){@>
                <li class="following_list_add">
                    <i class="fas fa-angle-double-down"></i>
                </li>
				<@}@>
</script>
	<script type="text/template" id="fahTmp">
    <@_.each(fahs, function(fah) { @>
	<a href="/fah/<@=fah.no@>">
    <li style="list-style:none" class="fah_card_li">
        <div class="fah_card">
            <img class="fah_card_img" src="/img/<@=fah.fahImg@>">
            <h4><strong class="title"><@=fah.name@></strong><span class="fah">&deg;F</span></h4>
            <div class="top back">	
                <span class="trend_score"><@=fah.score@></span>
            </div>
                <div class="bottom back">
                <span class="subscribe_icon"></span>
                <span class="subscribe_cnt"><@=fah.cnt@></span>
                </div>
         </div>
    </li>
	</a>
    <@})@>
<@if(fahs.length>8){@>
<button class="fah more_btn">+more</button>
<@}@>
</script>
	<script type="text/template" id="trendfoodTmp">
	<@ _.each(trendyfoods,function(tf){@>
	<a href="/tf/<@=tf.no@>">
		<@name = tf.name;
		if(tf.name.length>7){
			name = name.substring(0,7) + "...";
		}@>
        <li class="trendfood_card_li">
            <div class="trendfood_card">
                <h4 class="cooking_score"><@=tf.score@></h4>
                <img class="trendfood_img_card" src="/img/<@=tf.img@>"/>
                <div class="top back">
                    <div class="foodrendy_name"><@=name@></div>
                    <@if(tf.taste>=45){@>
					<div class="badgeBox_taste">
                        <div class="left"></div>
                        <div class="right"></div>
                        <div class="badge"><h3 class="badge_taste">T</h3></div>
                    </div>
					<@}@>
					<@if(tf.plating>=45){@>
                    <div class="badgeBox_plating">
                        <div class="left"></div>
                        <div class="right"></div>
                        <div class="badge"><h3 class="badge_plating">P</h3></div>
                    </div>
					<@}@>
                </div>

                <div class="bottom back">
                    <div class="trendfood_user">
						<a href="/user/<@=tf.userNo@>">
                        <div class="trendfood_img"><img src="/profile/<@=tf.profileImg@>"/></div>
                        <div class="trendfood_nickname"><@=tf.nickname@></div>
                    </div>
                    <div class="fas fa-shopping-basket btn"></div>
                    <div class="buketlist_cnt"><@=tf.cnt@></div>
                </div>
            </div>
        </li>  
		</a>  
		<@});@>
		<@if(tfs.length>8){@>
		<button class="trend_Food more_btn">+more</button>
		<@}@>
</script>
	<script type="text/template" id="cookTmp">
	<@ _.each(cooks,function(cook){
		name = cook.name;
		if(cook.name.length>7){
			name = name.substring(0,7) + "...";
		}
		@>
        <li class="cook_card_li">
			<a href="/cook/<@=cook.no@>">
            <div class="cook_card">
                <h4 class="cooking_score"><@=cook.score@></h4>
                <img class="cook_img_card" src="/profile/<@=cook.img@>">
                <div class="top back">
                    <div class="foodrendy_name"><@=name@></div>
                    <@if(cook.taste>=45){@>
					<div class="badgeBox_taste">
                        <div class="left"></div>
                        <div class="right"></div>
                        <div class="badge"><h3 class="badge_taste">T</h3></div>
                    </div>
					<@}@>
                    <@if(cook.taste>=45){@>
					<div class="badgeBox_plating">
                        <div class="left"></div>
                        <div class="right"></div>
                        <div class="badge"><h3 class="badge_plating">P</h3></div>
                    </div>
					<@}@>
                </div>
                <div class="bottom back">
                    <div class="cook_user">
						<a href="/user/<@=cook.userNo@>">
                        <div class="cook_img"><img src="/profile/<@=cook.profileImg@>"/></div>
                        <div class="cook_nickname"><@=cook.nickname@></div>
                    	</a>
					</div>
                    <div class="fas fa-shopping-basket btn"></div>
                    <div class="buketlist_cnt"><@=cook.cnt@></div>
                </div>
            </div>
			</a>
        </li>
		<@});@>
		<@if(cooks.length>8){@>
		<button class="cook more_btn">+more</button>
		<@}@>
</script>
	<script type="text/template" id="spotTmp">
        <@_.each(spots, function(spot, idx) { 
		timeInfo = spot.timeInfo;
		if(spot.timeInfo!=null){
			if(spot.timeInfo.length>17){
				timeInfo = timeInfo.substring(0,17) + "...";
			}
		}
		@>
        <li class="spot_card_li">
			<a href="/spot/<@=spot.no@>">
            <div class="spot_card">
                <div class="spot_card_main">
					
                    <span class="spot_name"><@=spot.name@></span>
                    <div class="spot_img"><img src="/img/<@=spot.img@>" width="225" height="225"></div>
                    
					<div class="spot_score">
                        <div class="totalTaste"><i class="fas fa-thermometer-three-quarters"></i> <br/> <@=spot.tftaste@></div>
                        <div class="totalPlating"><i class="fas fa-temperature-high"></i> <br/> <@=spot.tfplating@></div>
                    </div><!--//spot_score-->
                    <div class="spot_fah">
                        <ul>
                            <@ var fahListArrs = spot.fahList;
							_.each(fahListArrs, function(fahList){ @>	
							<li><a href="/fah/<@=fahList.no@>"><@=fahList.name@> &deg;F</a></li>
						<@ }); @>
                        </ul>
                    </div><!--//spot_fah-->
                </div><!--//spot_card_main-->
                <div class="spot_card_menu">
                    <span>Trendy food Menu</span>
                    <div class="trendy_menu_wrap">
                        <ul class="trendy_menu_box">
                            <@ 
					var tfListArrs = spot.tfList;
					console.log(spot.tfList[0]);
					console.log(spot.tfList);
	 				@>
					<@ _.each(tfListArrs, function(tfList){ @>	
					<a href="/tf/<@=tfList.no@>"><li class="trendy_menu menu1"><img src="/img/<@=tfList.img@>"/></li></a>
					<@ }) @>
                        </ul>
                    </div><!--//trendy_menu_wrap-->
                    <button class="menu_btn menu_prev fas fa-chevron-circle-left"></button>
                    <button class="menu_btn menu_next fas fa-chevron-circle-right"></button>
                </div><!--//spot_card_menu-->
                <div class="spot_card_info">
                    <ul>
                        <li><i class="fas fa-map-marker-alt"></i> <@=spot.address@><br/><@=spot.subAddress@></li>
                        <li><i class="far fa-clock"></i><@=timeInfo@></li>
                    </ul>
                </div><!--//spot_card_info-->
                <div class="spot_card_buket">
                    <button><i class="fas fa-shopping-basket cursor_pointer"></i></button>
                    <br/>
                </div><!--//spot_card_buket-->
                <div class="spot_card_spotter">
					<a href="/user/<@=spot.userNo@>">
                    <div class="spot_spotter_img"><img src="/profile/<@=spot.profileImg@>"/></div>
                    <div class="spot_spotter_name"><@=spot.nickname@></div>
                	</a>
				</div><!--//spot_card_spotter-->
				</a>
        	</li>
			<@})@>
		<@if(spots.length>3){@>
		<button class="spot more_btn">+more</button>
		<@}@>
</script>

	<script type="text/template" id="commentTmp">
		<@$.each(comments,function(){@>
        <li>
		<a href="/<@if(this.categoryNo==2){@>tf<@}else{@>cook<@}@>/<@=this.postNo@>">
            <div class="total_comment">
                <div class="user">
                    <div class="user_img"><img src="/img/<@=this.profileImg@>"/></div>
                    <div class="text_center"><@=this.nickname@></div>
                </div>
                <div class="comment_contents">	
                    <span><@=moment(this.regdate).format("YYYY년 MM월 DD일 H:mm:ss a")@></span>
                    <br/>
                    <span><@=this.content@></span>
                    <div class="comment_img"><img src="/img/<@=this.replyImg@>"/></div>
                </div>
                <div class="total_heart">
                    <button class="comment_heart_btn"><i class="fas fa-heart"></i></button>
 					<p><@=this.likeCnt@></p>
                </div>
            </div>
		</a>
        </li>
		<@});@>
		<@if(comments.length>4){@>
		<button class="comment more_btn">+more</button>
		<@}@>
</script>
	<!--commentTmp-->
	<script src="/js/underscore-min.js"></script>
	<script src="/js/jquery.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script>
		moment.locale("ko");
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};
		let page = 1;

		let followTmp = _.template($("#followTmp").html());
		let followingTmp = _.template($("#followingTmp").html());

		let $followingWrap = $("#followingWrap");
		let $followWrap = $("#followWrap");
		const $mypageFollow = $(".mypage_follow");
		const $mypageFollowing = $(".mypage_following");

		$("#mypageListSection").on("click", "#mypageList div", function() {
			$(".categoryList_on").removeClass("categoryList_on");
			$(this).addClass("categoryList_on");
		})//mypageList에 on 붙이기

		$("#mypageListSection").on("click", "#mypagePostList div", function() {
			$(".mypagelist_on").removeClass("mypagelist_on");
			$(this).addClass("mypagelist_on");
		})//mypageList에 on 붙이기

		function getFollowList() {
			$.ajax({
				url : "/ajax/${user.no}/follow/page/" + page,
				dataType : "json",
				type : "GET",
				error : function() {
					alert("서버 점검중!");
				},//error end
				success : function(json) {
					console.log(json.followers);
					console.log(json.followings);
					let follower = json.followers;
					let following = json.followings;
					$("#followingBox ul").append(followingTmp({
						"followings" : following
					}));
					$("#followBox ul").append(followTmp({
						"followers" : follower
					}));
				}//success end
			});//ajax() end
		}//getFollowerList end

		$("#followBox").on("click", ".follow_list_add", function() {
			$(".follow_list_add").remove();
			page++;
			getFollowList();
		}); //click() end	   

		$("body").on("click", ".mypage_following", function() {
			$(".following").remove();
			$(".following_list_add").remove();
			$("#followingBg").show();
			$("#followingWrap").show();
			getFollowList();
		});//following end

		$("#followingBox ul").on("click", ".following_list_add", function() {
			$(".following_list_add").remove();
			page++;
			getFollowList();
		}); //click() end		

		$("body").on("click", ".mypage_follow", function() {
			$(".follow").remove();
			$(".follow_list_add").remove();
			$("#followBg").show();
			$("#followWrap").show();
			getFollowList();
		});

		$(".fa-times").on("click", function() {
			$("#followBg").fadeOut();
			$("#followWrap").fadeOut();
			$("#followingBg").fadeOut();
			$("#followingWrap").fadeOut();
			page = 1;
		});
		$("#followBg,#followingBg").on("click", function() {
			$("#followBg").fadeOut();
			$("#followWrap").fadeOut();
			$("#followingBg").fadeOut();
			$("#followingWrap").fadeOut();
			page = 1;
		});

		/* profileImage */
		//input type = file
		var $profileImage = $("#upload");
		//프로필 사진
		var $profileImg = $("#mypageImg img");

		//프로필 사진 이름(input type hidden)
		var $uploadImage = $("#uploadImage");

		$profileImage.on("change", function() {
			//사이즈가 0인 즉 잘못된 파일 선택
			var file = this.files[0];

			if (file.size <= 0) {
				alert("파일을 제대로 선택해 주세요");
				$profileImage.val("");
				return;
			}
			if (!file.type.includes("image/")) {
				alert("이미지 파일을 제대로 선택해 주세요");
				$profileImage.val("");
				return;
			}
			/*
			file사이즈가 0이 아니고 이미지일때 파일 업로드를해야합니다.
			FormData API(HTML5) 필요함
			 */
			var data = new FormData();

			data.append("profileImg", file, file.name);
			$profileImage.val("");
			$.ajax({
				url : "/ajax/upload/${user.no}",
				dataType : "json",
				type : "POST",
				processData : false,
				contentType : false,
				data : data,
				error : function() {
					alert("서버 점검중!");
				},//error end
				success : function(data) {
					console.log(data.profileImg);
					$profileImg.attr("src", "/profile/" + data.profileImg);
					$uploadImage.val(data.profileImg);
				}//success end
			});//ajax() end
		});//change end
		/* profileImage */

		var fahTmp = _.template($("#fahTmp").html());

		$("#mypageList").on("click", "#mypageFah", function() {
			$("#listBox").empty();
			$(".more_btn").remove();
			page = 1;
			getFahList();
		});

		getFahList();

		function getFahList() {
			$.ajax({
				url : "/ajax/user/${user.no}/fah/page/" + page,
				dataType : "json",
				type : "GET",
				error : function() {
					alert("에러");
				},
				success : function(json) {
					console.log(json);
					$("#listBox").append(fahTmp({
						"fahs" : json
					}));
				}
			}); //ajax() end
		}//getFahList() end

		$("#mypagePostList").on("click", "#mypageWritePost", function() {
			$("#listBox").empty();
			$(".more_btn").remove();
			$("#mypageList").show();
			$(".categoryList_on").removeClass("categoryList_on");
			$("#mypageFah").addClass("categoryList_on");
			$("#mypageFah").show();
			$("#mypageTrendyFood").css("margin-left", 0);
			getFahList();
		});

		$("#mypageListContent").on("click", ".fah", function() {
			$(this).remove();
			page++;
			getFahList();
		}); //click() end

		function myTFList() {
			$.ajax({
				url : "/ajax/user/${user.no}/TF/page/" + page,
				dataType : "json",
				type : "get",
				error : function() {
					alert("에러");
				},//error end
				success : function(json) {
					$("#listBox").append(trendfoodTmp({
						"trendyfoods" : json
					}));
				}//success end
			});//ajax end
		}

		const $mypageTrendyFood = $("#mypageTrendyFood");
		var trendfoodTmp = _.template($("#trendfoodTmp").html());

		$("#mypageListSection").on("click", "#mypageTrendyFood", function() {
			$("#listBox").empty();
			$(".more_btn").remove();
			page = 1;
			if ($("#mypageBucketlist").hasClass("mypagelist_on")) {
				TFBucketList();
			} else {
				myTFList();
			}
		});//mypageBucketList end

		$("#mypageListContent").on("click", ".trend_Food", function() {
			$(this).remove();
			page++;
			myTFList();

		}); //click() end

		const $mypageCook = $("#mypageCook");
		var cookTmp = _.template($("#cookTmp").html());

		function cook() {
			$.ajax({
				url : "/ajax/user/${user.no}/cook/page/" + page,
				dataType : "json",
				type : "get",
				error : function() {
					alert("에러");
				},//error end
				success : function(json) {
					console.log(json);
					$("#listBox").append(cookTmp({
						"cooks" : json
					}));
				}//success end
			});//ajax end
		}

		$("#mypageListContent").on("click", ".cook", function() {
			$(this).remove();
			page++;
			cook();
		}); //click() end

		$("#mypageListSection").on("click", "#mypageCook", function() {
			$("#listBox").empty();
			$(".more_btn").remove();
			page = 1;
			if ($("#mypageBucketlist").hasClass("mypagelist_on")) {
				CookBucketList()
			} else {
				cook();
			}
		});

		const $mypageBucketlist = $("#mypageBucketlist");
		$("#mypagePostList").on("click", "#mypageBucketlist", function() {
			$("#listBox").empty();
			$(".more_btn").remove();
			page = 1;
			$("#mypageList").show();
			$(".categoryList_on").removeClass("categoryList_on");
			$("#mypageTrendyFood").addClass("categoryList_on");
			$("#mypageFah").hide();
			$("#mypageTrendyFood").css("margin-left", 350);
			TFBucketList();

		});//mypageBucketList end

		function TFBucketList() {
			$.ajax({
				url : "/ajax/user/${user.no}/TFBucket/page/" + page,
				dataType : "json",
				type : "GET",
				error : function() {
					alert("에러");
				},//error end
				success : function(json) {
					console.log(json);
					$("#listBox").append(trendfoodTmp({
						"trendyfoods" : json
					}));
				}//success end
			});//ajax end
		}

		$("#mypageListContent").on("click", ".trendy_food_bucketlist",
				function() {
					$(this).remove();
					page++;
					TFBucketList();
				}); //click() end

		function CookBucketList() {
			$.ajax({
				url : "/ajax/user/${user.no}/CookBucket/page/" + page,
				dataType : "json",
				type : "GET",
				error : function() {
					alert("에러");
				},//error end
				success : function(json) {
					console.log(json);
					$("#listBox").append(cookTmp({
						"cooks" : json
					}));
				}//success end
			});//ajax end
		}

		$("#mypageListContent").on("click", ".cook_bucketlist", function() {
			$(this).remove();
			page++;
			CookBucketList();
		}); //click() end

		const $mypageWriteComment = $("#mypageWriteComment");
		const commentTmp = _.template($("#commentTmp").html());

		$("#mypagePostList").on("click", "#mypageWriteComment", function() {
			$("#listBox").empty();
			$(".more_btn").remove();
			page = 1;
			$("#mypageList").css("display", "none");
			comment();
		});//mypageComment end
		let postNo = 1;
		function comment() {
			$.ajax({
				url : "/ajax/user/${user.no}/comment/page/" + page,
				dataType : "json",
				type : "GET",
				error : function() {
					alert("에러");
				},//error end
				success : function(json) {
					console.log(json);
					$("#listBox").append(commentTmp({
						"comments" : json
					}));
				}//success end
			});//ajax end
		}
		$("#mypageListContent").on("click", ".comment", function() {
			$(this).remove();
			page++;
			comment();
		}); //click() end

		const $mypageSpot = $("#mypageSpot");
		var spotTmp = _.template($("#spotTmp").html());

		$("#mypageListSection").on("click", "#mypageSpot", function() {
			page = 1;
			$("#listBox").empty();
			$(".more_btn").remove();

			if ($("#mypageBucketlist").hasClass("mypagelist_on")) {
				SpotBucketList();
			} else {
				spot();
			}
		});

		function spot() {
			$.ajax({
				url : "/ajax/user/${user.no}/spot/page/" + page,
				dataType : "json",
				type : "get",
				error : function() {
					alert("에러");
				},
				success : function(json) {
					console.log(json);
					$("#listBox").append(spotTmp({
						"spots" : json
					}));
				}
			});
		}
		function SpotBucketList() {
			$.ajax({
				url : "/ajax/user/${user.no}/spotBucket/page/" + page,
				dataType : "json",
				type : "get",
				error : function() {
					alert("에러");
				},//error end
				success : function(json) {
					console.log(json);
					$("#listBox").append(spotTmp({
						"spots" : json
					}));
				}//success end
			});//ajax end
		}

		$("#mypageListContent").on("click", ".spot", function() {
			$(this).remove();
			page++;
			spot();
		});

		$("#mypageListContent").on("click", ".spot_bucketlist", function() {
			$(this).remove();
			page++;
			SpotBucketList();
		}); //click() end

		const $intro_btn = $(".intro_btn");
		const $introduceContent = $("#introduceContent");
		const $introduce = $("#introduce");
		$intro_btn.on("click", function() {
			if ($introduceContent.hasClass("on")) {
				$introduceContent.removeClass("on").hide();
				getIntro();
			} else {
				$introduceContent.addClass("on").show();
			}
		});//intro_btn click end

		function getIntro() {
			let introduce = $introduceContent.val();
			console.log(introduce);
			$.ajax({
				url : "/ajax/user/${user.no}/intro/" + introduce,
				dataType : "json",
				type : "POST",
				error : function() {
					alert("에러");
				},//error end
				success : function(json) {
					console.log(json.message);
					$introduceContent.val(json.message);
					$introduce.text(json.message);
				}//success end
			});//ajax end	
		}

		$("body").on("click", ".follow_btn", function() {
			let $followBtn = $(this);
			let name = $followBtn.text().trim();
			let no = this.dataset.no;
			console.log(name);
			let type = "POST";
			if (name == "팔로잉") {
				type = "DELETE";
			}//if end

			console.log(type);
			$.ajax({
				url : "/ajax/follow/following/${loginUser.no}/follower/" + no,
				type : type,
				dataType : "json",
				error : function() {
					alert("에러");
				},
				success : function(json) {
					if (name != "팔로잉") {
						$followBtn.addClass("on");
						$followBtn.text("팔로잉");
					} else {
						$followBtn.removeClass("on");
						$followBtn.text("팔로우");
					}//if~else end
					$("#followBox ul").empty();
					$("#followingBox ul").empty();
					getFollowList();
				}//success end

			});
			return false;
		});
	</script>
</body>
</html>
