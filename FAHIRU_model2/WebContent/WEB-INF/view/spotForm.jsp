<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>spot form</title>
    <link href="/css/reset.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:700i,900i,600i&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Black+Han+Sans|Jua|Nanum+Gothic+Coding:700&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="/css/spotForm.css" />
	
</head>
<body>
<div id="bg"></div>
<div id="spotForm">
    <form action="/spotForm" method="POST">
       <input type ="hidden" name= "categoryNo" value = "4"/>
       <input type="hidden"  name="img"  value="defaultimg.png" id="spotImg"/>
       <input type="hidden" id="longitude" name="longitude" />
       <input type="hidden" id="latitude" name="latitude"/>
       <input type="hidden" id="spotId"  name="spotId"/>
        <fieldset>
            <div id="spotInfoSection">
                <div>
                    <img id="imgBox" class="no_image" src="/profile/defaultimg.png" width="250px" height="250px">
                    <label class="filelabel">
                        <i class="fas fa-camera img_icon"></i>
                        <input type="file" id="spotImage" >
                    </label>
                </div>
                <div id="spotMainInfo">
                    <div><h4>상점명</h4><input id="spotName" class="spot_address_form spot_form" readonly name="name"></div>
                    <div><h4>주소</h4><input id="spotAddress" class="spot_address_form address_form" readonly name="address"></div>
                    <div><h4>상세주소</h4><input class="spot_address_form address_form" name="subAddress"></div>
                </div>
                <button id="closeBtn"><i class="fas fa-window-close"></i></button>
            </div><!--//spotInfoSection-->

            <div id="spotSubInfoSection">
                <h3 class="fas fa-angle-down spotTitle">부가정보</h3>
                <div id="spotSubInfo">

                    <div><h5>전화번호</h5>
                        <select name="phoneNum1">
                            <option value="010" selected>02</option>
                            <option value="011" >031</option>
                            <option value="018" >032</option>
                        </select>
                        <input class="sub_info_forms" name="phoneNum2"> - <input class="sub_info_forms" name="phoneNum3">
                    </div>

                    <div><h5>영업정보</h5><textarea class="sub_info_text sub_info_forms" name="timeInfo"></textarea></div>

                    <div><h5>주차</h5>
                        <label><input type="radio" name="parking" value="Y">있음</label>
                        <label><input type="radio" name="parking" value="N">없음</label>
                    </div>

                    <div><h5>단체석</h5>
                        <label><input type="radio" name="together" value="Y">있음</label>
                        <label><input type="radio" name="together" value="N">없음</label>
                    </div>

                </div><!--//spotSubInfoSection-->
            </div><!--//spotSubInfo-->
            <button class="spot_btn_left spot_btn">등록</button>
            <button class="spot_btn_right spot_btn"><a href="/spot">취소</a></button>
        </fieldset>
    </form>
</div><!--//spotForm-->
<script src="/js/jquery.js"></script>
<script>

//input type = file
var $spotImage = $("#spotImage");
var $imgBox = $("#imgBox");
var $spotImg = $("#spotImg");

var placeName = sessionStorage.getItem('placeName');
var roadAddressName = sessionStorage.getItem('roadAddressName');
var placeX = sessionStorage.getItem('placeX');
var placeY = sessionStorage.getItem('placeY');
var spotId = sessionStorage.getItem('spotId');
var addressName = sessionStorage.getItem('addressName');

console.log(placeX);

$("#spotName").val(placeName);
$("#spotAddress").val(roadAddressName);
$("#longitude").val(placeX);
$("#latitude").val(placeY);
$("#spotId").val(spotId);


$spotImage.on("change",function(){
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
	data.append("type","S");
	
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
			$imgBox.attr("src","/spotImg/"+data.src);
			$spotImg.val(data.src);
			$imgBox.removeClass("no_image");
			$(".img_icon").css("display", "none");
		}
	});//ajax() end
});//change end


</script>
</body>
</html>