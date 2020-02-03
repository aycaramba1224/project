$(function(){
	// 탭 선택에 따른 내용 표시
	$('label[for="loginMenu01"]').click(function(){
		$("#loginM").css("display","block");
		$("#loginNm").css("display","none");
	});
	$('label[for="loginMenu02"]').click(function(){
		$("#loginM").css("display","none");
		$("#loginNm").css("display","block");
	});
	// 회원 / 비회원별 로그인 처리
	// 회원
	$("#loginM .loginBtn").click(function(){
		if($("#mId").val() == ""){
			alert("아이디를 입력해주세요.");
			$("#mId").focus();
			return false;
		}
		if($("#mPw").val() == ""){
			alert("비밀번호를 입력해주세요.");
			$("#mPw").focus();
			return false;
		}
		$("#ml").attr("action", "memLogin").submit();
	});
	// 비회원
	$("#loginNm .loginBtn").click(function(){
		if($("#gNo").val() == ""){
			alert("주문번호를 입력해주세요.");
			$("#gNo").focus();
			return false;
		}
		if($("#gPw").val() == ""){
			alert("주문 비밀번호를 입력해주세요.");
			$("#gPw").focus();
			return false;
		}
		$("#nl").attr("action", "guestOderListview").submit();
	});
	$("input:text[numberOnly]").on("keyup", function() { // input 영역 숫자만 입력 가능하게 
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});


});
