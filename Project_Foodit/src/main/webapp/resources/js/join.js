// submitPage(회원가입)
$(function(){
	/* 정규식 */
	// 아이디 : 5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 가능
	var regExpId = RegExp(/^[0-9a-z]([-_]?[0-9a-z]){4,20}$/);
	// 비밀번호 : 8~20자 영문 대 소문자, 숫자, 특수문자를 사용
	var regExpPw = RegExp(/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,20}$/);
	// 이름 : 한글과 영문 대 소문자를 사용 (특수기호, 공백 사용 불가)
	var regExpName = RegExp(/^[가-힣a-zA-Z]{2,20}$/);
	// 휴대전화
	var regExpPhone = RegExp(/^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/);
	// 이메일
	var regExpEmail = RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
	/* 폼 유효성 체크 */
	// input 길이 제한
	$("input[type=text], input[type=password]").each(function(){
		$(this).attr("maxlength", "20");
	});
	
	// 입력을 한 후 체크
	$("#mId").keyup(function(){
		// 아이디 중복 체크
		if( $("#mId").val() == "" ){
			$("#etId").text("필수 항목입니다.");
			$("#etId").attr("class", "warning");
			return false;
		} else {
			/* AJAX 통신 처리 */
			$.ajax({
				url: "idCheck",
				type: "POST",
				dataType: "json",
				data: "mId=" + $("#mId").val(),
				success: function( obj ){
					//var obj = eval( jsonObj );
					if( regExpId.test($("#mId").val()) ){
						if( obj["result"] == "YES" ){
							$("#etId").text("이미 사용중이거나 탈퇴한 아이디입니다.");
							$("#etId").attr("class", "warning");
						} else {
							$("#etId").empty();
							$("#etId").remove("class");
							
						}
					} else {
						$("#etId").text("5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 가능합니다.");
						$("#etId").attr("class", "warning");
					}
				},
				error: function(){
					alert("실패!");
				}
			});
		}
	});
	$("#mPw").keyup(function(){
		if( $("#mPw").val() == "" ){
			$("#etPw").text("필수 항목입니다.");
			$("#etPw").attr("class", "warning");
			return false;
		} else {
			if( !regExpPw.test($("#mPw").val()) ){
				$("#etPw").text("8~20자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
				$("#etPw").attr("class", "warning");
				return false;
			} else {
				$("#etPw").empty();
				$("#etPw").remove("class");
			}
		}
	});
	$("#mPwC").keyup(function(){
		if( $("#mPwC").val() == "" ){
			$("#etPwC").text("필수 항목입니다.");
			$("#etPwC").attr("class", "warning");
			return false;
		} else {
			$("#etPwC").empty();
			$("#etPWC").remove("class");
		}
		if( $("#mPw").val() != $("#mPwC").val() ){
			$("#etPwC").text("비밀번호가 일치하지 않습니다.");
			$("#etPwC").attr("class", "warning");
			return false;
		} else {
			$("#etPwC").empty();
			$("#etPWC").remove("class");
		}
	});
	$("#mName").keyup(function(){
		if( $("#mName").val() == "" ){
			$("#etName").text("필수 항목입니다.");
			$("#etName").attr("class", "warning");
			return false;
		} else {
			if( !regExpName.test($("#mName").val()) ){
				$("#etName").text("한글과 영문 대 소문자를 사용하세요. (특수기호, 공백 사용 불가)");
				$("#etName").attr("class", "warning");
				return false;
			} else {
				$("#etName").empty();
				$("#etName").remove("class");
			}
		}
	});
	$("#mPhone").keyup(function(){
		if( $("#mPhone").val() == "" ){
			$("#etPhone").text("필수 항목입니다.");
			$("#etPhone").attr("class", "warning");
			return false;
		} else {
			if( !regExpPhone.test($("#mPhone").val()) ){
				$("#etPhone").text("휴대폰 번호를 다시 확인해주세요.");
				$("#etPhone").attr("class", "warning");
				return false;
			} else {
				$("#etPhone").empty();
				$("#etPhone").remove("class");
			}
		}
	});
	$("#mEmail").keyup(function(){
		if( $("#mEmail").val() == "" ){
			$("#etEmail").text("필수 항목입니다.");
			$("#etEmail").attr("class", "warning");
			return false;
		} else {
			if( !regExpEmail.test($("#mEmail").val()) ){
				$("#etEmail").text("이메일을 다시 확인해주세요.");
				$("#etEmail").attr("class", "warning");
				return false;
			} else {
				$("#etEmail").empty();
				$("#etEmail").remove("class");
			}
		}
	});
	$("#mBirth").keyup(function(){
		if( $("#mBirth").val() == "" ){
			$("#etBirth").text("필수 항목입니다.");
			$("#etBirth").attr("class", "warning");
			return false;
		} else {
			$("#etBirth").empty();
			$("#etBirth").remove("class");
		}
	});
	$("#mPost").keyup(function(){
		if( $("#mPost").val() == "" ){
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
			$("#postSearch").remove("class");
		}
	});
	$("#mRoad").keyup(function(){
		if( $("#mRoad").val() == "" ){
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
		}
	});
	$("#mDetail").keyup(function(){
		if( $("#mDetail").val() == "" ){
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
		}
	});
	$("#mExtra").keyup(function(){
		if( $("#mRoad").val() == "" ){
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
		}
	});

	
	$("#joinBtn").click(function(){ // 가입하기 버튼을 눌렀을 때.
	// 폼에 아무런 데이터를 입력하지 않고 넘겼을 시 data넘어가는 것을 방지.
		/* Refactoring 예정 */
		// 아이디 체크 
		if( $("#mId").val() == "" ){
			$("#mId").focus();
			$("#etId").text("필수 항목입니다.");
			$("#etId").attr("class", "warning");
			return false;
		} 
		// 비밀번호 체크
		if( $("#mPw").val() == "" ){
			$("#mPw").focus();
			$("#etPw").text("필수 항목입니다.");
			$("#etPw").attr("class", "warning");
			return false;
		} 
		// 비밀번호 재확인체크
		if( $("#mPwC").val() == "" ){
			$("#mPwC").focus();
			$("#etPwC").text("필수 항목입니다.");
			$("#etPwC").attr("class", "warning");
			return false;
		} 
		// 비밀번호 재확인 일치여부 체크
		if( $("#mPw").val() != $("#mPwC").val() ){
			$("#mPwC").focus();
			return false;
		} 
		// 이름 체크
		if( $("#mName").val() == "" ){
			$("#mName").focus();
			$("#etName").text("필수 항목입니다.");
			$("#etName").attr("class", "warning");
			return false;
		} 
		// 연락처 체크
		if( $("#mPhone").val() == "" ){
			$("#mPhone").focus();
			$("#etPhone").text("필수 항목입니다.");
			$("#etPhone").attr("class", "warning");
			return false;
		} 
		// 이메일 체크
		if( $("#mEmail").val() == "" ){
			$("#mEmail").focus();
			$("#etEmail").text("필수 항목입니다.");
			$("#etEmail").attr("class", "warning");
			return false;
		} 
		// 생년월일 체크
		if( $("#mBirth").val() == "" ){
			$("#mBirth").focus();
			$("#etBirth").text("필수 항목입니다.");
			$("#etBirth").attr("class", "warning");
			return false;
		} 
		// 주소 체크
		if( $("#mPost").val() == "" ){
			$("#mPost").focus();
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} 
		if( $("#mRoad").val() == "" ){
			$("#mRoad").focus();
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} 
		if( $("#mDetail").val() == "" ){
			$("#mDetail").focus();
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} 
		if( $("#mExtra").val() == "" ){
			$("#mExtra").focus();
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} 
		/* AJAX 통신 처리 */
		/* Refactoring 예정 */
		$.ajax({
			url: "join",
			type: "POST",
			dataType: "json",
			data: $("#f").serialize(),
			success: function( jsonObj ){
				var obj = eval( jsonObj );
				if (obj["result"] == "SUCCESS"){
					alert("회원가입이 성공했습니다.");
					location.href="index";
				} else {
					alert("회원가입이 실패했습니다.");
					history.back();
				}
			},
			error: function(){
				alert("실패!!");
			} 
		}); // end ajax
	});// end click
	
	/* 폼 css */
	$("span", "tbody").each(function(index){
		$(this).addClass("inputWrap");
		$(this).addClass("w" + index);
	});
	// 포커스 처리
	$("#mId").focus(function(){ 
		$(".w0").addClass("gang");
	});
	$("#mPw").focus(function(){
		$(".w1").addClass("gang");
	});
	$("#mPwC").focus(function(){
		$(".w2").addClass("gang");
	});
	$("#mName").focus(function(){
		$(".w3").addClass("gang");
	});
	$("#mPhone").focus(function(){
		$(".w4").addClass("gang");
	});
	$("#mEmail").focus(function(){
		$(".w5").addClass("gang");
	});
	$("#mBirth").focus(function(){
		$(".w6").addClass("gang");
	});
	$("#mPost").focus(function(){
		$(".w7").addClass("gang");
	});
	$("#mRoad").focus(function(){
		$(".w8").addClass("gang");
	});
	$("#mDetail").focus(function(){
		$(".w9").addClass("gang");
	});
	$("#mExtra").focus(function(){
		$(".w10").addClass("gang");
	});
	
	$("#mId").blur(function(){ 
		$(".w0").removeClass("gang");
	});
	$("#mPw").blur(function(){
		$(".w1").removeClass("gang");
	});
	$("#mPwC").blur(function(){
		$(".w2").removeClass("gang");
	});
	$("#mName").blur(function(){
		$(".w3").removeClass("gang");
	});
	$("#mPhone").blur(function(){
		$(".w4").removeClass("gang");
	});
	$("#mEmail").blur(function(){
		$(".w5").removeClass("gang");
	});
	$("#mBirth").blur(function(){
		$(".w6").removeClass("gang");
	});
	$("#mPost").blur(function(){
		$(".w7").removeClass("gang");
	});
	$("#mRoad").blur(function(){
		$(".w8").removeClass("gang");
	});
	$("#mDetail").blur(function(){
		$(".w9").removeClass("gang");
	});
	$("#mExtra").blur(function(){
		$(".w10").removeClass("gang");
	});
	
	/* bootstrap datepicker */
	$('#mBirth').datepicker({
		 format: "yyyy-mm-dd",
		 language: "kr",
		 daysOfWeekHighlighted: "0",
		 autoclose : true,
		 todayHighlight: true
	});
	
});

/* daum postcode API */
function postCodeSearch() {
	 new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("mExtra").value = extraAddr;
            
            } else {
                document.getElementById("mExtra").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('mPost').value = data.zonecode;
            document.getElementById("mRoad").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("mDetail").focus();
        }
    }).open();
}