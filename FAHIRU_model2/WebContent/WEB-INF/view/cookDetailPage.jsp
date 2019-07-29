<%@page import="com.fas.fahiru.dao.RepliesDAO"%>
<%@page import="com.fas.fahiru.vo.Reply"%>
<%@page import="com.fas.fahiru.vo.User"%>
<%@page import="com.fas.fahiru.dao.SourcesDAO"%>
<%@page import="com.fas.fahiru.vo.Source"%>
<%@page import="com.fas.fahiru.dao.IngredientsDAO"%>
<%@page import="com.fas.fahiru.vo.Ingredient"%>
<%@page import="com.fas.fahiru.dao.LikesDAO"%>
<%@page import="com.fas.fahiru.vo.Like"%>
<%@page import="java.util.List"%>
<%@page import="com.fas.fahiru.dao.FahsDAO"%>
<%@page import="com.fas.fahiru.vo.Fah"%>
<%@page import="com.fas.fahiru.dao.CooksDAO"%>
<%@page import="com.fas.fahiru.vo.Cook"%>
<%@page import="com.fas.fahiru.util.PaginateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cook!</title>
<c:import url="/WEB-INF/template/link.jsp"/>
<link rel="stylesheet" href="/css/cookDetailPage.css" />
<link rel="stylesheet" href="/css/paginate.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

 
<style>


</style>

</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>

<div id="bg"></div>
<div id="detailPage">
    <div id="cookInfo">
        <h3 id="cookName"> ${cook.name}</h3>
        <div id="fahList">
            <c:forEach items="${fahs}" var="fah">
				<a href="/fah/no/${fah.no}"><div class="fah_color"> ${fah.name}&deg;F</div></a>
            </c:forEach>
        </div> 
        <div id="cookMainImg"><img src="/cookImg/${cook.img}"></div><!--//cookMainImg-->
			<div class="spot_score">
				<div class="totalTaste">
					<i class="fas fa-thermometer-three-quarters"></i> <br /> <div id="tScore">T </div>
				</div>
				<div class="totalPlating">
					<i class="fas fa-temperature-high"></i> <br /> <div id="pScore">P </div>
				</div>
			</div>
			<!--//spot_score-->
        <div id="cameraInfo"><i class="fas fa-camera"></i> ${cook.imgFilter}</div>
        <div id="bucket">
            <button><i class="fas fa-shopping-basket cursor_pointer"></i><span id="likeCnt">${like}</span></button>
        </div>
        <div id="share">
            <button><i class="fas fa-share-alt cursor_pointer"></i></button>
        </div>
        <div id="userProfile" class="cursor_pointer">
        <a href="/user/${cook.userNo}">
            <div id="userImg"><img src="/profile/${cook.profileImg}"/></div>
            <div id="userName">${cook.nickname}</div>
        </a>
        </div><!--//userProfile-->

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
    </div><!--//cookInfo-->
    <div id="cookSubInfo">
        <div id="amountAndTime" style="font-weight : bold">요리정보
            <div id="amount">1) 양 : ${cook.cookAmount} 인분</div>
            <div id="Time">2) 소요시간 : <c:if test="${cook.cookTime == 'A '}"> 5분 이내 </c:if>
            						<c:if test="${cook.cookTime == 'B '}"> 10분 이내 </c:if>
            						<c:if test="${cook.cookTime == 'C '}"> 30분 이내 </c:if>
            						<c:if test="${cook.cookTime == 'D '}"> 1시간 이내 </c:if>
            						<c:if test="${cook.cookTime == 'E '}"> 1시간 이상 </c:if>									
				</div>
        </div>
        <div id="ingredientsDetail" style="font-weight : bold">재료
            <ul> 
            <c:forEach items="${ingredients}" var="ingredient">
            	<li><strong>ㆍ ${ingredient.name}</strong> ${ingredient.unit}</li>
            </c:forEach>
            </ul>
        </div>
        <div id="sourceDetail" style="font-weight : bold">양념
            <c:forEach items="${sources}" var="source">
            	<c:choose>
            		<c:when test="${source.name != null}">
            			<li>ㆍ ${source.name} ${source.ammount} ${source.unit}</li>
            		</c:when>
            		<c:otherwise>
            			<li>없 음</li>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
        </div>
    </div><!--//cookSubInfo-->
    <div id="commentImg">
        댓글 사진
        <div id="commentImgBox">
            <div id="moveBox">
            <ul>
            </ul>
            </div>
        </div><!--//imgBox-->
        <button class="fas fa-angle-double-up imgPrevBtn prev"></button>
        <button class="fas fa-angle-double-down imgNextBtn next"></button>
    </div><!--//commentImg-->
    
    <div id="cookOrder">
    요리 순서
        <c:forEach items="${steps}" var="step">
        <div class="order_step">Step ${step.cookOrder} 
            <div class="order_txt">
                ${step.cookStepTxt}
                <div class="order_img"><img src="/cookStep/${step.cookStepImg}"/></div>
            </div><!--//orderTxt-->
            <div class="honey_tip" data-cookorder ="${step.cookOrder}">
                <ul>
                <c:forEach items="${cookTips}" var="cookTip">
                <c:if test="${step.cookOrder == cookTip.stepNo}">
                    <li>	
                        <div class="honey_tip_user"><img src="/profile/${cookTip.profileImg}"/><strong
                                class="honey_tip_user_name">${cookTip.nickname}</strong></div>
                        <div class="honey_tip_content">${cookTip.content}</div>
