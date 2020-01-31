<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 찾기</title>
<script type="text/javascript">
	function searchMenu(f){
		if(f.content.value==""){
			alert("검색어를 입력해 주세요.");
		}		
		f.action ="productSearchResult";
		f.submit();
	}

</script>
</head>
<body>

	<div id="wrap">
		메뉴찾기
		
		<div id="검색박스">
			<form method="POST">
				<input type="hidden" name="query" value="product_name"/>			
				<input type="text" name="content" placeholder="메뉴를 검색해 주세요."/>
				<input type="button" value="검색" onclick="searchMenu(this.form)"> <!-- 돋보기 아이콘으로 대체 예정  -->
				
				<br/>			
				<span>FOODIT의 모든 메뉴를 쉽고 빠르게 찾아볼 수 있습니다.</span>
			</form>	 
		</div>
	 
		
		
		
		
		
		
				
	</div> 
	
</body>
</html>