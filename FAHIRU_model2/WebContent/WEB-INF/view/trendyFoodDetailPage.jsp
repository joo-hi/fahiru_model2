<%@page import="com.fas.fahiru.dao.LikesDAOImpl"%>
<%@page import="com.fas.fahiru.vo.Like"%>
<%@page import="com.fas.fahiru.vo.User"%>
<%@page import="com.fas.fahiru.vo.Reply"%>
<%@page import="com.fas.fahiru.vo.PageVO"%>
<%@page import="com.fas.fahiru.dao.RepliesDAOImpl"%>
<%@page import="com.fas.fahiru.vo.Fah"%>
<%@page import="com.fas.fahiru.util.PaginateUtil"%>
<%@page import="com.fas.fahiru.dao.TrendyFoodsDAOImpl"%>
<%@page import="com.fas.fahiru.vo.TrendyFood"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trendy food!</title>
<c:import url="/WEB-INF/template/link.jsp"/>
<link rel="stylesheet" href="/css/trendyFoodDetailPage.css" />
<link rel="stylesheet" href="/css/paginate.css" />

<style>
.register_comment_img {
	position: absolute;
	float: left;
	right: 125px;
	top: 10px;
}
#tg {
	top:15px;
	right:60px;
}
#tb {
	left:90px;
	top:15px;
}
#pg {
	right:60px;
	bottom:10px;
}
#pb {
	bottom:7px;
	left:90px;
}
.evaluation{
	font-size:27px;
	position:absolute;
}
</style>