<!--                         여기 -->
						<button class="honey_tip_like fas fa-lightbulb" data-cooktipno="${cookTip.no}" data-stepcookorder ="${step.cookOrder}"></button><span class="cook_tip_cnt">0</span>
                        <c:if test="${loginUser.no == cookTip.userNo}">
	                        <form method="POST" action="/cookTip/${cookTip.no}">
	                        <input type="hidden" name="_method" value="DELETE"/>
	                        <button class="honey_tip_delete_btn honeyTip_delete">삭제</button>
	                        </form>
                        </c:if>
                    </li>
                 </c:if>  
                 </c:forEach>  
                </ul>
                
                <button class="honey_tip_add_btn" data-stepno="${step.cookOrder}"> <i class=" xi-hunie"></i> 꿀팁 추가하기!</button>
            </div><!--//honeyTip-->
        </div><!--//orderStep-->
        </c:forEach>
        
        <button class="fas fa-exclamation-triangle warning_btn"> 신고하기</button>

    </div><!--//cookOrder-->
    
   	<c:if test="${loginUser!=null }">
    <div id="comment">
    		
            <div id = "replyRegister">
                  
				<form id="reply" method="post">
              		<input type="hidden" name="userNo" value="${loginUser.no}"/>
	               <input type="hidden" name="postNo" value="${cook.no}"/>
	               <input type="hidden" name="categoryNo" value="3" />
	               <input id="uploadReplyImgHidden" type="hidden" name="replyImg" value=""/>
              		<filedset>
	               
	               <textarea id="content" name="content" placeholder="댓글을 입력해주세요."></textarea>
	               
	                   <label>
	                  	   <div class="register_comment_img"><img id="replyImgPlace" src=""/></div>
	                       <i style="line-height: 155px" class="fas fa-camera"></i>
	                       <input id="cookReplyImgFile" class=" cursor_pointer" type="file"/>
	                   </label>
	               <button id="commentAddBtn" >등록</button>
	               
	               </filedset>
                </form>  					
           	</div>
    </div>
    
    <div id="firstComment">
               	<div id="myCommentHeader">내 댓글</div>
                <ul id="myComment">


                </ul>
        </div>
        </c:if>

		<div id="cookCommentAll" class="font_position">
			<div id="commentAllHeader" class="font_position">전체 댓글</div>
			<ul>
			
			</ul>
		</div>
			
    <button href="" class="far fa-window-close close cursor_pointer"></button>


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

