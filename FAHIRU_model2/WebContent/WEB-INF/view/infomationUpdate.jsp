<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보 변경</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="/css/informationUpdate.css" />
</head>
<body>
	<div id="bg"></div>
	<div id="personalInfoWrap">
		<div id="personalInfoForm">
			<form action="/information/${no}" method="post">
				<fieldset>
					<h3>개인정보수정</h3>
					<div>
						<h4>닉네임</h4>
						<input id="nickname" class="input" name="nickname"
							value="${user.nickname }">
						<button class="personal_btn personal_btn_check" type="button">중복체크</button>
						<div class="nickname_check msg"></div>
					</div>
					<div>
						<h4>이메일</h4>
						<input class="input" name="email" value="${user.email }" readonly>
					</div>
					<div>
						<h4>성별</h4>
						<label><input  type="radio" name="gender"
							${user.gender=="M"?"checked":"" }> 남자</label> <label><input
							type="radio" name="gender" ${user.gender=="F"?"checked":"" } disabled >
							여자</label>
					</div>
					<div>
						<h4>생년월일</h4>
						<fmt:formatDate value="${user.birthDate }" pattern="YYYY"
							var="year" />
						<fmt:formatDate value="${user.birthDate }" pattern="M"
							var="month" />
						<fmt:formatDate value="${user.birthDate }" pattern="dd" var="date" />
						
						<select id="year" name="year">
						<c:forEach varStatus="status" begin="1" end="100">
						<option value="${2020-status.index }" <c:if test="${year==2020-status.index }">selected</c:if>>${2020-status.index }</option>
						</c:forEach>
						</select><em>년</em> 
						
						<select id="month" name="month">
						<c:forEach varStatus="status" begin="1" end="12">
						<option value="${status.index }" <c:if test="${month==status.index }">selected</c:if>>${status.index }</option>
						</c:forEach>
						</select>
						<em>월</em> 
						
						<select id="date" name="date">
						<option value="${date }"  <c:if test="${date }">selected </c:if> > ${date } </option></select>
						<em>일</em>
					</div>
					<div>
						<button class="personal_btn update personal_btn_update">정보수정</button>
						<button class="personal_btn personal_btn_cancle">취소</button>
						<input type="hidden" name="_method" value="PUT" />
					</div>
				</fieldset>
			</form>
			<button class="far fa-window-close close personl_btn_close"></button>
		</div>
		<!--//personalInfoForm-->
	</div>
	<!--//personalInfoWrap-->

	<script src="/js/jquery.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script>
		$("#year").change(makeDate);
		$("#month").change(makeDate);

		function makeMonth() {
			for (let i = 1; i < 13; i++) {
				$("#month").append($("<option>").text(i));
			}
		}//makeMonth() end
		
// 		function makeYear() {
// 			let year = moment().year();
// 			for (let i = year; i > year - 100; i--) {
				
// 				$("#year").append($("<option>").text(i));
				
// 			}
// 		}//makeMonth() end

		function makeDate() {
			let year = $("#year").val();
			let month = $("#month").val();
			let date = $("#date").val();

			let that = moment([ year, month - 1 ]);
			let lastDate = that.endOf("month").date();
			$("#date").empty();

			for (let i = 1; i <= lastDate; i++) {
				let $option = $("<option>").text(i).appendTo("#date");
				if (i == date) {
					$option.attr("selected", true);
				}
			}
		}//makeMonth() end
		makeMonth();
		makeDate();

		let oldNickname = null;
		let isValidNickname = false;

		const $nickname = $("#nickname");
		const $nicknameCheckMsg = $(".nickname_check");
		const nicknameExp = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|0-9|\w]{1,10}$/;

		$(".personal_btn_check").on(
				"click",
				function() {
					let value = $nickname.val();

					//이전 글자와 현재 글자가 같지 않을때만
					if (oldNickname != value) {

						//현재 글자를 이전글자로 업데이트
						oldNickname = value;

						if (nicknameExp.test(value)) {

							// 체크 다시 시작하므로 무조건 false
							isValidNickname = false;

							//application/x-www-form-urlencoded
							console.log(value);
							$.ajax({
								url : "/ajax/information/nickname/" + value,
								dataType : "json",
								type : "GET",
								error : function() {
									alert("서버 점검중!");
								},
								success : function(json) {
									console.log(json);
									if (json == 0) {
										isValidNickname = true;
										$nicknameCheckMsg.addClass("ok").text(
												"사용 가능한 닉네임입니다.");
									} else {
										isValidNickname = false;
										$nicknameCheckMsg.removeClass("ok")
												.text("이미 사용중인 닉네임입니다.");
									}//if~else end

								}//success end
							});//$.ajax() end

						} else {
							$nicknameCheckMsg.removeClass("ok").text(
									"닉네임은 두 글자 이상으로 입력해주세요!");
						} // if~else end
					}//if end
				});//emailOverlap end
	</script>
</body>
</html>