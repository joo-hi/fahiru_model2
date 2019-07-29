<%@page import="com.fas.fahiru.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cook 등록하기</title>
<link rel="stylesheet" href="/css/default.css" />
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/cookForm.css" />
<%@include file="/WEB-INF/template/link.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<style>

	

</style>

</head>
<body>
<div id="bg"></div>
<div id="cookRegistWrap">
    <form action="/cook" method="post">
    	<input name="userNo" value="${loginUser.no}" type="hidden"/>
    	<input id="uploadCookImg" type="hidden" name="img" value="" />
    	<input id="uploadStepImg" type="hidden" name="sookStepImg" value="" />
        <fieldset>
            <div id="basicInfo">
                <div id="cookPicture">
                	<img id="cookImgPlace" width="260" height="260" src=""/>
                    <label class="img_icon fas fa-camera">
                        <input id="cookImg" type="file"/>
                    </label>
                </div><!--//cookPicture-->
                <div id="cookFah"><span>Fahrenheit</span>
                    <br/>
                    <input name="forFah" id="fahEnter"/>
                    <button type="button" id="fahEnterBtn">등록</button>
                    <div id="fahList">
                    </div>
                    <div class='enter_error'></div>
                </div><!--//cookFah-->
                <div id="cookName"> 요리명 : &nbsp;
                    <input name="name" style="width: 200px;" placeholder="Cook Name"/>
                </div><!--//cookName-->
                <div id="cookAmount"> 양 : &nbsp;
                    <input name="cookAmount" placeholder=" 1" style="width: 50px;"/>인분
                </div>
                <div id="cookingTime">
                    <div id="cookingTimeTitle">소요시간</div>
                    <label>
                        <input value="A" name="cookTime" type="radio"/> 5분이내
                    </label>
                    <label>
                        <input value="B" name="cookTime" type="radio"/> 10분이내
                    </label>
                    <label>
                        <input value="C" name="cookTime" type="radio"/> 30분이내
                    </label><br/>
                    <label>
                        <input value="D" name="cookTime" type="radio"/> 1시간이내
                    </label>
                    <label>
                        <input value="E" name="cookTime" type="radio"/> 1시간이상
                    </label>
                </div>
            </div>
            <div id="totalIngredients">
                <div id="mainIngredients">재료<br/>
                    <div class="ing_box">
                        <input name="ingredientsName" placeholder="재료명"/> <input name="ingredientsUnit" placeholder="단위" style="width: 50px;"/>
                    </div>
                    <div class="ing_box">
                        <input name="ingredientsName" placeholder="재료명"/> <input name="ingredientsUnit" placeholder="단위" style="width: 50px;"/>
                        <div class="far fa-window-close close cursor_pointer"></div>
            
                    </div>
                    <div class="ing_box">
                        <input name="ingredientsName" placeholder="재료명"/> <input name="ingredientsUnit" placeholder="단위" style="width: 50px;"/>
                        <div class="far fa-window-close close cursor_pointer"></div>
                    </div>
                    <button class="mainIng_add_btn" type="button"> 재료 추가하기</button>
                </div><!--//foodIngredients-->
                <div id="sourceIngredients">양념<br/>
                    <div class="ing_box">
                        <input name="sourceName" placeholder="source"/> <input name="sourceAmmount" placeholder="단위" style="width: 50px;"/>
                        <select name="sourceUnit">
                            <option value="Ta">Ts (Table Spoon)</option>
                            <option value="Te">ts (tea Spoon)</option>
                        </select>
                    </div>
                    <div class="ing_box">
                        <input name="sourceName" placeholder="source"/> <input name="sourceAmmount" placeholder="단위" style="width: 50px;"/>
                        <select name="sourceUnit" >
                            <option value="Ta">Ts (Table Spoon)</option>
                            <option value="Te">ts (tea Spoon)</option>
                        </select>
                        <div class="far fa-window-close close cursor_pointer" style="left: 390px;"></div>
                    </div>
                    <div class="ing_box">
                        <input name="sourceName" placeholder="source"/> <input name="sourceAmmount" placeholder="단위" style="width: 50px;"/>
                        <select name="sourceUnit" >
                            <option value="Ta">Ts (Table Spoon)</option>
                            <option value="Te">ts (tea Spoon)</option>
                        </select>
                        <div class="far fa-window-close close cursor_pointer" style="left: 390px;"></div>
                    </div>
                    <button class="source_add_btn" type="button" > 양념 추가하기</button>

                </div><!--//sourceIngredients-->
                <div id="clear"></div>
            </div><!--//totalIngredients-->
            <div id="cookingOrder">
                <h3 id="cookingOrderTitle">요리순서</h3>
                <div class="cook_step_box">
                    <h5 class="cook_step"><span class="step_num"><input type="hidden" name="cookOrder" value="1"/>Step1</span></h5>
                    <textarea name="stepContents" class="cook_step_text"></textarea>
                    <img class="stepImgPlace sChange1" width="160" height="160" src=""/>         
                    <label class="fas fa-camera">
                        <input name="stepImg"  data-no="1" class="stepImgOne cook_step_picture_one" type="file" value=""/>
                    </label>
                    <button type="button" class="far fa-times-circle step_delete"></button>
                    <button type="button" class="fas fa-angle-double-up step_change step_up" data-order="1"></button>
                    <button type="button" class="fas fa-angle-double-down step_change step_down" data-order="1"></button>
                </div><!--//cook_step_box-->
                <button type="button" class="step_add"> + Step 추가하기</button>
            </div><!--//cookingOrder-->
            <div id="tipAndOpen">
                <label class="form-switch" id="honeyTipAccept" >다른 유저의 꿀팁 추가를 허용 하실건가요?
                    &nbsp; <input name="tipAccept" type="checkbox" checked/><i></i>
                </label><br/>
                <label class="form-switch" id="openAccept">게시물을 공개하실건가요?
                    <input name="openAccept" type="checkbox" checked/><i></i>
                </label>
            </div><!--//timAndOpen-->
            <div id="lastBtnBox">
                <button class="cook_regist_btn cook_btn">등록</a></button>
                <button class="cook_cancle_btn cook_btn"><a href="/fahDetailPage.jsp">취소</a></button>
            </div>
        </fieldset>
    </form>
    <button id="closeBtn"><i class="far fa-window-close"></i></button>