</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
	<div id="detailPage">
		<div id="trendyFoodInfo">
			<div id="trendyFoodName">${tf.name }</div>
			<div id="fahList">
				<c:forEach items="${fahs }" var="fah">
					<a href="/fah/${fah.no }"><div class="fah">${fah.name }</div></a>
				</c:forEach>
			</div>
			<!--fahList end-->

			<div id="trendyFoodMainImg">
				<img src="/img/${tf.img }" />
			</div>
			<div id="cameraInfo">
				<i class="fas fa-camera"></i>${tf.imgFilter }
			</div>
			<div class="spot_score">
				<div class="totalTaste">
					<i class="fas fa-thermometer-three-quarters"></i> <br />T
					${tf.taste }점
				</div>
				<div class="totalPlating">
					<i class="fas fa-temperature-high"></i> <br />P ${tf.plating }점
				</div>
			</div>
			<!--//spot_score-->
			<div id="bucket">
				<button>
					<i class="fas fa-shopping-basket cursor_pointer"></i><span
						id="likeCnt">${bucketCnt }</span>
				</button>
				<br />
			</div>
			<div id="share">
				<button>
					<i class="fas fa-share-alt cursor_pointer"></i>
				</button>
			</div>
			<a href="/user/${tf.userNo }">
				<div class="cursor_pointer user_profile">
					<div id="userImgID" class="user_img">
						<img src="/profile/${tf.profileImg }" />
					</div>
					<div id="userName" class="text_center">${tf.nickname }</div>
				</div>
				<!--//userProfile-->
			</a>

			<div id="trendyFoodInfoList">
				<div id="price">
					<i class="fas fa-won-sign"></i> ${tf.price }
				</div>
				<a href="/spot/${tf.spotNo }">
					<div id="shopName" class="cursor_pointer">
						<i class="fas fa-store-alt"></i> ${tf.shopName }
					</div>
				</a>
			</div>
			<!--//trendyFoodInfoList-->
			<div id="myEvaluation">
				<div id="myTaste">
					taste
	            	<div id="tb" data-taste="TB" class="evaluate taste far ${myTaste.code.equals('TB') ? 'fas' : 'far' } fa-thumbs-down cursor_pointer"></div>
	            	<div id="tg" data-taste="TG" class="evaluate taste far ${myTaste.code.equals('TG') ? 'fas' : 'far' } fa-thumbs-up cursor_pointer"></div>
				</div>
				<div id="myPlating">
					plating
	            	<div id="pb" data-taste="PB" class="evaluate plating far ${myPlating.code.equals('PB') ? 'fas' : 'far' } fa-thumbs-down cursor_pointer"></div>
	            	<div id="pg" data-taste="PG" class="evaluate plating far ${myPlating.code.equals('PG') ? 'fas' : 'far' } fa-thumbs-up cursor_pointer"></div>
				</div>
			</div>
			<!--//myEvaluation-->
		</div>
		<!--trendyFoodInfo-->
		<div id="commentImg">
			<h2 style="font-weight: bold">댓글 사진</h2>
			<div id="commentImgBox" class="cursor_pointer">
				<div id="moveBox">
					<ul>
					</ul>
				</div>
			</div>
			<!--//commentImgBox-->
			<button class="fas fa-angle-double-up imgPrevBtn prev"></button>
			<button class="fas fa-angle-double-down imgNextBtn next"></button>
		</div>
		<!--//commentImg-->
		<div id="warningSection">
			<button class="fas fa-exclamation-triangle warning_btn">
				신고하기</button>
		</div>
		<c:if test="${loginUser!=null }">
		<div id="comment">
			<div id="replyRegister">
				<form id="reply" method="post">
					<input type="hidden" name="userNo" value="${loginUser.no }" />
					<input type="hidden" name="postNo" value="${tf.no }" />
					<input type="hidden" name="categoryNo" value="2" />
					<input id="uploadReplyImg" type="hidden" name="replyImg" />
					<filedset>
						<textarea id="content" name="content" placeholder="댓글을 입력해주세요."></textarea>
						<div class="register_comment_img">
							<img id="replyImgPlace" class="no_image" src="/replyImg/a.jpg" />
							<label>
								<i class="fas fa-camera img_icon"></i>
								<input id="tfReplyImg" type="file" />
							</label>
						</div>
					<button id="commentAddBtn">등록</button>
					</filedset>
				</form>
			</div>
			
			<!-- replyRegister -->
			<div id="firstComment" class="font_position">
				<div id="myCommentHeader">내 댓글</div>
				<ul id="myComment">
				<%--
		<c:if test="${myReplies !=null }">
				<c:forEach items="${myReplies }" var="myReply">
					<li>
						<div class="user">
							<div id="userCommentProfile1" class="user_img">
								<img src="/profile/${myReply.profileImg }" />
							</div>
							<div id="userCommentName1" class="text_center">${myReply.nickname }</div>
						</div>
						<div class="comment_contents">
							<div class="comment_date">${myReply.regdate }</div>
							<br/><span>${myReply.content }</span>
							<div class="comment_img">
								<img src="../replyImg/${myReply.replyImg }" />
							</div>
						</div>
						<button class="comment_myHeart_btn"><i class="full_heart fas fa-heart"></i></button>
						<strong class="reply_strong"><span class="myLikeReplyCnt"></span></strong>
						<a href="/deleteReply.do?no=&postNo=" class="delete_btn">삭제</a>
					</li>
					</c:forEach>
			</c:if>
			 --%>
				</ul>
			</div>
		</div>
		</c:if>
		<div id="trendyFoodCommentAll" class="font_position">
			<div id="commentAllHeader" class="font_position">전체 댓글</div>
			<ul>
			<%--
			<c:if test="${!replies.isEmpty() }">
			<c:forEach items="${replies }" var="reply">
				<li>
					<div class="user">
						<div id="userCommentProfile1" class="user_img">
							<img src="/profile/${reply.profileImg }" />
						</div>
						<div id="userCommentName1" class="text_center">${reply.nickname }</div>
					</div>
					<div class="comment_contents">
						<div class="comment_date">${reply.regdate }</div>
						<br /> <span>${reply.content }</span>
						<div class="comment_img">
							<img src="/replyImg/${reply.replyImg }" />
						</div>
					</div>
					<c:choose>
					<c:when test="${reply.likeFlag==true }">
					<button class="comment_heart_btn heart${reply.no } empty_heart fas fa-heart" data-no="${reply.no }"></button>
					</c:when>
					<c:otherwise>
                    <button class="comment_heart_btn heart${reply.no } empty_heart far fa-heart" data-no="${reply.no }"></button>
					</c:otherwise>
                    </c:choose>
				</br>
				</br>
				<strong class="joo_strong"><span class="likeReplyCnt${reply.no }">${reply.likeCnt }</span></strong>
				</li>
				</c:forEach>
				</c:if>
				 --%>
			</ul>
		</div>
		<!--//detailPage-->
		<button href="/fahDetailPage.jsp"
			class="far fa-window-close close cursor_pointer"></button>
			
	</div>
	<c:import url="/WEB-INF/template/footer.jsp"/>
