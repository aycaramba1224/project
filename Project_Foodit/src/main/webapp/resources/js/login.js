// join의 성공/실패
var isJoin = "${isJoin}";
if( isJoin == "yes" ){
	var joinResult = "${joinResult}";
	if( joinResult == 0 ){
		alert("회원가입이 실패했습니다.");
	} else {
		alert("회원가입이 성공했습니다.");
	}
}