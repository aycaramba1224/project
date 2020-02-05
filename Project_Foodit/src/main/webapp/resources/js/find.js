$(function(){
	$(".findFormWrap #findId").click(function(){
		if($("#fiNm").val() == ""){
			$("#fiNm").focus();
			return false;
		}
		if($("#fiBi").val() == ""){
			$("#fiBi").focus();
			return false;
		}
		if($("#fiPn").val() == ""){
			$("#fiPn").focus();
			return false;
		}
		$("#fi").attr("action", "findId").submit();
	});
	$(".findFormWrap #findPw").click(function(){
		if($("#fpId").val() == ""){
			$("#fpId").focus();
			return false;
		}
		if($("#fpBi").val() == ""){
			$("#fpBi").focus();
			return false;
		}
		if($("#fpPn").val() == ""){
			$("#fpPn").focus();
			return false;
		}
		$("#fw").attr("action", "findPw").submit();
	});
	$("input:text[numberOnly]").on("keyup", function() { // input 영역 숫자만 입력 가능하게 
	    $(this).val($(this).val().replace(/[^0-9]/g,""));
	});
});