<script type="text/template" id="warringTmp">
    <div id="warningWrap">
        <h1>신고하기</h1>
        <div id="writerAndContents">
            <div>작성자: 김필구</div>
            <div>내용: foodrendy에 대하여</div>
        </div>
        <ul id="warningReason">
            <li>
                <label for="eroticReason">
                    <!-- eroticReason  inappropriateReason
                    personalInfoReason    advertismentReason   anotherReason      //-->
                    <input id="eroticReason" type="radio" name="reason" checked>
                    음란 또는 청소년에게 부적합한 내용
                </label>
            </li>
            <li>
                <label for="inappropriateReason">
                    <input id="inappropriateReason" type="radio" name="reason">
                    부적절한 내용
                </label>
            <li>
                <label for="personalInfoReason">
                    <input id="personalInfoReason" type="radio" name="reason" >
                    개인정보 노출
                </label>
            </li>
            <li>
                <label for="anotherReason">
                    <input id="anotherReason" type="radio" name="reason">
                    광고성 글
                </label>
            </li>
            <li>
                <label>
                    <input type="radio" name="reason"> 기타
                    <input id="anoterReason" name="anoterReason">
                </label>
            </li>
        </ul>
        <button class="btn close_btn">취소</button>
        <button class="btn popUp_warning_btn">신고하기</button>
    </div> <!--//warningWrap end-->
</script>


<script type="text/template" id="commentImgTmp">

	<@_.each(images, function(image){ @>
	    <li class="box"><img src="/replyImg/<@=image.replyImg@>"/></li>
	<@})@>

</script>

<script type="text/template" id="allRepliesTmp">
<@ _.each(replies,function(reply){@>
	<li>
		<div class="user">
		<div id="userCommentProfile1" class="user_img">
			<img src="/profile/<@=reply.profileImg@>" />
			</div>
			<div id="userCommentName1" class="text_center"><@=reply.nickname@></div>
		</div>
		<div class="comment_contents">
			<div class="time comment_date"><@=reply.regdate@></div>
			<br /> <span><@=reply.content@></span>
			<div class="comment_img">
				<img src="/replyImg/<@=reply.replyImg@>" />
			</div>
		</div>
		<@ if(reply.likeFlag==true){@>
		<button class="comment_heart_btn heart<@=reply.no@> empty_heart fas fa-heart" data-no="<@=reply.no@>"></button>
		<@}else{@>
        <button class="comment_heart_btn heart<@=reply.no@> empty_heart far fa-heart" data-no="<@=reply.no@>"></button>
		<@}@>
		</br></br>
		<strong class="reply_strong joo_strong"><span class="likeReplyCnt<@=reply.no@>"><@=reply.likeCnt@></span></strong>
	</li>
<@})@>
<@=paginate@>
</script>

