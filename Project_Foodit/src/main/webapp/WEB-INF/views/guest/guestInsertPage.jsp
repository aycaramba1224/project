<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비회원 로그인 </title>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	function goGuest(f) {
    var re = /^[a-zA-Z0-9]{8,16}$/;
    var regExp = /^[0-9]+$/;
  
     if(!regExp.exec(f.guest_no.value == "")){
	   alert("비회원 주문번호는 숫자0~9자리 입력해주세요!");
	   f.guest_no.focus();
	   return;
     }
  
    if ( !re.exec(f.guest_pw.value=="")) {
        alert("비회원비밀번호 영문 대소문자와 숫자 8~16자리로 입력해야합니다!");
       f.guest_pw.focus();
        return;
    }
    
    
    if ( f.guest_name.value=="") {
        alert("비회원 이름을 입력해주세요 필수항목입니다.!");
         f.guest_name.focus();
        return;
    }
    

    if (f.guest_phone.value=="") {
        alert("비회원폰번호를 입력해주세요 필수항목입니다.!");
        f.guest_phone.focus();
        return ;
    }
    
    $(function(){
        var guest_no = getCookie("Cookie_guest_no");
        $("#guest_no").val(guest_no);
    }
    function guestProcess(){
        var guest_no = document.getElementById('guest_no');
        var guest_pw = document.getElementById('guest_pw');
        var myForm = document.getElementById('myForm');
        
        if(guest_no.value==""){
            alert("Enter 주문자정보");
            guest_no.focus();
            return;
        }else if(guest_pw.value==""){
            alert("Enter 주문자password");
            guest_pw.focus();
            return;
        }else {
            var guest_no = $("#guest_no").val();
            setCookie("Cookie_guest_no", guest_no, 7);
            myForm.submit();
        }
    }

	}
    
  
   
	
	
	//휴대폰 번호 입력시 저절로 -들어가는 script
	function inputPhoneNumber(obj) {
	    var number = obj.value.replace(/[^0-9]/g, "");
	    var phone = "";
	    if(number.length < 4) {
	        return number;
	    } else if(number.length < 7) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3);
	    } else if(number.length < 11) {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 3);
	        phone += "-";
	        phone += number.substr(6);
	    } else {
	        phone += number.substr(0, 3);
	        phone += "-";
	        phone += number.substr(3, 4);
	        phone += "-";
	        phone += number.substr(7);
	    }
	    obj.value = phone;
	}
	
	
	</script>
</head>
<body> 
<h1>비회원 주문페이지</h1>
 <form  method="POST" id ="myForm"name="myForm" action="guestInsert" >
		<table border="1">
			<tbody>
				<tr>
					<td>비회원주문번호</td>
					<td><input type="text" name="guest_no" id="guest_no" placeholder="※10자이상 숫자"/>
					
					</td>
				</tr>
					
					<tr>
						<td>비회원주문비밀번호</td>
				<td><input type="text" name="guest_pw"  id ="guest_pw" placeholder="※8-16자 소문자+숫자" 
								onKeyDown="if(event.keyCode==13)guestProcess()"/></td>
								<!-- Enter 누름과 동시에 cookie자동저장 -->
					</tr>
					
					<tr>
						<td>비회원이름</td>
						<td><input type="text" name="guest_name"  /></td>
					</tr>
					
					<tr>
						<td>비회원연락처</td>
				<td><input type="text" name="guest_phone" onKeyup="inputPhoneNumber();" 
					maxlength="13" style="text-align:center;" /></td>
					    </tr>
			
            <tr>
			<td colspan="4">
	     <input type="button"value="주문하기" onclick="goGuest(this.form)"/>
	     
	    <!-- 관리자페이지 -->
	     <input type="button"value="비회원주문 정보보기" onclick="location.href='guestList'" />
			</td>
			</tr>
			</tbody>
	</table>
	</form>

</body>
</html>