$(function(){	
	// 전체 선택 체크 박스 
	$("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	  $(".chBox").prop("checked", true);
	 } else {
	  $(".chBox").prop("checked", false);
	 }
	});
	// 개별 선택 체크 박스 해제 시 
	$(".chBox").click(function(){
		$("#allCheck").prop("checked", false);
	});
	
});