</div>

<script type="text/template" id="mainIngredientsTmp">
    <div class="ing_box">
        <input name="ingredientsName" placeholder="재료명"/> <input name="ingredientsUnit" placeholder="단위" style="width: 50px;"/>
        <div class="far fa-window-close close cursor_pointer"></div>
    </div>
    <button class="mainIng_add_btn" type="button"> 재료 추가하기</button>
</script>

<script type="text/template" id="sourceIngredientsTmp">
    <div class="ing_box">
        <input name="sourceName" placeholder="source"/> <input name="sourceAmmount"  placeholder="단위" style="width: 50px;"/>
        <select  name="sourceUnit">
            <option value="Ta">Ts (Table Spoon)</option>
            <option value="Te">ts (tea Spoon)</option>
        </select>
        <div class="far fa-window-close close cursor_pointer" style="left: 390px;"></div>
    </div>
    <button class="source_add_btn" type="button"> 양념 추가하기</button>
</script>

<script type="text/template" id="cookStepBoxTmp">
    <div class="cook_step_box">
        <h5 class="cook_step"><span class="step_num"><input type="hidden" name="cookOrder" value="<@=step@>"/>Step<@=step@></span></h5>
        <textarea name="stepContents" class="cook_step_text"></textarea>
        <img class="stepImgPlace sChange<@=step@>" width="160" height="160" src=""/>         
        <label class="fas fa-camera">
              <input name="stepImg" data-no="<@=step@>"  class="stepImgOne cook_step_picture_one" type="file" value=""/>
        </label>
        <button type="button" class="far fa-times-circle step_delete"></button>
        <button type="button" class="fas fa-angle-double-up step_change step_up" data-order="<@=step@>"></button>
        <button type="button" class="fas fa-angle-double-down step_change step_down" data-order="<@=step@>"></button>
    </div>
    <button type="button" class="step_add"> + Step 추가하기</button>
