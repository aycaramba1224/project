<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비회원 로그인 페이지</title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	
	
	function guestInsert( f ){
    //var re = /^[a-zA-Z0-9]{8,16}$/ // 
     if(f.guest_no.value==""){
	   alert("비회원 주문번호는 숫자10자리 이상입력해주세요!");
	   f.guest_no.focus();
	   return;
     }
    
    if ( f.guest_pw.value=="") {
        alert("비회원비밀번호 영문 대소문자와 숫자 8~16자리로 입력해야합니다!");
       f.guest_pw.focus();
        return;
    }
		
		f.action = "guestInsert";
		f.submit();
	}
	
	
	   
	</script>
</head>
<body> 
<h1>비회원 주문페이지</h1>
     <form  method="POST">
		<table border="1">
			<tbody>
				<tr>
					<td>비회원주문번호</td>
					<td><input type="text" name="guest_no" id="guest_no" placeholder="※10자이상 숫자"/>
					
					</td>
				</tr>
					
					<tr>
						<td>비회원주문비밀번호</td>
						<td><input type="text" name="guest_pw"  id ="guest_pw" placeholder="※8-16자 소문자+숫자" /></td>
					</tr>
					
					<tr>
						<td>비회원이름</td>
						<td><input type="text" name="guest_name"  /></td>
					</tr>
					
					<tr>
						<td>비회원연락처</td>
					     <td><input type="text" name="guest_phone" /> </td>
				    </tr>
			
            <tr>
			<td colspan="4">
	     <input type="button"value="보내기" onclick="guestInsert(this.form)" />
			</td>
			</tr>
			</tbody>
	</table>
	</form>

</body>
</html>