<script type="text/template" id="myRepliesTmp">
<@ _.each(myReplies,function(myReply){@>
	<li>
		<div class="user">
			<div id="userCommentProfile1" class="user_img">
				<img src="/profile/<@=myReply.profileImg@>" />
			</div>
			<div id="userCommentName1" class="text_center"><@=myReply.nickname@></div>
		</div>
		<div class="comment_contents">
			<div class="time comment_date"><@=moment(myReply.regdate)@></div>
			<br/><span><@=myReply.content@></span>
			<div class="comment_img">
				<img src="/replyImg/<@=myReply.replyImg@>" />
			</div>
		</div>
		<button class="comment_myHeart_btn"><i class="full_heart fas fa-heart"></i></button>
		<strong class="reply_strong"><span class="myLikeReplyCnt"></span></strong>
		<button data-replyNo=<@=myReply.no@> class="delete_btn">삭제</button>
		<form id="replyDelete" method="post">
			<input type="hidden" name="no" class="replyNo"/>
			<input type="hidden" name="_method" value="DELETE"/>
		</form>
	</li>
<@})@>
</script>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script>

_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

	var warningTmp = _.template($("#warringTmp").html());

	let totalImgCnt = 0;
	
	const $allCommentList = $("#trendyFoodCommentAll ul");
	const $myComment = $("#myComment");
	
	const $imgPrevBtn = $(".imgPrevBtn");
	const $imgNextBtn = $(".imgNextBtn");

	var $this = $(this);

	let boxMove = 0;

	const commentImgTmp = _.template($("#commentImgTmp").html());
	const allRepliesTmp = _.template($("#allRepliesTmp").html());
	const myRepliesTmp = _.template($("#myRepliesTmp").html());
	
	const $commentImgBoxUl = $("#commentImgBox ul");

	if (boxMove == 0) {
		$imgPrevBtn.attr("disabled", true);
	} //boxMove가 0이면 이전으로 버튼 비활성화

	$imgPrevBtn.on("click", function() {
		boxMove += 215;

		if (boxMove == 0) {
			$imgPrevBtn.attr("disabled", true);
		} //boxMove가 0이면 이전으로 버튼 비활성화
		
		$imgNextBtn.attr("disabled", false); 

		$("#moveBox").css("top", boxMove).css("transition", "ease .3s");

	})

	$("#moveBox li").on("click", function() {

		$("#trendyFoodMainImg img").text();
	});

	$("#moveBox li img").on("click", function() {

		// alert("z");

		var imgTxt = $(this).attr("src");

		$("#trendyFoodMainImg img").attr("src", imgTxt);
	});

	$commentImgBoxUl.on("click", ".box img", function() {

		var tmpImgTxt = $(this).attr("src");

		$("#trendyFoodMainImg img").attr("src", tmpImgTxt);
	})

	$(".warning_btn").click(function() {

		$("#warningSection").append(warningTmp);

	})

	$("#warningSection").on("click", ".close_btn", function() {
		$(this).parent().remove();
	})

	// $(".empty_heart").on("click",function () {
	//     $(this).attr("class","full_heart fas fa-heart").css("color","#FFAB91");
	// });
	//
	// $(".full_heart").on("click",function () {
	//     $(this).attr("class","empty_heart far fa-heart").css("color","#FFAB91");
	// })

	//     $(".total_heart").on("click",".empty_heart",function () {
	//     	alert("zz");
	//         $(this).attr("class","full_heart fas fa-heart").css("color","#FFAB91");

	//     })
	//     $(".total_heart").on("click",".full_heart",function () {
	//         $(this).attr("class","empty_heart far fa-heart").css("color","#FFAB91");

	//     })


	///////////////// 댓글 사진 업로드 /////////////////

	// input type = file
	var $tfReplyImg = $("#tfReplyImg");

	// 프로필 사진 이름(input type hidden) 세팅 위해 필요한 id
	var $uploadReplyImg = $("#uploadReplyImg");

	// 사진이 들어가는 공간 img
	var $replyImgPlace = $("#replyImgPlace");

// 	$tfReplyImg.on("change", function() {

// 		console.log(this);
// 		console.log(this.files);
// 		console.log(this.files[0]);
// 		//사이즈가 0인 즉 잘못된 파일 선택
// 		var file = this.files[0];

