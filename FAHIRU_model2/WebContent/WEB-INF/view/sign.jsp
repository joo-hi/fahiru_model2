<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="css/default.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/sign.css" />
</head>
<body>
<div id="bg"></div>
<div id="signFormWrap">
    <div id="signFormBox"></div>
    <form action="/join" method="post">
        <fieldset>
            <div id="signLogo"></div>
            <div class="sign email">
                <span>이메일 </span>
                <input class="input" id="email" name="email" placeholder="  e-mail을 입력해주세요.">
                <button class="email_overlap btn">중복확인</button>
                <div class="email_check msg"></div>
            </div>


            <div class="sign nickname">
                <span>닉네임 </span>
                <input class="input" id="nickname" name="nickname" placeholder="  nickname을 입력해주세요">
                <button class="nick_overlap btn">중복확인</button>
                <div class="nickname_check msg"></div>
            </div>

            <div class="sign gender">
                <span id="gender">성별 </span>
                <label><input type="radio" id="female" name="gender" value="F" checked>여자</label>
                <label><input type="radio" id="male" name="gender" value="M">남자</label>
            </div>

            <div class="sign">
                <span id="birthDate">생년월일 </span>
                <select name="year" id="year" class="birth_date">
                </select>
                <select name="month" id="month" class="birth_date">
                </select>
                <select name="date" id="date" class="birth_date">
                </select>
            </div>

            <div class="sign pwd">
                <span>비밀번호 </span>
                <input id="password" name="password" class="input" type="password" placeholder="  비밀번호를 입력해주세요.">
            </div>
            <div class="password msg"></div>
            <div class="sign pwd_check">
                <span>비밀번호 <br>확인 </span>
                <input id="pwdCheck" name="pwdCheck" class="input" type="password" placeholder="  비밀번호 확인">
                <div class="password_check msg"></div>
            </div>
            <button type="submit" class="join btn">가입하기</button>
<!--            <button class="cancel btn">취소</button>-->
        </fieldset>
    </form>
</div><!--//signFormWrap-->

<script src="js/jquery.js"></script>
<script src="js/moment-with-locales.js"></script>
<script>
 
    $("#year").change(makeDate);
    $("#month").change(makeDate);

    function makeMonth() {
        for(let i=1 ; i<13;i++){
            $("#month").append($("<option>").val(i).text(i));
        }
    }//makeMonth() end

    function makeYear() {
        let year = moment().year();
        for(let i=year ; i>year-100;i--){
            $("#year").append($("<option>").val(i).text(i));
        }
    }//makeMonth() end

    function makeDate() {
        let year = $("#year").val();
        let month = $("#month").val();
        let date = $("#date").val();

        let that = moment([year,month-1]);
        let lastDate = that.endOf("month").date();
        $("#date").empty();
        /*
        - 부모.empty() : 자식들 전부 비우기
        - 요소.remove() : 그 요소 지우기
         */
        for(let i=1 ; i<=lastDate;i++) {
            let $option = $("<option>").text(i).val(i).appendTo("#date");
            if(i==date){
                $option.attr("selected",true);
            }
        }
    }//makeMonth() end
    makeYear();
    makeMonth();
    makeDate();
    
    ///////////////////////////////// 유효성 검사 관련 변수 //////////////////////////////////////////////////

    // 이전에 기입한 이메일
    let oldEmail = null;
    let oldNickname = null;
    let oldPassword = null;
    
    let isValidEmail = false;
    let isValidNickname = false;
    let isValidPwd = false;
    let isValidPwCheck = false;
    
    const $signFormWrap = $("#signFormWrap");

    //아이디 유효성 검사
    const $email = $("#email");

    const $emailCheckMsg = $(".email_check");
    const $emailMsg = $(".email_check .msg");

    const emailExp1 = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{2,3}/;
    const emailExp2 = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]{2,3}/;

    // 닉네임 유효성 검사
    const $nickname = $("#nickname");

    const $nicknameCheckMsg = $(".nickname_check");
    const $nicknameMsg = $(".nickname_check .msg");

    const nicknameExp = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|\w]{2,20}$/;

 	// 패스워드 유효성 검사
    const $password = $("#password");
    const $pwdCheck = $("#pwdCheck");

    const $passwordCheckMsg = $(".password_check");

