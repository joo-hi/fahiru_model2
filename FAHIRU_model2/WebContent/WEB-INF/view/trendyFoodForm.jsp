<%@page import="com.fas.fahiru.dao.TrendyFoodsDAO"%>
<%@page import="com.fas.fahiru.vo.TrendyFood"%>
<%@page import="com.fas.fahiru.dao.TfCooksDAO"%>
<%@page import="com.fas.fahiru.vo.TfCook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trendy Food 작성</title>
<%@ include file="/WEB-INF/template/link.jsp" %>
<link rel="stylesheet" href="/css/trendyFoodForm.css" />
</head>
<body>
<div id="bg"></div>
<form id="trendyFoodForm" action="/tf" method="post">
    <input type="hidden" name="uploadImage" id="uploadImage" value="" />
    <input type="hidden" name="spotNo" id="spotNo">
    <input type="hidden" name="userNo" value="5">
    <fieldset>
        <legend></legend>
        <div id="wrap">
                <div id="trendyFoodLeftBox">
                <div id="trendyFoodImg">
                    <label class="fas fa-camera" for="tFFile">
                        <input id="tFFile" name="tFFile" type="file" value="" accept=".jpg,.jpeg,.png"/>
                    </label>
                </div>
         </div>

            <div id="trendyFoodRightBox">
                <div id="trendyFood">
                    <h3>음식명</h3>
                    <input name="trendyFoodName" id="trendyFoodInput" readonly>
                    <div class="trendy_food msg"></div>
                </div>
                <div id="spot">
                    <h3>상점</h3>
                    <input name="spot" id="spotInput" placeholder="상점을 입력해 주세요." readonly>
                </div>

                <div id="priceBox">
                    <h3>가격</h3>
                    <input id="price" name="price" placeholder="가격을 입력해주세요.">
                </div>

                <div id="fahAdd">
                    <h3>˚F</h3>
                    <input id="fahAddInput" name="fah"/>
                    <button id="fahAddBtn" type="button">추가하기</button>
                    <div id="fahListBox">
                    
                    </div>
                    <div id="checkFahList">
                    	<span>아직 등록되지 않은 화씨입니다. 먼저 등록해주세요.</span>
                    </div>
                </div>
            </div>

        </div>

    </fieldset>
    <button id="register" class="f_r deco">등록하기</button>
    <button id="cancle" class="f_l deco">취소</button>
</form>
<script type="text/template">
	
</script>
<script src="js/jquery.js"></script>
<script>

    const $fahListBox = $("#fahListBox");
    const $fahAddInput = $("#fahAddInput");
    const $trendyFoodMsg = $(".trendy_food");
    
    let $trendyFoodImg = $("#trendyFoodImg");
    let $price = $("#price");
    
    let $spotInput = $("#spotInput");
    let $trendyFood = $("#trendyFoodInput");
    
    let tfName = sessionStorage.getItem('tfName');
    let spotName = sessionStorage.getItem('spotName');
    let spotNo = sessionStorage.getItem('spotNo');
    
    $trendyFood.val(tfName);
    $spotInput.val(spotName);
    $("#spotNo").val(spotNo);
    
    
    let $fahAddBtn = $("#fahAddBtn");

    $fahAddBtn.on("click",function () {
    	
        let name = $fahAddInput.val().trim();
        
        name = name.replace(/(\s*)/g, "");
        
        if(name == null || name == "") {
        	return false;
        }
        
        $.ajax({
        	url:"/ajax/fahCheck/"+name,
        	dataType:"json",
        	type:"GET",
        	error:function() {
        		//alert("화씨 등록 시스템 점검 중");
        		$("#checkFahList span").css("display","block");
        		$("#fahAddInput").val("").focuse();
        	},
        	success:function(json) {
        		console.log(json);
        		
        			$("#checkFahList span").css("display","none");
        			
	        		if($(".fah").length<6){
	                    let $div = $("<div>").appendTo($fahListBox);
	                    $div.text(name+"˚F");
	                    $div.addClass("fah");
	                    $("<input type='hidden' name='fahNo'>").val(json.no).appendTo($div);
	                    console.log(json.no);
	                    $fahAddInput.val('').focus();
	                    return false;
	                }//if end
	                alert("˚F는 6개까지 등록 가능합니다.");

        	}//success end
        });//ajax end

    });//fahAddBtn click end
    
    $fahAddInput.keypress(function(e){
	     if ( e.which == 13 ) {
	    	 $fahAddBtn.click();
	         return false;
	     }
	});//enter event 

    $fahListBox.on("click",".fah",function () {
        $(this).remove();
    });

    

    $("#trendyFoodForm").on("submit",function () {
    	
    	let price = $price.val().trim();
    	
    	console.log(price);
    	console.log($trendyFoodImg.find("img"));
    	console.log($fahListBox.length);
    	console.log(spotNo);
    	
    	
        if(!$trendyFoodImg.find("img") || price == "" || price == 0 || $fahListBox.length == 0){
        	//console.log("if 안에서 처리");
        	return false;
        }//if end
        
        
        console.log("testss");
        
       // return false;
        
    });//trendyFoodBtn end

    
  	//input type = file
    var $upload = $("#upload");
    //프로필 사진
    var $tFFile = $("#tFFile");

    //프로필 사진 이름(input type hidden)
    var $uploadImage = $("#uploadImage");
    
    $tFFile.on("change",function(){
    	//사이즈가 0인 즉 잘못된 파일 선택
    	var file = this.files[0];
    	
    	if(file!=null && file.size<=0){
    		alert("파일을 제대로 선택해 주세요");
    		$tFFile.val("");
    		return;
    	}
    	
    	if(!file.type.includes("image/")){
    		alert("이미지 파일을 제대로 선택해 주세요");
    		$imgBox.val("");
    		return;
    	}
    	
    	var data = new FormData();
    	
    	console.log(1);
    	
    	//tf의 타입 F로
    	data.append("type","F");
    	console.log(2);
    	
    	data.append("uploadImg",file,file.name);
    	console.log(3);
    	
    	$.ajax({
    		url:"/ajax/uploadImg",
    		dataType:"json",
    		type:"post",
    		processData:false,
    		contentType:false,
    		data:data,
    		error:function(){
    			console.log("error");
    			alert("서버 점검중!");
    		},
    		success:function(data){
    			
    			console.log(data);
    			
    			$(".img_box").remove();
     			$("<img class='img_box'>").attr("src","/tfImg/"+data.src).css({"position":"absolute","border-radius":"10px","height":"250px","width":"250px"}).prependTo("#trendyFoodImg");
     			$uploadImage.val(data.src);
     			
    		}//success end
    	});//ajax() end
    });//change end
   
</script>
</body>
</html>