// 		if (file.size <= 0) {
// 			alert("파일을 제대로 선택해 주세요");
// 			$tfReplyImg.val("");
// 			return;
// 		}
// 		if (!file.type.includes("image/")) {
// 			alert("이미지 파일을 제대로 선택해 주세요");
// 			$tfReplyImg.val("");
// 			return;
// 		}
// 		/*
// 		file사이즈가 0이 아니고 이미지일때 파일 업로드를해야합니다.
// 		FormData API(HTML5) 필요함
// 		 */
// 		var form = new FormData();

// 		form.append("replyImg", file, file.name);

// 		console.log(form);
// 		console.log(form.replyImg);

// 		//  	$tfReplyImg.val("");
// 		$.ajax({
// 			url : "/ajax/ReplyImgUpload.json",
// 			dataType : "json",
// 			type : "post",
// 			processData : false,
// 			contentType : false,
// 			data : form,
// 			error : function() {
// 				alert("서버 점검중!");
// 			},//error end
// 			success : function(json) {
// 				$replyImgPlace.attr("src", "/replyImg/" + json.src).css(
// 						"display", "block");
// 				$uploadReplyImg.val(json.src);
// 				console.log(json.src);
// 			}//success end
// 		});//ajax() end
// 	});//change end
	/* profileImage */
		

	
	
	
	
	
