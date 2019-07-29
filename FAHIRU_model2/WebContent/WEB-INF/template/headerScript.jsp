<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	const $loginUser = $(".login_user")
	const $sideBar = $("#sideBar");
	const $addFah = $(".add_fah")

	$loginUser.on("click", function() {

		userNo = this.dataset.userno;
		getSubscribeList();
		$sideBar.css("transform", "translate(0px)").css("transition",
				"linear .3s ");
	})

	$("#content, #header").on("click",function() {
				$sideBar.css("transform", "translate(300px)").css("transition",	"linear .2s ");
	})

	$addFah.click(function() {
		$("#bg").show()
		$("#fahplus").show()
	});

	$("#bg, .cancel").click(function() {
		$("#bg").hide()
		// = $(this).hide()
		$("#fahplus").hide()
	});

	function getSubscribeList() {

		$.ajax({
			url : "/ajax/SubscribeList.json",
			dataType : "json",
			type : "get",
			data : {
				userNo : userNo
			},
			error : function() {
				alert("점검중!");
			},
			success : function(json) {
				$("#subscribeList").append(subscribeMoreTmp({
					"subList" : json
				}));
			}//success end
		});//ajax end

	}//getSubscribeList() end
</script>