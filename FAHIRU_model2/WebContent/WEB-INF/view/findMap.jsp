<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find spot</title>
<link rel="stylesheet" href="/css/default.css" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/findMap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<link rel="icon" href="/favicon.PNG"/>

</head>
<body>
<div id="spotCheckWrap">
    <div id="spotSearchSection">
        <form id="placeForm" action="" method="post">
            <div id="searchFieldset">
	     	   <input id="place" placeholder="장소를 입력해보세요"/>
	  	      <button id="get" class="fas fa-search inner_search cursor_pointer"></button>
            </div>
        </form>
    </div><!--//spotSearchSection-->
    <div id="map">Spot Map</div>
    <div id="spotListSection">
        <ul id="spotList" style="list-style-type: decimal">
        </ul>
    </div><!--//spotListSection-->
    <div id="oneAddress">
        <div id="placeName"></div>
        <div id="roadAddressName"></div>
    </div>
    <div id="this"></div>
<!--     <a id="spotResistBtn" href="/spotForm.jsp">spot 등록!</a> -->
</div><!--//spotCheckWrap-->
<script type="text/template" id="placeListTmp">
    <@
    _.each(placeData,function(place, idx) {
    @>

    <li class="spot_one regist list<@=idx@> listHover">
        <span class="place_name"><@=place.place_name@></span><br/>
        <@ if(place.road_address_name==""){ @>
        <span class="road_address">주소정보 없음</span>
        <@}else{@>
        <span class="road_address"><@=place.road_address_name@></span><br/>
        <@}@>
        <span class="place_x" style="display: none"><@=place.x@></span>
        <span class="place_y" style="display: none"><@=place.y@></span>
        <span class="spot_id" style="display: none"><@=place.id@></span>
        <span class="address_name" style="display: none"><@=place.address_name@></span>
		<div class="spot_check no<@=idx@>">등록가능</div>
    </li>
    <@ }) @>
</script>
<script type="text/template" id="registerSpotTmp">
    <a id="spotResistBtn" href="/spotForm">이 장소 등록하기</a>
</script>
<script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a309166281c76b30e258ea0af1d0ea76&libraries=services"></script>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>

	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    let place = '';

    const $place = $("#place");

    let placeX = 0;

    let placeY = 0;
    
    let spotId = 0;
    
    let addressName = "";

    let placeData = [];
    
    let spotCheckResult = [];
    

    var placeListTmp = _.template($("#placeListTmp").html());
    var registerSpotTmp = _.template($("#registerSpotTmp").html());

    $("#spotResistBtn").click(function() {
    		
    })
    


    $("#placeForm").on("submit",function (e) {

        e.preventDefault();
        place = $place.val();
        // 장소 검색 객체를 생성합니다
        var ps = new daum.maps.services.Places();

        // 키워드로 장소를 검색합니다
        ps.keywordSearch(place, placesSearchCB);

        // 키워드 검색 완료 시 호출되는 콜백함수 입니다
        function placesSearchCB(data, status, pagination) {
            if (status === daum.maps.services.Status.OK) {

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
                // LatLngBounds 객체에 좌표를 추가합니다
                var bounds = new daum.maps.LatLngBounds();

                placeData = data;

                console.log(data);
                //
                //
                // console.log(data[0].road_address_name);
                // console.log(data[0].place_name);

                //console.log(placeData);

                //
                // for (var i=0; i<data.length; i++) {
                //     //displayMarker(data[i]);
                //     bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
                // }

                // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
                // map.setBounds(bounds);
                
                for (let i = 0; i<data.length; i++){
                	
                	
	                function spotCheck(){
	                	$.ajax({
	               			url:"/ajax/spot/checkId/" + data[i].id,
	               			dataType:"json",
	               			type:"GET",
	               			error:function(){
	               				alert("에러!!");
	               			},
	               			success:function(json) {
	               				
	               				if(json!=true){
	               					$(".no"+i).text("등록 불가").css("color","red");
	               					$(".list"+i).removeClass("regist").css("cursor","not-allowed");
	               					
	               				}
	               				
	               			}
	               				
	                	})// ajax()end
	                	
	                }//spotCheck() end
	                
	                spotCheck();
	                
                }//for() end;
                
                
                $("#spotList").html(placeListTmp({"placeData": placeData}));
                
                
            }//if end
            
        }//placesSearchCB() end

    })//#placeForm.submit() end

    $getPlaceName = $("#getPlaceName");
    $getAdressName = $("#getAdress");

    $roadAddressName = $("#roadAddressName");
    $placeName = $("#placeName");

    let $this = $(this)

    $("#spotList").on("click", ".regist", function () {
    	
    	// 여기다 주하야
        $("#this").append(registerSpotTmp);

        var index = $(".regist").index(this);

        var roadAddress = $(".regist:eq(" + index + ") .road_address").text();
        var placeName = $(".regist:eq(" + index + ") .place_name").text();

        console.log($(".regist:eq(" + index + ") .road_address").text());

        placeX = $(".regist:eq(" + index + ") .place_x").text();
        placeY = $(".regist:eq(" + index + ") .place_y").text();
        spotId = $(".regist:eq(" + index + ") .spot_id").text();
        addressName = $(".regist:eq(" + index + ") .address_name").text();

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(placeY, placeX), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new daum.maps.Map(mapContainer, mapOption);

        // 마커가 표시될 위치입니다
        var markerPosition = new daum.maps.LatLng(placeY, placeX);

        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);


        console.log(placeX);

        // 세션 스토리지에 저장..
        $("#placeName").text(placeName);
        $("#roadAddressName").text(roadAddress);
                
        sessionStorage.setItem('placeName', placeName);
        sessionStorage.setItem('roadAddressName', roadAddress);
        sessionStorage.setItem('placeX', placeX);
        sessionStorage.setItem('placeY', placeY);
        sessionStorage.setItem('spotId', spotId);
        sessionStorage.setItem('addressName', addressName);

        console.log(index);
        
        
    })


    navigator.geolocation.getCurrentPosition(function(e){

        e.coords.latitude;

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new daum.maps.LatLng(e.coords.latitude, e.coords.longitude), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new daum.maps.Map(mapContainer, mapOption);

        // 마커가 표시될 위치입니다
        var markerPosition = new daum.maps.LatLng(e.coords.latitude, e.coords.longitude);

        // 마커를 생성합니다
        var marker = new daum.maps.Marker({
            position: markerPosition

        })
        marker.setMap(map);
    },function(){
        alert("실패!")
    });
    
    




</script>

</body>
</html>