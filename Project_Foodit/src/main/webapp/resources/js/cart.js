$(function(){
	// 체크박스 전체 선택 및 전체 해제
	$("#allCheck").click(function(){
		var chk = $("#allCheck").prop("checked");
		if(chk) {
		 	$(".chBox").prop("checked", true);
		} else {
		 	$(".chBox").prop("checked", false);
		}
	});
	
	// 개별 체크 박스
	$(".chBox").click(function(){
		$("#allCheck").prop("checked", false);
	});		
	
	
}); 