<%@page import="com.fas.fahiru.dao.FahsDAOImpl"%>
<%@page import="com.fas.fahiru.vo.Fah"%>
<%@page import="com.fas.fahiru.vo.Like"%>
<%@page import="com.fas.fahiru.dao.LikesDAOImpl"%>
<%@page import="com.fas.fahiru.dao.TfCooksDAOImpl"%>
<%@page import="com.fas.fahiru.vo.TfCook"%>
<%@page import="java.util.List"%>
<%@page import="com.fas.fahiru.dao.SpotsDAOImpl"%>
<%@page import="com.fas.fahiru.vo.Spot"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spot Detail</title>
<link rel="stylesheet" href="/css/default.css" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/spotDetailPage.css" />
<link rel="stylesheet" href="/css/fahAddForm.css"/>
<link rel="stylesheet" href="/css/sideBar.css"/>
<c:import url="/WEB-INF/template/link.jsp"/>

<style>

		#spotImg  {
			width:300px;
			height:300px;
			background-size:100% 100%;
 			backgorund-repeat:no-repeat;
		}
		#detailPage #fahCloud .fahto{
			float:left;
			background-color:transparent;
			margin:5px;
		}
		#fahCloud{
			margin:auto;
		}
		#trendyFoodListWrap>.spot_trendy_food_img_box> #spotTrendyFoodImgBoxUL>.box>a{
			width:180px;
			height:180px;
			text-decoration: none;
			color:#222222;
		}
		.box>div {
		width:180px;
		height:180px;
		background-size:100% 100%;
		}
		
        					   
		.fahLv0 {
			vertical-align: middle;
			height:45px;
			font-size:16px;
		}
		.fahLv1{
			vertical-align: middle;
			height:50px;
			font-size:28px;
			color:#EF9A9A;
		}
		.fahLv2{
			vertical-align: middle;
			height:55px;
			font-size:40px;
			color:#FF9800;
		}
		.fahLv3{
			vertical-align: middle;
			height:60px;
			font-size:52px;
			color:#E64A19;
		}
		.fahLv4{
			vertical-align: middle;
			height:65px;
			font-size:64px;
			color:rgb(238,49,36);
		}
		
		.fahto:hover {
			color:rgb(238,49,36);
			transform: scale(1.1);
		}
		
		
</style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<div id="detailPage">
    <div id="spotInfo">
        <h1 id="spotName" class="cursor_pointer">${spot.name }  </h1>
        <div id="map"><img id="spotImg" src="/img/${spot.img }"/></div><!--//trendyFoodMainImg-->
        <div id="spotImgIcon" class="picture btn"><i class="far fa-image"></i></div>
        <div id="spotMapIcon" class="map_view btn"><i class="fas fa-map-marker-alt cursor_pointer"></i></div>
        <div class="spot_score">
            <div class="totalTaste"><i class="fas fa-thermometer-three-quarters"></i> <br/>${spot.taste }점</div>
            <div class="totalPlating"><i class="fas fa-temperature-high"></i> <br/>${spot.plating }점</div>
        </div><!--//spot_score-->
        <div id="bucket">
            <button><i class="fas fa-shopping-basket cursor_pointer"></i></button>
            <br/><span id="bucketCnt">${bucket}</span>
        </div>
        <div class="cursor_pointer user_profile">
            <img id="userImgID" class="user_img" src="/profile/${spot.profileImg }">
            <div id="userName" class="text_center">${spot.nickname }</div>
        </div><!--//userProfile-->
        <div id="spotInfoList">
            <div id="shopName" class="cursor_pointer"><i class="fas fa-map-marker-alt"></i>${spot.address } </div>
        </div><!--//spotInfoList-->
    </div><!--spotInfo-->

    <div id="fahCloud" style="width:500px;">
    <ul>
   		<c:forEach items="${fahs }" var="fah">
    	<a href="/fah/${fah.no }">
    	<c:choose>
    	<c:when test="${fah.cntFah>12}">
 	    <li class="fahto fahLv4">
    	</c:when>
    	<c:when test="${fah.cntFah>9}">
    	<li class="fahto fahLv3">
    	</c:when>
    	<c:when test="${fah.cntFah>6}">
    	<li class="fahto fahLv2">
    	</c:when>
    	<c:when test="${fah.cntFah>3}">
    	<li class="fahto fahLv1">
    	</c:when>
    	<c:otherwise>
    	<li class="fahto fahLv0">
    	</c:otherwise>
        </c:choose>
        ${fah.fname }&deg;F</li>
        </a>
        </c:forEach>
    </ul>
    </div> <!--fahCloud end-->

    <div id="trendyFoodListWrap">
        <div id="trendyFood">trendy food</div>
        <a href="/trendyFoodForm.jsp" class="fas fa-plus-circle plus_btn"> 등록하기</a>
        <div class="spot_trendy_food_img_box cursor_pointer">
            <ul id="spotTrendyFoodImgBoxUL">
            <a style="color: #222222" href="/tf/${tfCook.no}">
            	<c:forEach items="${tfCooks }" var="tfCook">
                <li class="box">
                    <div  style="background-image:url(/img/${tfCook.img})"></div>
                </li>
                </c:forEach>
                </a>
            </ul>
        </div><!--//spotTrendyFoodImgBox-->
    </div><!--//trendyFoodListWrap-->

    <div id="spotDetailInfo" style="display:none">
        <div class="detailInfo" style="font-size: 40px">detail information</div>
        </br>
        <button class="fas fa-plus-circle detail_plus_btn detail_plus_btn"></button>
        <div><i class="fas fa-phone"></i> 02-939-0717</div>
        <div><i class="fas fa-clock"></i> 11:00 ~ 18:00</div>
        <div><i class="fas fa-utensils"></i> 16:00 ~ 18:00</div>
        <div><i class="fas fa-plane-departure"></i> 월</div>
        <div><i class="fas fa-parking">
        </i></div>
        <div><i class="fas fa-user-friends"></i> 
        </div>
    </div><!--spotDetailInfo-->
    <button class="fas fa-exclamation-triangle warning_btn"> 신고하기</button>
    <a href="/spot" style="color: #222222"class="far fa-window-close close cursor_pointer"></a>
