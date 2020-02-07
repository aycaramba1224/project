<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
     
      <jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="비회원 주문/배송" name="title"/>
      </jsp:include>
      
    
<script>
 function guestSearch(){
	 if(f.content2.value==""){
		 alert("비회원주문번호를 입력해주세요");
		 return false;
	 }
	 if(f.content.value==""){
		 alert("비회원비밀번호를 입력해주세요");
		 return false;
	 }
	
	 f.action = "guestSearch";
	 f.submit();
 }
 
 
</script>

   <div>
    <h1>비회원 주문/배송조회</h1>
    <form method="post" name="f">
       
   
    <div>
    <input type="hidden" name="guestquery2" value="order_no"/>
    <input type="text" placeholder="주문번호를 입력해주세요" name="content2" />
    </div>
   
    <div>
    <input type="hidden" name="guestquery" value="guest_pw"/>
    <input type="password" placeholder="주문비밀번호를 입력해주세요" name="content" />
    </div>
      
     <input type="button" value="비회원주문/배송조회" onclick="guestSearch()"/>
     <input type="button" value="비회원 주문번호 찾기" onclick="location.href='guestnoSerachPage'" />
    </form>
    </div>
      
        <!-- 비회원 주문번 찾호,비밀번호 찾은 내용  -->
					 <br />
					 <c:choose>
					  <c:when test="${orderBaseDto ne null }">
    			<div>
             <p>정보를 확인하시고 잘 작성해주세요</p>
            <br />
						<div>주문번호:
							${orderBaseDto.order_no }
						</div>
					  
					 <div>
					주문비밀번호:
					 ${orderBaseDto.guest_pw }
					 </div>
					 
				</div>
          </c:when>
          </c:choose>
     
       <%@ include file="/WEB-INF/views/common/footer.jsp" %>