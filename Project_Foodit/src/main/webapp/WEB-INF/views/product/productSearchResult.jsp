<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메뉴 찾기</title>
</head>
<body>

	<div id="wrap">
		<form action="productSearchResult" method="POST">
			<input type="hidden" name="query" value="pro_name"/>			
			<input type="text" name="content" placeholder="메뉴를 검색해 주세요."/>
			<input type="submit" value="검색">
		</form>	 
	</div> 

</body>
</html>