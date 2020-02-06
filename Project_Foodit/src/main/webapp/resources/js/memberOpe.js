$(function(){
	/* memModiPage */
	// 개인정보변경 하기 전 회원의 정보확인을 위한 비밀번호 체크
	$(".reqForm #reqPw").click(function(){
		if($("#rPw").val() == ""){
			$("#rPw").focus();
			return false;
		}
		$("#rqF").attr("action", "memModiPw").submit();
	});
	
	/* memModi */
	// 개인정보변경 데이터 유효성 검사 및 변경 데이터 전달
	var regExpPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$/);
	var regExpPhone = RegExp(/^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/);
	var regExpEmail = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
	$("input[type=text], input[type=password]").each(function(){
		$(this).attr("maxlength", "20");
	});
	$("#moPw").keyup(function(){
		if( $("#moPw").val() == "" ){
			$("#eotPw").text("필수 항목입니다.");
			$("#eotPw").attr("class", "warning");
			return false;
		} else {
			if( !regExpPw.test($("#moPw").val()) ){
				$("#eotPw").text("8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
				$("#eotPw").attr("class", "warning");
				return false;
			} else {
				$("#eotPw").empty();
				$("#eotPw").remove("class");
			}
		}
	});
	$("#moPwC").keyup(function(){
		if( $("#moPwC").val() == "" ){
			$("#eotPwC").text("필수 항목입니다.");
			$("#eotPwC").attr("class", "warning");
			return false;
		} else {
			$("#eotPwC").empty();
			$("#eotPWC").remove("class");
		}
		if( $("#moPw").val() != $("#moPwC").val() ){
			$("#eotPwC").text("비밀번호가 일치하지 않습니다.");
			$("#eotPwC").attr("class", "warning");
			return false;
		} else {
			$("#eotPwC").empty();
			$("#eotPWC").remove("class");
		}
	});
	$("#moPhone").keyup(function(){
		if( $("#moPhone").val() == "" ){
			$("#eotPhone").text("필수 항목입니다.");
			$("#eotPhone").attr("class", "warning");
			return false;
		} else {
			if( !regExpPhone.test($("#moPhone").val()) ){
				$("#eotPhone").text("휴대폰 번호를 다시 확인해주세요.");
				$("#eotPhone").attr("class", "warning");
				return false;
			} else {
				$("#eotPhone").empty();
				$("#eotPhone").remove("class");
			}
		}
	});
	$("#moEmail").keyup(function(){
		if( $("#moEmail").val() == "" ){
			$("#eotEmail").text("필수 항목입니다.");
			$("#eotEmail").attr("class", "warning");
			return false;
		} else {
			if( !regExpEmail.test($("#moEmail").val()) ){
				$("#eotEmail").text("이메일을 다시 확인해주세요.");
				$("#eotEmail").attr("class", "warning");
				return false;
			} else {
				$("#eotEmail").empty();
				$("#eotEmail").remove("class");
			}
		}
	});
	$("#moBirth").blur(function(){
		if( $("#moBirth").val() == "" ){
			$("#eotBirth").text("필수 항목입니다.");
			$("#eotBirth").attr("class", "warning");
			return false;
		} else {
			$("#eotBirth").empty();
			$("#eotBirth").remove("class");
		}
	});
	
	$("#modiBtn").click(function(){ 
			// 비밀번호 체크
			if( $("#moPw").val() == "" ){
				$("#moPw").focus();
				$("#eotPw").text("필수 항목입니다.");
				$("#eotPw").attr("class", "warning");
				alert("비밀번호를 새로 변경해주세요.");
				return false;
			} 
			// 비밀번호 재확인체크
			if( $("#moPwC").val() == "" ){
				$("#moPwC").focus();
				$("#eotPwC").text("필수 항목입니다.");
				$("#eotPwC").attr("class", "warning");
				alert("비밀번호를 재확인해주세요.");
				return false;
			} 
			// 비밀번호 재확인 일치여부 체크
			if( $("#moPw").val() != $("#moPwC").val() ){
				$("#moPwC").focus();
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			} 
			// 이름 체크
			if( $("#moName").val() == "" ){
				$("#moName").focus();
				$("#eotName").text("필수 항목입니다.");
				$("#eotName").attr("class", "warning");
				return false;
			} 
			// 연락처 체크
			if( $("#moPhone").val() == "" ){
				$("#moPhone").focus();
				$("#eotPhone").text("필수 항목입니다.");
				$("#eotPhone").attr("class", "warning");
				return false;
			} 
			// 이메일 체크
			if( $("#moEmail").val() == "" ){
				$("#moEmail").focus();
				$("#eotEmail").text("필수 항목입니다.");
				$("#eotEmail").attr("class", "warning");
				return false;
			} 
			// 생년월일 체크
			if( $("#moBirth").val() == "" ){
				$("#moBirth").focus();
				$("#eotBirth").text("필수 항목입니다.");
				$("#eotBirth").attr("class", "warning");
				return false;
			} 
			/* AJAX 통신 처리 */
			$.ajax({
				url: "memModi",
				type: "POST",
				dataType: "json",
				data: $("#mf").serialize(),
				success: function( obj ){
					if (obj["result"] == "SUCCESS"){
						alert("개인정보 변경이 성공했습니다.");
						location.href="index";
					} else {
						alert("개인정보 변경이 실패했습니다.");
						history.back();
					}
				},
				error: function(){
					alert("실패!!");
				} 
			}); // end ajax
	});// end click
	$("span", "tbody").each(function(){
		$(this).addClass("inputWrap");
	});
	/* bootstrap datepicker */
	$('#moBirth').datepicker({
		 format: "yyyy-mm-dd",
		 language: "kr",
		 daysOfWeekHighlighted: "0",
		 autoclose : true,
		 todayHighlight: true
	});
	$("#btnPw").click(function(){
		$(".hide").toggleClass("show");
	});
	$("#delBtnSend").click(function(){ 
		if( confirm("정말 탈퇴하시겠습니까?") ){
			/* AJAX 통신 처리 */
			$.ajax({
				url: "memDel",
				type: "POST",
				dataType: "json",
				data: $("#df").serialize(),
				success: function( obj ){
					if (obj["result"] == "SUCCESS"){
						alert("정상적으로 탈퇴처리되었습니다. 이용해주셔서 감사합니다.");
						location.href="index";
					} else {
						alert("탈퇴가 처리되지 않았습니다. 관리자에게 문의해주세요.");
						history.back();
					}
				},
				error: function(){
					alert("실패!!");
				} 
			});// end ajax
		} else {
			return false;
		}
		
	}); // end click
	
});