</script>

<script type="text/template" id="goFahListTmp">
	<div class='entered_fah'><@=goFah.name@>˚F
		<input type="hidden" value="<@=goFah.name@>" name='inputFahName' class='input_fah'/>
		<input type="hidden" value="<@=goFah.no@>" name='inputFahNo' class='input_fah'/>
	</div>
</script>

<script src="/js/underscore-min.js"></script>
<script src="/js/jquery.js"></script>
<script>

_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    var mainIngredientsTmp = _.template($("#mainIngredientsTmp").html());
    var sourceIngredientsTmp = _.template($("#sourceIngredientsTmp").html());
    var cookStepBoxTmp = _.template($("#cookStepBoxTmp").html());
    var goFahListTmp = _.template($("#goFahListTmp").html());

    const $fahEnterBtn = $("#fahEnterBtn")


    $fahEnterBtn.on("click", function (e) {

        $(".enter_error").text("");

        e.preventDefault();

        goFahList();
        
        $("#fahEnter").val("").focus();
    })
    
	//********************************************************************* ajax/fahCheck
    function goFahList(){
    	let fahVal = $("#fahEnter").val();
    	let fahSize = $(".entered_fah").length;
    	
    	if (fahSize <= 5) {
    		if (fahVal != "") {
    			$.ajax({
    				   url:"/ajax/fahCheck/"+fahVal,
    				   dataType:"json",
    				   data:{"forFah":fahVal},
    				   error:function() {
    					  alert("서버 점검중!");
    				   },
    				   success:function(json) {
    					   console.log(json);
    					   console.log(json.fahs);
    					   console.log(json.msg);
    					   // checkFah();
    					   if(json.fahs!=null){
    					   		$("#fahList").append(goFahListTmp({"goFah":json.fahs}));
    					   }else{
    						   $(".enter_error").text("등록되지 않은 화씨입니다 먼저 등록해주세요!");
    					   }
    				   }//success end
    			   });//$.ajax() end
    			
    		}else {
    			$(".enter_error").text("˚F는 최대 6개까지 등록 가능합니다.");
    		}
    	}
  		$("#fahEnter").val("").focus();
    }

    $("#fahList").on("click", ".entered_fah", function () {
        $(this).remove();
    })

    $("#mainIngredients").on("click", ".mainIng_add_btn", function () {

        $(this).remove();

        $("#mainIngredients").append(mainIngredientsTmp);

    })

    $("#sourceIngredients").on("click", ".source_add_btn", function () {

        $(this).remove();

        $("#sourceIngredients").append(sourceIngredientsTmp);

    })

    // *************************************************** cook order 
    
    let step = 1;
    $("#cookingOrder").on("click", ".step_add", function () {
        let size = $(".cook_step_box").length+1;
        $(this).remove();
        $("#cookingOrder").append(cookStepBoxTmp({step:size++}));
    })

    $("#cookingOrder").on("click", ".step_delete", function () {

        if ($(".cook_step_box").length == 1) {
            return false;
        } else {
            $(this).parent().remove();
        }

        console.log($(".cook_step_box").length);

        for(let i=0;i<=($(".cook_step_box").length);i++){
            $(".cook_step_box:eq("+i+") .step_num").text("Step"+(i+1));
        }
    })

    $("#cookingOrder").on("click", ".step_up", function () {
    	let order = this.dataset.order;
    	if( order == 1){
    		return false;
    	}

        $(this).parent().insertBefore($(this).parent().prev());

        for(let i=0;i<=($(".cook_step_box").length);i++){
            $(".cook_step_box:eq("+i+") .step_num").text("Step"+(i+1));
            $(".cook_step_box:eq("+i+") .step_change").attr("data-order",i+1);
        }

    })

    $("#cookingOrder").on("click", ".step_down", function () {
    	
    	let order = this.dataset.order;
    	let boxCnt = $(".cook_step_box").length;
    	
    	if( order == boxCnt){
    		return false;
    	}

        $(this).parent().insertAfter($(this).parent().next());

        for(let i=0;i<=($(".cook_step_box").length);i++){
            $(".cook_step_box:eq("+i+") .step_num").text("Step"+(i+1));
            $(".cook_step_box:eq("+i+") .step_change").attr("data-order",i+1);
        }

    })

    $("#totalIngredients").on("click", ".ing_box .close", function () {
        $(this).parent().remove();
        return false;
    })

    
    //********************************************************************* 0619 이미지 업로드
    const $cookImg = $("#cookImg");
    const $cookStepBox = $(".cook_step_box");
    const $stepImg = $("#stepImg");
	const $cookImgPlace = $("#cookImgPlace");    
	const $cookStepPlace = $("#cookStepPlace");    
	// const $cookImgName = $("#cookImgName");
	// cook 사진 이름(input type hidden) 세팅 위해 필요한 id
	var $uploadCookImg = $("#uploadCookImg");
	var $uploadStepImg = $("#uploadStepImg");
    
    let oldCookImg = null;
    let oldStepImg = null;
    
    
    //********************************************************************** change() start -cookImg
