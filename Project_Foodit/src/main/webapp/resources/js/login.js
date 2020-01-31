// join의 성공/실패
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
});
function mLogin( ml ){
	ml.action = "sendM";
	ml.submit();
}