// 	const $replyImgPlace = $("#replyImgPlace");
// 	const $uploadReplyImg = $("#uploadReplyImg");
	
	$tfReplyImg.on("change",function(){
		//사이즈가 0인 즉 잘못된 파일 선택
		var file = this.files[0];
		
		if(file.size<=0){
			alert("파일을 제대로 선택해 주세요");
			$imgBox.val("");
			return;
		}
		if(!file.type.includes("image/")){
			alert("이미지 파일을 제대로 선택해 주세요");
			$imgBox.val("");
			return;
		}
		/*
		file사이즈가 0이 아니고 이미지일때 파일 업로드를해야합니다.
		FormData API(HTML5) 필요함
		*/
		var data = new FormData();
		
		//Spot의 타입 S로
		data.append("type","R");
		
		data.append("uploadImg",file,file.name);
		
		$.ajax({
			url:"/ajax/uploadImg",
			dataType:"json",
			type:"post",
			processData:false,
			contentType:false,
			data:data,
			error:function(){
				alert("서버 점검중!");
			},
			success:function(data){
				$replyImgPlace.attr("src","/replyImg/"+data.src);
				$uploadReplyImg.val(data.src);
				$replyImgPlace.removeClass("no_image").css("display");
				$(".img_icon").css("display", "none");
			}//success end
		});//ajax() end
	});//$tfReplyImg.change() end
	
	$reply = $("#reply");
	
	$reply.on("submit", function(e){
		
		e.preventDefault();
		
		let replyFormData = $reply.serialize();
		
		$.ajax({
			url:"/ajax/reply",
			type:"post",
			data:replyFormData,
			error:function(){
				alert("서버 점검중!");
			},
			success:function(json){
				if(json){
					$("#content").val("");
					$replyImgPlace.addClass("no_image");
					getRepliesList();
					setTimeout(function timeChange(){
						
						$(".time").each(function() {
							
							let rTime = $(this).text(); // 댓글들 각 시간구하기
							
							let urTime = rTime.substring(0,10);
							
							let raDate = moment.unix(urTime).format("YYYY-MM-DD HH:mm:ss"); // 댓글시간 모멘트화 하기
							
							let cTime = ""; // 바뀔 시간

							let nowDate = moment(); // 현재시간

							let diffHours = nowDate.diff(raDate, "hours"); // 지금으로부터 시간
							let diffMinutes = nowDate.diff(raDate, "minutes"); // 지금으로부터 분
							let diffSeconds = nowDate.diff(raDate, "Seconds"); // 지금으로부터 초

							if (diffHours > 24) {

								cTime = raDate;
								console.log(cTime);

							} else if (diffHours > 0) {

								cTime = diffHours + "시간전";

							} else if (diffMinutes > 0) {

								cTime = diffMinutes + "분 전";

							} else if (diffSeconds >= 0) {

								cTime = "방금 전";

							}
							
							$(this).text(cTime);
						});
							
							
						},100);
				}else{
					alert("댓글 작성에 실패하였습니다.");
					$("#content").val("");
					$replyImgPlace.addClass("no_image");
				}
			}//success() end
		})// ajax() end
	})//reply submit() end
	
	let page = 1;
	
	function getRepliesList(){
		
		$.ajax({
			url:"/ajax/reply/${tf.no}/page/"+page,
			type:"get",
			error:function(){
				alert("서버 점검중!");
			},
			success:function(json){
		   			$allCommentList.html(allRepliesTmp({"replies":json.replies, "paginate":json.paginate}));
		   			console.log(json.replies);
		   			console.log(json.myReplies);
		   		console.log(json.myReplies==null);
		   		if(json.myReplies!=null){
		   			$myComment.html(myRepliesTmp({"myReplies":json.myReplies}));
		   		}
				console.log(json);
			}//success() end
		})// ajax() end
		
	}// getRepliesList() end
	
	getRepliesList();
	
	$allCommentList.on("click",".paginate a",function(e) {
		e.preventDefault();
		
		//클릭한 페이지번호
		page = this.dataset.no;
		getRepliesList();
		setTimeout(function timeChange(){
			
			$(".time").each(function() {
				
				let rTime = $(this).text(); // 댓글들 각 시간구하기
				
				let urTime = rTime.substring(0,10);
				
				let raDate = moment.unix(urTime).format("YYYY-MM-DD HH:mm:ss"); // 댓글시간 모멘트화 하기
				
				let cTime = ""; // 바뀔 시간

				let nowDate = moment(); // 현재시간

				let diffHours = nowDate.diff(raDate, "hours"); // 지금으로부터 시간
				let diffMinutes = nowDate.diff(raDate, "minutes"); // 지금으로부터 분
				let diffSeconds = nowDate.diff(raDate, "Seconds"); // 지금으로부터 초

				if (diffHours > 24) {

					cTime = raDate;
					console.log(cTime);

				} else if (diffHours > 0) {

					cTime = diffHours + "시간전";

				} else if (diffMinutes > 0) {

					cTime = diffMinutes + "분 전";

				} else if (diffSeconds >= 0) {

					cTime = "방금 전";

				}
				
				$(this).text(cTime);
			});
				
				
			},100);
	});
	
	$myComment.on("click", ".delete_btn", function(e){
		e.preventDefault();
		
		let replyNo = this.dataset.replyno;
		
		$.ajax({
			url:"/ajax/reply/"+replyNo,
			type:"DELETE",
			error:function(){
				alert("서버 점검중!");
			},
			success:function(json){
				if(json) {
					getRepliesList();
					setTimeout(function timeChange(){
						
						$(".time").each(function() {
							
							let rTime = $(this).text(); // 댓글들 각 시간구하기
							
							let urTime = rTime.substring(0,10);
							
							let raDate = moment.unix(urTime).format("YYYY-MM-DD HH:mm:ss"); // 댓글시간 모멘트화 하기
							
							let cTime = ""; // 바뀔 시간

							let nowDate = moment(); // 현재시간

							let diffHours = nowDate.diff(raDate, "hours"); // 지금으로부터 시간
							let diffMinutes = nowDate.diff(raDate, "minutes"); // 지금으로부터 분
							let diffSeconds = nowDate.diff(raDate, "Seconds"); // 지금으로부터 초

							if (diffHours > 24) {

								cTime = raDate;
								console.log(cTime);

							} else if (diffHours > 0) {

								cTime = diffHours + "시간전";

							} else if (diffMinutes > 0) {

								cTime = diffMinutes + "분 전";

							} else if (diffSeconds >= 0) {

								cTime = "방금 전";

							}
							
							$(this).text(cTime);
						});
							
							
						},100);
					
				}else {
					alert("삭제되지 않았습니다.");
				}
			}//success() end
		})// ajax() end
	})//.delete_btn click() end
	

	$imgNextBtn.on("click", function() {

		boxMove -= 215;

		$imgPrevBtn.attr("disabled", false); // Next버튼 누르면 Prev버튼 disabled 해제

		$("#moveBox").css("top", boxMove).css("transition", "ease .3s");
		
		replyPageNo++;
		
		replyImg();
		
		console.log(boxMove);
		
		if(boxMove == -215*(totalImgCnt-1)){
			$imgNextBtn.attr("disabled", true);
		}
		console.log(totalImgCnt);
		console.log(-((215)*(totalImgCnt-1)));

	});//imgNextBtn click() end
	
	let replyPageNo = 1;
	
	
	
	function replyImg(){
		$.ajax({
    		url:"/ajax/replyImg/${tf.no}",
    		dataType:"json",
    		type:"GET",
    		data:{pageNo : replyPageNo},
    		error: function() {
				alert("서버 점검중!");
			},
    		success: function(json) {
    			$commentImgBoxUl.append(commentImgTmp({"images":json.repliesImg,
    												   "repliesImgCnt":json.repliesImgCnt}));
    			
    			totalImgCnt = Math.ceil(json.repliesImgCnt/4);
    			
    			if(4 >= json.repliesImgCnt){
    				$imgNextBtn.attr("disabled", true); 
    			};
			}//success() end
		})//ajax() end
	}
	replyImg();
	