<script type="text/template" id="honeyTipInsertTmp">
<li>
    <form class="honey_tip_form" action="/honeyTip">
	<input type="hidden" name="cookNo" value="${cook.no}"/>
	<input type="hidden" name="userNo" value="${loginUser.no}"/>
	<input type="hidden" class="honey_step_no" name="stepNo" value=""/>
        <fieldset>
            <textarea id="content" name="content" placeholder="나만의 꿀팁을 작성해보세요!"></textarea>
            <button type="button" class="honey_tip_btn honey_tip_insert">등록</button>
        </fieldset>
    </form>
</li>
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
<div class="paginate" style="height: 100px;"><@=paginate@></div>
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



<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script src="/js/moment-with-locales.js"></script>

<script>

	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};


	const $allCommentList = $("#cookCommentAll ul");
	const $myComment = $("#myComment");
	const $honeyTipList = $(".honey_tip ul");
	
	const commentImgTmp = _.template($("#commentImgTmp").html());
	const myRepliesTmp = _.template($("#myRepliesTmp").html());
	const allRepliesTmp = _.template($("#allRepliesTmp").html());
	
	
    let boxMove = 0;
    const $commentImgTmp = _.template($("#commentImgTmp").html());
    const $honeyTipInsertTmp = _.template($("#honeyTipInsertTmp").html());
    const $warringTmp = _.template($("#warringTmp").html());

    const $imgPrevBtn = $(".imgPrevBtn")
    const $imgNextBtn = $(".imgNextBtn")

    var $warningBtn = $(".warning_btn")

    let $honeyTip = $(".honey_tip");

    const $commentImgBoxUl = $("#commentImgBox ul");

    let $honeyTipAddBtn = $(".honey_tip_add_btn");

    var $honeyTipInsert = $(".honey_tip_insert");
    
    var $honeyTipForm = $(".honey_tip_form");


    ////////////////// 댓글 사진 /////////////////////////////

    if (boxMove==0){
        $imgPrevBtn.attr("disabled",true);
    } //boxMove가 0이면 이전으로 버튼 비활성화

    $imgPrevBtn.on("click",function () {
    	
        boxMove += 215;

        if (boxMove==0){
            $imgPrevBtn.attr("disabled",true);
        } //boxMove가 0이면 이전으로 버튼 비활성화

        $("#moveBox").css("top",boxMove).css("transition","ease .3s");

    })
    
    $("#moveBox li").on("click", function() {

		$("#trendyFoodMainImg img").text();
	});

	$("#moveBox li img").on("click", function() {

		// alert("z");

		var imgTxt = $(this).attr("src");

		$("#cookMainImg img").attr("src", imgTxt);
	});

	$commentImgBoxUl.on("click", ".box img", function() {

		var tmpImgTxt = $(this).attr("src");

		$("#cookMainImg img").attr("src", tmpImgTxt);
	})
	
	let replyPageNo = 1;
	
	$imgNextBtn.on("click", function() {

		boxMove -= 215;

		$imgPrevBtn.attr("disabled", false); // Next버튼 누르면 Prev버튼 disabled 해제

		$("#moveBox").css("top", boxMove).css("transition", "ease .3s");
		
		replyPageNo++;
		
		replyImg();
		
		// console.log(boxMove);
		
		if(boxMove == -215*(totalImgCnt-1)){
			$imgNextBtn.attr("disabled", true);
		}
		// console.log(totalImgCnt);
		// console.log(-((215)*(totalImgCnt-1)));

	});//imgNextBtn click() end
	
	
	
	
	function replyImg(){
		
		$.ajax({
    		url:"/ajax/replyImg/${cook.no}",
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


    ///////////////// 신고 하기 ////////////////////////
    
    $(".warning_btn").click(function() {

		$("#warningSection").append(warningTmp);

	})
	
    $warningBtn.click(function () {
    	
        $("#cookOrder").append($warringTmp);

    })


	///////////////// 버킷버킷버버킷 /////////////////
	
	$("#bucket").on("click", function() {

		$.ajax({

				url : "/ajax/bucket",
				dataType : "json",
				type : "get",
				data : {
					"postNo" : "${cook.no}",
					"userNo" : "${loginUser.no}",
					"categoryNo" : 3
				},
				error : function() {
					alert("서버 점검중!");
				},
				success : function(json) {
					// console.log(json);
					// console.log($("#likeCnt"));
					$("#likeCnt").text(json.count);
				}
			}) // ajax end
		});
 
	////////////////////////// 점수점수 /////////////////////////////
	
	$("#myTaste .taste").click(function() {

		var taste = this.dataset.taste;
		
		// alert(taste);
		
		$.ajax({
    		url:"/ajax/taste",
    		dataType:"json",
    		type:"POST",
    		data:{"userNo":"${loginUser.no}","postNo":"${cook.no}", "categoryNo":3,"code":taste},
    		error: function() {
				alert("서버 점검중!");
			},
    		success: function(json) {
    			console.log(json);
    			console.log(json.tgFlag);
    			console.log(json.tbFlag);

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
	})
	
	$("#myPlating .plating").click(function() {

		var taste = this.dataset.taste;
		
		// alert(taste);
		
		$.ajax({
    		url:"/ajax/plating",
    		dataType:"json",
    		type:"POST",
    		data:{"userNo":"${loginUser.no}","postNo":"${cook.no}", "categoryNo":3,"code":taste},
    		error: function() {
				alert("서버 점검중!");
			},
    		success: function(json) {
    			console.log(json);
    			console.log(json.pgFlag);
    			console.log(json.pbFlag);
         
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
    			
			}
    	});
	})
	
	///////////////// taste score /////////////////
	
	$("#myTaste").on("click", function() {

		$.ajax({

				url : "/ajax/tScore/"+"${cook.no}",
				dataType : "json",
				type : "get",
				data : {
					"postNo" : "${cook.no}"
				},
				error : function() {
					alert("서버 점검중!");
				},
				success : function(json) {
					console.log(json);
					$("#tScore").text("T "+json);
				}
			}) // ajax end
		});
 
	$("#myPlating").on("click", function() {
		$.ajax({

			url : "/ajax/pScore/"+"${cook.no}",
			dataType : "json",
			type : "get",
			data : {
				"postNo" : "${cook.no}",
				"categoryNo" : 3,
			},
			error : function() {
				alert("서버 점검중!");
			},
			success : function(json) {
				console.log(json);
				$("#pScore").text("P "+json);
			}
		}) // ajax end
	});

	////////////////////// honeyTip register /////////////////////////
	
	$(".honey_tip").on("click",".honey_tip_btn", function() {
		// alert("zz");
		
		let honeyTipData = $(".honey_tip_form").serialize();
		
		
		$.ajax({
			url : "/ajax/honeyTip",
			dataType : "json",
			data: honeyTipData,
			type : "post",
			error : function() {
				alert("서버 점검중!");
			},
			success : function(json) {
				//console.log(json);
				location.reload();
			}
		}) // ajax end
	});
	
	///////////////////////// honeyTip insertTmp /////////////////////
	
    $honeyTipAddBtn.click(function(){
    	let stepNo = this.dataset.stepno;
    	
        $(this).prev().prepend($honeyTipInsertTmp);
        
        console.log(stepNo);
    	$(".honey_step_no").val(stepNo);
    	$(this).hide();
    })

    ///////////////// 댓글 사진 업로드 /////////////////
	    
	 // input type = file
	 var $cookReplyImgFile = $("#cookReplyImgFile");
	
	 // 프로필 사진 이름(input type hidden) 세팅 위해 필요한 id
	 var $uploadReplyImgHidden = $("#uploadReplyImgHidden");
	
	 // 사진이 들어가는 공간 img
	 var $replyImgPlace = $("#replyImgPlace");
	 
	 $cookReplyImgFile.on("change",function(){
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
			$replyImgPlace.css("display","block");
			$uploadReplyImgHidden.val(data.src);

		}
	});//ajax() end
});//change end
    
	///////////////// 댓글 insert ajax ///////////////// 

	$reply = $("#reply");
	
	// form 자체가 submit일 때,
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
							//console.log(cTime);

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


	///////////////// 댓글 paging list ajax ///////////////// 

	let page = 1;

	function getRepliesList(){
	
	$.ajax({
		url:"/ajax/reply/${cook.no}/page/"+page,
		type:"get",
		error:function(){
			alert("서버 점검중!");
		},
		success:function(json){
			//console.log(json)
	   		$allCommentList.html(allRepliesTmp({"replies":json.replies, "paginate":json.paginate}));
	   		//console.log(json.myReplies);
	   		//console.log(json.myReplies==null);
	   		if(json.myReplies!=null){
	   			$myComment.html(myRepliesTmp({"myReplies":json.myReplies}));
	   		}
			//console.log(json);
		}//success() end
	})// ajax() end
	
}// getRepliesList() end

	getRepliesList();



	///////////////// 댓글 페이징 ajax이기 때문에 이벤트 막기 위해 ///////////////// 

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
				//console.log(cTime);

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

	///////////////// 댓글 delete ajax ///////////////// 

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
								//console.log(cTime);

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

	
	//////////////////////좋아요 /////////////////////////////

	$allCommentList.on("click", ".comment_heart_btn", function() {

	let replyNo = this.dataset.no;

	console.log(replyNo);

	$.ajax({
			url : "/ajax/replyLike",
			dataType : "json",
			type : "POST",
			data : {
				"postNo" : "${cook.no}",
				"userNo" : "${loginUser.no}",
				"categoryNo" : 3,
				"replyNo" : replyNo
			},
			error : function() {
				alert("서버 점검중!");
			},
			success : function(json) {
				//console.log(json);

				if (json.flag) {
					$(".heart" + replyNo).attr(
							"class",
							"comment_heart_btn empty_heart fas fa-heart heart"
									+ replyNo);
				} else {
					$(".heart" + replyNo).attr(
							"class",
							"comment_heart_btn empty_heart far fa-heart heart"
									+ replyNo);
				}//if else end

				$(".likeReplyCnt" + replyNo).text(json.count);
			}
		})
	});
	

	////////////////////// honeyTip 좋아요 /////////////////////////////

	$honeyTipList.on("click", ".honey_tip_like", function() {

	let cookOrder = this.dataset.stepcookorder;
	let honeytipNo = this.dataset.cooktipno; 

	console.log(cookOrder);
	console.log(honeytipNo);

	$.ajax({
			url : "/ajax/cookTipLike",
			dataType : "json",
			type : "POST",
			data : {
				"no" : "${cook.no}",
				"userNo" : "${loginUser.no}",
				"stepNo" : "${step.orderNo}",
				"honeytipNo" : honeytipNo
			},
			error : function() {
				alert("서버 점검중!");
			},
			success : function(json) {
				alert("suc");
				console.log(json);

// 				if (json.flag) {
// 					$(".heart" + replyNo).attr(
// 							"class",
// 							"comment_heart_btn empty_heart fas fa-heart heart"
// 									+ replyNo);
// 				} else {
// 					$(".heart" + replyNo).attr(
// 							"class",
// 							"comment_heart_btn empty_heart far fa-heart heart"
// 									+ replyNo);
// 				}//if else end

// 				$(".likeReplyCnt" + replyNo).text(json.count);
			}
		})
	});
</script>

</body>
</html>