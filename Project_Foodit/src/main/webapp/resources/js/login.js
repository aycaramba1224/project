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
});