<c:if test="${loginUser !=null }">

//////////////////////////점수점수 /////////////////////////////

$("#myTaste .taste").click(function() {
	//console.log(this);
	var taste = this.dataset.taste;
	
	// alert(taste);
	
	$.ajax({
		url:"/ajax/taste",
		dataType:"json",
		type:"POST",
		data:{"userNo":"${loginUser.no}","postNo":"${tf.no}", "categoryNo":2,"code":taste},
		error: function() {
			alert("서버 점검중!");
		},
		success: function(json) {
			console.log(json);
			console.log(json.tgFlag);
			console.log(json.tbFlag);
			
// 	   		if(finalCheck==null){
// 	   			finalTG = "false";
// 	   			finalTB = "false"; 			   			
// 	   		}else if(finalCheck.getCode().equals("TG")) {
// 	   			finalTG = "true";
// 	   			finalTB = "false";
// 	   		}else if(finalCheck.getCode().equals("TB")) {
// 	   			finalTG = "false";
// 	   			finalTB = "true";  			
// 	   		}
			
// 			out.print("{\"tgFlag\":"+finalTG+",\"tbFlag\":"+finalTB+"}");
        	
     
			if((json.tbFlag==false) && (json.tgFlag==false)){
				$("#tb").attr("class","evaluate taste far fa-thumbs-down cursor_pointer");
				$("#tg").attr("class","evaluate taste far fa-thumbs-up cursor_pointer");
			} 
			else if((json.tbFlag==true) && (json.tgFlag==false)){
				$("#tb").attr("class","evaluate taste fas fa-thumbs-down cursor_pointer");
				$("#tg").attr("class","evaluate taste far fa-thumbs-up cursor_pointer");
			}
			else if((json.tbFlag==false) && (json.tgFlag==true))
			{
				$("#tb").attr("class","evaluate taste far fa-thumbs-down cursor_pointer");
				$("#tg").attr("class","evaluate taste fas fa-thumbs-up cursor_pointer");
			} //if else end 
			
		}
	});
});

