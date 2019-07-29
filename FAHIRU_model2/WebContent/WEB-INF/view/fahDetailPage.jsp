<%@page import="java.util.List"%>
<%@page import="com.fas.fahiru.dao.TfCooksDAOImpl"%>
<%@page import="com.fas.fahiru.vo.TfCook"%>
<%@page import="com.fas.fahiru.dao.FahsDAOImpl"%>
<%@page import="com.fas.fahiru.vo.Fah"%>
<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화씨 디테일 페이지</title>
<link rel="stylesheet" href="/css/fahDetailPage.css" />
<%@ include file="/WEB-INF/template/link.jsp"%>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<main id="content">
	<div id="fahHeader">
		<div id="fahImg">
			<img class="fah_img" src="../img/${fahDetail.fahImg }" />
			<div class="bottom">
				<span class="fahText">${fahDetail.explanation }</span>
			</div>
		</div>
		<div id="imgIcon">
			<i class="far fa-image"></i>
		</div>
		<div id="fahHeaderCenter">
			<div id="fahName">${fahDetail.name }˚F</div>
			<div id="subscribeBox">
				<div id="subscribe">구 독</div>
				<div id="subscribeCount">
					<h3>${fahDetail.cnt}</h3>
				</div>
			</div>
		</div>
		<div id="fahHeaderRight">
			<img id="fasser" src="../profile/${fahDetail.profileImg }" />
			<div id=fasserName>${fahDetail.nickname}</div>
		</div>
		<div class="report">
			<i class="fas fa-exclamation-triangle"></i><span>신고하기</span>
		</div>
	</div>


	<!-- //상단 부분입니다. -->



	<div id="fahWrap">
		<div id="fahTopSection">


			<div id=fahTap>
				<div id="tapAll" class="tap_btn tap_on">
					<span>전체</span>
				</div>
				<div id="tapTrendyFood" class="tap_btn">
					<span>FOOD</span>
				</div>
				<div id="tapCook" class="tap_btn">
					<span>COOK</span>
				</div>
			</div>

			<div id="tfAdd" class="add_btn">
				<a href="/spotForm">+ FOOD</a>
			</div>
			<div id="cookAdd" class="add_btn">
				<a href="/cook">+ COOK</a>
			</div>

			<!-- //fahTap-->
			<div id="fahSearch">
				<div id="fahSearchForm">
					<form action="">
						<fieldset>
							<select>
								<option value="fah" selected>&deg;F</option>
								<option value="writer">작성자</option>
							</select> <input id="fahInputForm" name="search" width="200px" type="text"
								placeholder="검색어를 입력해주세요.">
							<button class="fas fa-search innerSearch" type="submit"></button>

						</fieldset>
					</form>
				</div>
			</div>
			<!--//fahSearch-->

			<div id="fahFilter">
				<select id="fahFilterForm">
					<option value="" selected></option>
					<option value="new"></option>
				</select>
			</div>
			<!-- //fahFilterForm -->
		</div>
		<!-- //"fahTopSection" -->


		<div id="fahSection">
			<ul>
				<%-- 
				<c:forEach items="${fahList}" var="fah">
					<li class="trendfood_card_li"><a href=""> <c:choose>
								<c:when test="${fah.categoryNo==2 }">
									<div class="trendfood_card">
								</c:when>
								<c:otherwise>
									<div class="cook_card">
								</c:otherwise>
							</c:choose>
							<h4 class="cooking_score">${fah.score }</h4> <img
							class="trendfood_img_card" src="../img/${fah.img }" />
							<div class="top back">
								<div class="foodrendy_name">${fah.name }</div>
							</div>

							<div class="bottom back">
								<img class="trendfood_user" src="../profile/${fah.profileImg }" />
								<div class="trendfood_nickname">${fah.nickname }</div>
							</div>
							<div class="fas fa-shopping-basket btn"></div>
							<div class="buketlist_cnt">${fah.cnt }</div>
		</div>
		<!--//trendfood_card -->
		</a>
		</li>
		</c:forEach>

				<li>
					<button class="more_btn">+more</button>
				</li>
				--%>

			</ul>
		</div>
		<!--//fahSection-->
	</div>
	<!--//fahWrap--> </main>

	<%@ include file="/WEB-INF/template/footer.jsp"%>


	<script type="text/template" id="tfCookTmp">
	<@ _.each(tfCookList, function(tfCook){	@>							
	
	<li class="trendfood_card_li">

	<@ if(tfCook.categoryNo==2){  @>
	<a href="/tf/<@=tfCook.no@>">
	<div class="trendfood_card">
	<@ }else{ @>
	<a href="/cook/<@=tfCook.no@>">
	<div class="cook_card">
	<@}@>
							<h4 class="cooking_score"><@=tfCook.score@></h4>

							<img class="trendfood_img_card" src="/cookImg/<@=tfCook.img@>" />
							<div class="top back">
								<div class="foodrendy_name"><@=tfCook.name@></div>
							</div>

							<div class="bottom back">
								<img class="trendfood_user" src="../profile/<@=tfCook.profileImg@>" />
								<div class="trendfood_nickname"><@=tfCook.nickname@></div>
							</div>
							<div class="fas fa-shopping-basket btn"></div>
							<div class="buketlist_cnt"><@=tfCook.cnt@></div>
						</div>
					</a>
				</li>
			<@})@>
			<li class="clear">
				<button class="more_btn tfCook_Btn">+more</button>
			</li>

	</script>

	<script type="text/template" id="trendfoodTmp">
	<@ _.each(fahTfList, function(fahTf){	@>							
	
	<li class="trendfood_card_li">
					<a href="">
						<div class="trendfood_card">
							<h4 class="cooking_score"><@=fahTf.score@></h4>
							<img class="trendfood_img_card" src="../img/<@=fahTf.img@>" />
							<div class="top back">
								<div class="foodrendy_name"><@=fahTf.name@></div>
							</div>

							<div class="bottom back">
								<img class="trendfood_user" src="../profile/<@=fahTf.profileImg@>" />
								<div class="trendfood_nickname"><@=fahTf.nickname@></div>
							</div>
							<div class="fas fa-shopping-basket btn"></div>
							<div class="buketlist_cnt"><@=fahTf.cnt@></div>
						</div>
					</a>
				</li>
			<@})@>
			<li class="clear">
				<button class="more_btn tf_Btn">+more</button>
			</li>
	</script>

	<script type="text/template" id="cookTmp">
	<@ _.each(fahCookList,function(fahCook){@>
	<li class="trendfood_card_li">
					<a href="">
				 			<div class="cook_card">
							<h4 class="cooking_score"><@=fahCook.score@></h4>
							<img class="trendfood_img_card" src="/img/<@=fahCook.img@>" />
							<div class="top back">
								<div class="foodrendy_name"><@=fahCook.name@></div>
							</div>

							<div class="bottom back">
								<img class="trendfood_user" src="/profile/<@=fahCook.profileImg@>" />
								<div class="trendfood_nickname"><@=fahCook.nickname@></div>
							</div>
							<div class="fas fa-shopping-basket btn"></div>
							<div class="buketlist_cnt"><@=fahCook.cnt@></div>
						</div>
					</a>
				</li>
		<@})@>
		
		<li class="clear">
			<button class="more_btn cook_btn">+more</button>
		</li>

	</script>
	<script src="/js/jquery.js"></script>
	<script src="/js/underscore-min.js"></script>
	<script>
		_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};
	<%--tap on class --%>
		
	<%-- 
		인자3개짜리 
		$(부모).on("click",누르는거,function(){});
		--%>
		$("#fahTopSection").on("click", "#fahTap div", function() {
			$(".tap_on").removeClass("tap_on");
			$(this).addClass("tap_on");
		});

		//all
		

		
		$("#fahTopSection").on("click", "#fahTap #tapAll", function() {
			page=1;
			alert("tapAll입니다.");
			$("#fahSection li").remove();
			getTfCook();
		});

		//tapTrendyFood
		$("#fahTopSection").on("click", "#tapTrendyFood", function() {
			fPage=1;
			alert("tapTrendyFood 입니다.");
			$("#fahSection li").remove();
			getTrendFood();
		});

		//cook
		$("#fahTopSection").on("click", "#tapCook", function() {
			cPage=1;
			alert("cook 입니다");
			$("#fahSection li").remove();
			getCook();
		});
		
		
		//버튼 누를 때 처리되는 이벤트
		$("#fahSection").on("click",".tfCook_Btn",function(){
			$(".clear").remove();
			page++;
			getTfCook();
		})//fahSection end
		
		$("#fahSection").on("click",".tf_Btn",function(){
			$(".clear").remove();
			fPage++;
			getTrendFood();
		})//fahSection end 
		
		$("#fahSection").on("click",".cook_btn",function(){
			$(".clear").remove();
			page++;
			cPage(); 
		})//fahSection end 
		
		
		
		
		
		let page = 1;
		let fPage=1;
		let cPage=1;
		
		
		
		$("#fahSection").on("click",".more_btn",function(){
			
		})//

		const $fahSectionUl = $("#fahSection ul");
		const $tapAll = $("#tapAll");
		const $tapTrendyFood = $("#tapTrendyFood");
		const $tapCook = $("#tapCook");

		const tfCookTmp = _.template($("#tfCookTmp").html());
		const trendfoodTmp = _.template($("#trendfoodTmp").html());
		const cookTmp = _.template($("#cookTmp").html());

		
		function getTfCook() {
			$.ajax({
				url : "/ajax/fah/${fahDetail.no}/tfCook/page/"+page,
				dataType : "json",
				type : "get",
				error : function() {
					alert("서버 점검");
				},
				success : function(json) {
					console.log(json.mapList);
					
					$fahSectionUl.append(tfCookTmp({
						"tfCookList" : json.mapList
					}));
					
				}
			})//$.ajax() end
		}//getTfCook() end

		function getTrendFood() {
			$.ajax({
				url : "/ajax/fah/${fahDetail.no}/tf/page/"+fPage,
				dataType : "json",
				type : "get",
				error : function() {
					alert("서버 점검중");
				},
				success : function(json) {
					console.log(json.mapListTf);
					
					$fahSectionUl.append(trendfoodTmp({
						"fahTfList" : json.mapListTf
					}));
					
				}
			})//$.ajax end
		}//getTrendFood end
		
		function getCook() {
			$.ajax({
				url : "/ajax/fah/${fahDetail.no}/cook/page/"+cPage,
				dataType : "json",
				type : "get",
				error : function() {
					alert("서버 점검중");
				},
				success : function(json) {
					console.log(json.mapListCook);
					
					$fahSectionUl.append(cookTmp({
						"fahCookList" : json.mapListCook
					}));
					
				}
			})//$.ajax end
		}//getCook END
	<%-- sidebar--%>
		$("#content").on(
				"click",
				function() {

					$sideBar.css("transform", "translate(300px)").css(
							"transition", "linear .3s ");
				})
	<%-- 메뉴 추가 수정 바람--%>
		$("#menuAdd").on("click", function() {
			alert("ASDF");
			$("#bg").show();
		});
		$(".fa-window-close").on("click", function() {
			$("#bg").fadeOut(700);
		});
		
		getTfCook();
	</script>
</body>
</html>