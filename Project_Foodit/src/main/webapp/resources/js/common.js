$(function(){
	$("#profileImg").on('change',function(){
		var fileName = $("#profileImg").val();
		$(".upload-name1").val(fileName);
	});
	$("#thumnailImg").on('change',function(){
		var fileName = $("#thumnailImg").val();
		$(".upload-name2").val(fileName);
	});
	$("#thumnailImg2").on('change',function(){
		var fileName = $("#thumnailImg2").val();
		$(".upload-name3").val(fileName);
	});
});