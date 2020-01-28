// submitPage(회원가입)
$(function(){
	/* 폼 유효성 체크 */
	// 입력 포커스를 잃었을 때 체크
	$("#mId").blur(function(){ 
		if( $("#mId").val() == "" ){
			$("#etId").text("필수 항목입니다.");
			$("#etId").attr("class", "warning");
			return false;
		} else {
			$("#etId").empty();
			$("#etId").remove("class");
		}
	});
	$("#mPw").blur(function(){
		if( $("#mPw").val() == "" ){
			$("#etPw").text("필수 항목입니다.");
			$("#etPw").attr("class", "warning");
			return false;
		} else {
			$("#etPw").empty();
			$("#etPW").remove("class");
		}
	});
	$("#mPwC").blur(function(){
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
	$("#mName").blur(function(){
		if( $("#mName").val() == "" ){
			$("#etName").text("필수 항목입니다.");
			$("#etName").attr("class", "warning");
			return false;
		} else {
			$("#etName").empty();
			$("#etName").remove("class");
		}
	});
	$("#mPhone").blur(function(){
		if( $("#mPhone").val() == "" ){
			$("#etPhone").text("필수 항목입니다.");
			$("#etPhone").attr("class", "warning");
			return false;
		} else {
			$("#etPhone").empty();
			$("#etPhone").remove("class");
		}
	});
	$("#mEmail").blur(function(){
		if( $("#mEmail").val() == "" ){
			$("#etEmail").text("필수 항목입니다.");
			$("#etEmail").attr("class", "warning");
			return false;
		} else {
			$("#etEmail").empty();
			$("#etEmail").remove("class");
		}
	});
	$("#mBirth").blur(function(){
		if( $("#mBirth").val() == "" ){
			$("#etBirth").text("필수 항목입니다.");
			$("#etBirth").attr("class", "warning");
			return false;
		} else {
			$("#etBirth").empty();
			$("#etBirth").remove("class");
		}
	});
	$("#mPost").blur(function(){
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
	$("#mRoad").blur(function(){
		if( $("#mRoad").val() == "" ){
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
		}
	});
	$("#mDetail").blur(function(){
		if( $("#mDetail").val() == "" ){
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
		}
	});
	$("#mExtra").blur(function(){
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
		
		// 아이디 체크
		if( $("#mId").val() == "" ){
			$("#mId").focus();
			$("#etId").text("필수 항목입니다.");
			$("#etId").attr("class", "warning");
			return false;
		} else {
			$("#etId").empty();
			$("#etId").remove("class");
		}
		// 비밀번호 체크
		if( $("#mPw").val() == "" ){
			$("#mPw").focus();
			$("#etPw").text("필수 항목입니다.");
			$("#etPw").attr("class", "warning");
			return false;
		} else {
			$("#etPw").empty();
			$("#etPw").remove("class");
		}
		// 비밀번호 재확인체크
		if( $("#mPwC").val() == "" ){
			$("#mPwC").focus();
			$("#etPwC").text("필수 항목입니다.");
			$("#etPwC").attr("class", "warning");
			return false;
		} else {
			$("#etPwC").empty();
			$("#etPwC").remove("class");
		}
		// 비밀번호 재확인 일치여부 체크
		if( $("#mPw").val() != $("#mPwC").val() ){
			$("#mPwC").focus();
			$("#etPwC").text("비밀번호가 일치하지 않습니다.");
			$("#etPwC").attr("class", "warning");
			return false;
		} else {
			$("#etPwC").empty();
			$("#etPwC").remove("class");
		}
		// 이름 체크
		if( $("#mName").val() == "" ){
			$("#mName").focus();
			$("#etName").text("필수 항목입니다.");
			$("#etName").attr("class", "warning");
			return false;
		} else {
			$("#etName").empty();
			$("#etName").remove("class");
		}
		// 연락처 체크
		if( $("#mPhone").val() == "" ){
			$("#mPhone").focus();
			$("#etPhone").text("필수 항목입니다.");
			$("#etPhone").attr("class", "warning");
			return false;
		} else {
			$("#etPhone").empty();
			$("#etPhone").remove("class");
		}
		// 이메일 체크
		if( $("#mEmail").val() == "" ){
			$("#mEmail").focus();
			$("#etEmail").text("필수 항목입니다.");
			$("#etEmail").attr("class", "warning");
			return false;
		} else {
			$("#etEmail").empty();
			$("#etEmail").remove("class");
		}
		// 생년월일 체크
		if( $("#mBirth").val() == "" ){
			$("#mBirth").focus();
			$("#etBirth").text("필수 항목입니다.");
			$("#etBirth").attr("class", "warning");
			return false;
		} else {
			$("#etBirth").empty();
			$("#etBirth").remove("class");
		}
		// 주소 체크
		if( $("#mPost").val() == "" ){
			$("#mPost").focus();
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			$("#postSearch").attr("class", "warAddr");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
			$("#postSearch").remove("class");
		}
		if( $("#mRoad").val() == "" ){
			$("#mRoad").focus();
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
		}
		if( $("#mDetail").val() == "" ){
			$("#mDetail").focus();
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
		}
		if( $("#mExtra").val() == "" ){
			$("#mExtra").focus();
			$("#etPost").text("필수 항목입니다.");
			$("#etPost").attr("class", "warning");
			return false;
		} else {
			$("#etPost").empty();
			$("#etPost").remove("class");
		}
		/* AJAX 통신 처리 */
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