$("#myPlating .plating").click(function() {
		
	//console.log(this);
	var taste = this.dataset.taste;
	
	// alert(taste);
	
	$.ajax({
		url:"/ajax/plating",
		dataType:"json",
		type:"POST",
		data:{"userNo":"${loginUser.no}","postNo":"${tf.no}", "categoryNo":2,"code":taste},
		error: function() {
			alert("서버 점검중!");
		},
		success: function(json) {
			console.log(json);
			console.log(json.pgFlag);
			console.log(json.pbFlag);
			
// 	   		if(finalCheck==null){
// 	   			finalTG = "false";
// 	   			finalTB = "false"; 			   			
// 	   		}else if(finalCheck.getCode().equals("TG")) {
// 	   			finalTG = "true";
// 	   			finalTB = "false";
// 	   		}else if(finalCheck.getCode().equals("TB")) {
// 	   			finalTG = "false";
// 	   			finalTB = "true";  			
// 	   		}
			
// 			out.print("{\"tgFlag\":"+finalTG+",\"tbFlag\":"+finalTB+"}");
        	
     
			if((json.pbFlag==false) && (json.pgFlag==false)){
				$("#pb").attr("class","evaluate plating far fa-thumbs-down cursor_pointer");
				$("#pg").attr("class","evaluate plating far fa-thumbs-up cursor_pointer");
			} 
			else if((json.pbFlag==true) && (json.pgFlag==false)){
				$("#pb").attr("class","evaluate plating fas fa-thumbs-down cursor_pointer");
				$("#pg").attr("class","evaluate plating far fa-thumbs-up cursor_pointer");
			}
			else if((json.pbFlag==false) && (json.pgFlag==true))
			{
				$("#pb").attr("class","evaluate plating far fa-thumbs-down cursor_pointer");
				$("#pg").attr("class","evaluate plating fas fa-thumbs-up cursor_pointer");
			} //if else end 
			
		}//success() end
	});//ajax() end
})//plating click() end


///////////////// 버킷버킷버버킷 0621 수정/////////////////

$("#bucket").on("click", function() {
	$.ajax({

		url : "/ajax/bucket",
		dataType : "json",
		type : "get",
		data : {
			"postNo" : "${tf.no}",
			"userNo" : "${loginUser.no}",
			"categoryNo" : 2
		},
		error : function() {
			alert("서버 점검중!");
		},
		success : function(json) {
			console.log(json);
			console.log($("#likeCnt"));
			$("#likeCnt").text(json.count);
		}
	}) // ajax end
});//bucket click() end



////////////////////// 좋아요 /////////////////////////////

$allCommentList.on("click",".comment_heart_btn",function() {
	
	let replyNo = this.dataset.no;
	
	console.log(replyNo);

	$.ajax({
		url : "/ajax/replyLike",
		dataType : "json",
		type : "POST",
		data : {
			"postNo" : "${tf.no}",
			"userNo" : "${loginUser.no}",
			"categoryNo" : 2,
			"replyNo" : replyNo
		},
		error : function() {
			alert("서버 점검중!");
		},
		success : function(json) {
			console.log(json);

			if(json.flag) {
				$(".heart"+replyNo).attr("class","comment_heart_btn empty_heart fas fa-heart heart"+replyNo);
			}else {
				$(".heart"+replyNo).attr("class","comment_heart_btn empty_heart far fa-heart heart"+replyNo);
			}//if else end
			
			$(".likeReplyCnt"+replyNo).text(json.count);
		}
	})
});


</c:if>


setTimeout(function timeChange(){
	
$(".time").each(function() {
	
	let rTime = $(this).text(); // 댓글들 각 시간구하기
	
	let urTime = rTime.substring(0,10);
	
	let raDate = moment.unix(urTime).format("YYYY-MM-DD HH:mm:ss"); // 댓글시간 모멘트화 하기
	
	let cTime = ""; // 바뀔 시간

	let nowDate = moment(); // 현재시간

	let diffHours = nowDate.diff(raDate, "hours"); // 지금으로부터 시간
	let diffMinutes = nowDate.diff(raDate, "minutes"); // 지금으로부터 분
	let diffSeconds = nowDate.diff(raDate, "Seconds"); // 지금으로부터 초

	if (diffHours > 24) {

		cTime = raDate;
		console.log(cTime);

	} else if (diffHours > 0) {

		cTime = diffHours + "시간전";

	} else if (diffMinutes > 0) {

		cTime = diffMinutes + "분 전";

	} else if (diffSeconds >= 0) {

		cTime = "방금 전";

	}
	
	$(this).text(cTime);
});
	
	
},100);
	</script>

</body>
</html>