//     const passwordExp = /^[\w]{8,20}$/;
    const passwordExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,20}$/;


    ////////////////////////// 이메일 중복 체크와 유효성 검사 ///////////////////////////////////////
    
    function testEmail() {
    	
    	let value = $email.val();
    	
    	console.log(value);
    	
    	//이전 글자와 현재 글자가 같지 않을때만
   		if(oldEmail!=value) { 
   			
   			//현재 글자를 이전글자로 업데이트
	   		oldEmail = value;
   			
        	if(emailExp1.test(value)||emailExp2.test(value)) {
        
        		// 체크 다시 시작하므로 무조건 false
        		isValidEmail = false;
        		
        		$emailMsg.removeClass("ok").text("확인중....");
        		
    		   //application/x-www-form-urlencoded
    		   $.ajax({
    			   url:"/ajax/email/"+value,
    			   dataType:"json",
    			   data:{ "check": value },
    			   type:"get",
    			   error:function(xhr) {
    				   console.log(xhr.responseText);
    				  alert("서버 점검중!");
    			   },
    			   success:function(json) {
    				   
     				   // testEmail();
    				   
    				   if(json.result) {
    					   isValidEmail = true;
    					   $emailCheckMsg.text("사용 가능한 이메일입니다.").addClass("ok");
    				   }else {
    					   isValidEmail = false;
    					   $emailCheckMsg.text("이미 사용중인 이메일입니다.").removeClass("ok");
    				   }//if~else end
    				   
    			   }//success end
    		   });//$.ajax() end
      	
       	 } else {
        	$emailCheckMsg.removeClass("ok").text("이메일을 확인해 주세요.");
        } // if~else end
   	}//if end
 } //testEmail() end
    
    
    ////////////////////////// 닉네임 중복 체크 ////////////////////////////////////////////////////////////
 
    function testNickname() {
    	
    	let value = $nickname.val();
    	
    	//이전 글자와 현재 글자가 같지 않을때만
   		if(oldNickname!=value) { 
   			
   			//현재 글자를 이전글자로 업데이트
	   		oldNickname = value;
   			
        	if(nicknameExp.test(value)) {
        
        		// 체크 다시 시작하므로 무조건 false
        		isValidNickname = false;
        		
        		$nicknameMsg.removeClass("ok").text("확인중...");
        		
    		   //application/x-www-form-urlencoded
    		   $.ajax({
    			   url:"/ajax/nickname/"+value,
    			   dataType:"json",
    			   type:"get",
    			   error:function() {
    				   
    				  alert("서버 점검중!");
    				  
    			   },
    			   success:function(json) {
    				   
    				   if(json.result) {
    					   isValidNickname = true;
    					   $nicknameCheckMsg.addClass("ok").text("사용 가능한 닉네임입니다.");
    				   }else {
    					   isValidNickname = false;
    					   $nicknameCheckMsg.removeClass("ok").text("이미 사용중인 닉네임입니다.");
    				   }//if~else end
    				   
    			   }//success end
    		   });//$.ajax() end
      	
       	 } else {
        	$nicknameCheckMsg.removeClass("ok").text("닉네임은 두 글자 이상으로 입력해주세요!");
        } // if~else end
   	}//if end
 } //testNickname() end



 ///////////////////////// 비밀번호 유효성 체크 /////////////////////////////
 
    function testPw() {
	 
        let pw1 = $password.val();
        
        if(passwordExp.test(pw1)) {
            $passwordCheckMsg.addClass("ok").text("좋은 비밀번호네요.");
            isValidPwd = true;
        }else{
        	$passwordCheckMsg.removeClass("ok").text("영어, 숫자, 특수문자 포함 8자리 이상으로 입력해주세요.");
        	isValidPwd = false;
        }
    }
    
    function testPwCheck(){
        let pw1 = $password.val();
        let pw2 = $pwdCheck.val();
        
        if(passwordExp.test(pw2) && pw2.length!=0 && pw1==pw2){
        	$passwordCheckMsg.addClass("ok").text("비밀번호가 일치합니다.");
        	isValidPwCheck = true;
        }else{
        	 $passwordCheckMsg.removeClass("ok").text("영어, 숫자, 특수문자 포함 8자리 이상으로 입력해주세요.");
        	 isValidPwCheck = false;
        }

    }
    
	/////////////// 넘어가는 것 막기 ///////////////////////////////
	
    $signFormWrap.on("submit",function () {
    	
    	testEmail();
    	testNickname();
    	testPw();
    	testPwCheck();
    	
    	
         if(!isValidEmail||!isValidNickname||!isValidPwd||isValidPwdCheck) {
             return false;
         }
        
    });
 
    
//     $email.keyup(testEmail);
//     $nickname.keyup(testNickname);
    $password.keyup(testPw);
    $pwdCheck.keyup(testPwCheck);

</script>
</body>
</html>