//     $cookImg.on("change", function() {
	
// 		//jquery객체에서 순수자바스크립트요소객체 얻기
// 		const cookImg = $cookImg.get(0);
		
// 		//input type=file요소(순수자바스크립트)는 무조건
// 		//files배열을 가지고 있습니다.
		
// 		//한 개의 파일
// 		const file = cookImg.files[0];
			
// 		//File 객체의 속성
// 		//- type : MIME( image/jpeg, audio/mp3, video/mp4...)
// 		//- name : 파일명
// 		//- lastModified : 최종수정일
// 		//- size : 파일 크기
		
// 		if(oldCookImg!=file.name) {
			
// 			oldCookImg = file.name;
		
// 		//여기에 넘어왔다는 뜻은 유저가 선택한 파일이
// 		//1바이트이상의 크기이고 이미지 파일이라는 뜻입니다.
		
// 		//ajax로 넘길 폼을 생성하고
// 		const form = new FormData();
		
// 		//우리가 선택한 파일을 붙임
// 		form.append("type","C");//일반적인 데이터
		
// 		//1)파라미터명, 2) 파일 3) 파일명
// 		form.append("uploadImg",file,file.name);
		
// 		console.log(form.uploadImg);
		
// 		//multipart/form-data로 ajax처리
// 		$.ajax({
// 			url:"/ajax/cook",
// 			dataType:"json",
// 			type:"POST",//multipart/form-data
// 			processData:false,//multipart/form-data
// 			contentType:false,//multipart/form-data
// 			data:form,
// 			error:function() {
// 				alert("사진 서버 점검중!");
// 			},
// 			success:function(json) {
// 				$cookImgPlace.attr("src",".."+json.src);
// 				$cookImgPlace.css("display","block");
// 				$cookImgName.val(json.src);

				
// 			}//success end
			
// 		});//ajax() end
		
// 		}//if end
		
// 	}) // change() end
	
	
	
	
	
	/**********************************/
	$cookImg.on("change",function(){
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
	data.append("type","C");
	
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
			$cookImgPlace.attr("src","/cookImg/"+data.src);
			// $cookImgName.val(data.src);
			$cookImgPlace.css("display","block");
			$uploadCookImg.val(data.src);
		}
	});//ajax() end
});//change end
	
	
	const $stepImgPlace= $("#stepImgPlace");
	
	
	
	//********************************************************************** change() start -stepImg
	
	$("#cookingOrder").on("change",".stepImgOne", function() {
		//사이즈가 0인 즉 잘못된 파일 선택
		
		let dataNo = this.dataset.no;
		
		
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
		data.append("type","E");
		
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
				$(".sChange"+dataNo).attr("src","/cookStep/"+data.src);
				//$stepImgName.val(data.src);
				$(".sChange"+dataNo).css("display","block");
				$uploadStepImg.val(data.src);
			}
		});//ajax() end
		
	}) // change() end


</script>
</body>
</html>