</div><!--detailPage-->
<c:import url="/WEB-INF/template/footer.jsp"/>
<script type="text/template" id="detailInfoUpdateTmp">
    <div id="detailInfoUpdate">
        <form>
            <fieldset>
                <div id="spotSubInfoSection">
                    <div id="detailInfo">detail information</div>
                    </br>
                    <div id="spotSubInfo">
                        <div><i class="fas fa-phone"></i>
                            <select>
                                <option value="" selected>010</option>
                                <option value="011">011</option>
                                <option value="018">018</option>
                            </select>
                            <input class="sub_info_forms" name=""> - <input class="sub_info_forms" name="">
                        </div>

                        <div><i class="fas fa-clock"></i> <input class="sub_info_forms" name="">~<input
                                class="sub_info_forms" name=""></div>
                        <div><i class="fas fa-utensils"></i> <input class="sub_info_forms" name="">~<input
                                class="sub_info_forms" name=""></div>

                        <div><i class="fas fa-plane-departure"></i>
                            <label><input type="checkbox" name="">월</label>
                            <label><input type="checkbox" name="">화</label>
                            <label><input type="checkbox" name="">수</label>
                            <label><input type="checkbox" name="">목</label>
                            <label><input type="checkbox" name="">금</label>
                            <label><input type="checkbox" name="">토</label>
                            <label><input type="checkbox" name="">일</label>
                        </div>

                        <div><i class="fas fa-parking"></i>
                            <label><input type="radio" name="">있음</label>
                            <label><input type="radio" name="">없음</label>
                        </div>

                        <div><i class="fas fa-user-friends"></i>
                            <label><input type="radio" name="">있음</label>
                            <label><input type="radio" name="">없음</label>
                        </div>

                    </div><!--//spotSubInfoSection-->
                </div><!--//spotSubInfo-->
                <button class="spot_btn_left spot_btn">등록</button>
                <button class="spot_btn_right spot_btn">취소</button>
            </fieldset>
        </form>
    </div><!--//spotForm-->
</script>
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

<script src="../js/jquery.js"></script>
<script src="../js/underscore-min.js"></script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a309166281c76b30e258ea0af1d0ea76&libraries=services"></script>
<script>

    var detailInfoUpdateTmp = _.template($("#detailInfoUpdateTmp").html());
    var warningTmp = _.template($("#warringTmp").html());
    
    var $shopName = $("#shopName");



    /*-------------------------map---------------*/
    $(".map_view").on("click", function () {
    	
    	 $("#spotImg").css("display", "none");

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 생성합니다
        var map = new daum.maps.Map(mapContainer, mapOption);

        // 주소-좌표 변환 객체를 생성합니다
        var geocoder = new daum.maps.services.Geocoder();

        // 주소로 좌표를 검색합니다
        geocoder.addressSearch($shopName.text(), function (result, status) {

            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {

                var coords = new daum.maps.LatLng(result[0].y, result[0].x);

                // 결과값으로 받은 위치를 마커로 표시합니다
                var marker = new daum.maps.Marker({
                    map: map,
                    position: coords
                });


                // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                map.setCenter(coords);

                $("#spotMapIcon").css("left", "365px");
                $("#spotImgIcon").css("left", "400px");
            }
        });

    })

    $(".picture").click(function () {
        $("#map").css("background","transparent");
        $("#map>div").remove();
        $("#spotImg").css("display", "block")
            .css("transition", "ease .2s").css("background-size", "100% 100%");

        $("#spotImgIcon").css("left", 365);
        $("#spotMapIcon").css("left", 400);
    })


    $(".detail_plus_btn").on("click", function () {
        $("#spotDetailInfo").append(detailInfoUpdateTmp);
    })

    $("#detailPage").on("click", ".spot_btn_right", function () {
        $(this).parent().remove();
    })


    $(".warning_btn").click(function () {

        $("#detailPage").append(warningTmp);
    })

    $("#detailPage").on("click", ".close_btn", function () {
        $(this).parent().remove();
    })
    
    $("#bucket").on("click",function(){
    	
    	$.ajax({
    		url:"/ajax/bucket",
    		dataType:"json",
    		type : "get",
			data : {
				"postNo" : "${spot.no}",
				"userNo" : "${loginUser.no}",
				"categoryNo" : 4
			},
			error : function() {
				alert("점검중!");
			},
			success : function(json) {
				console.log(json);
				console.log(json.flag);
				$("#bucketCnt").text(json.count);
			}//success end
    	})
    })

</script>

</body>
</html>