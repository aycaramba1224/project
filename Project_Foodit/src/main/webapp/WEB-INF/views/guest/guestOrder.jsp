<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
  
   <jsp:include page="/WEB-INF/views/common/header.jsp" >
	    <jsp:param value="바회원 주문배송/조회 중간 결과페이지" name="title"/>
      </jsp:include>
<style type="text/css">
*{
   margin:0;
   padding:0;
   }
    h1,p{
    text-align: center;
    margin-bottom: 20px;
    }
   
  
    

</style>
</head>
<body>
		<form method="post"  name="f">
        
	       <h1>주문자 정보</h1>
      <c:choose>
         <c:when test="${gDto ne null }" >
        <div>
                주문번호: ${gDto.order_no }
        </div>
        
        <div>
                비밀번호:${gDto.guest_pw }
            
         </div>
         <div>주문자이름: ${gDto.order_name } </div>
		<div>주문자 휴대폰:${gDto.order_phone }-
						${gDto.order_phone2 }-
						${gDto.order_phone3 }</div>
	    <div>주문자 이메일:${gDto.order_email } @ ${gDto.order_email2}</div>
        
         <h1>배송정보</h1>
         
         
         <div>이름:${gDto.delivery_name}</div>
	     <div>휴대폰번호:${gDto.delivery_phone}-
	     	 ${gDto.delivery_phone2}-
	    	 ${gDto.delivery_phone3}
	     </div>
	     
		<div>
		   우편번호:${gDto.order_post}
		
		</div>
		
		<div>
		주소: ${gDto.order_road1}
		</div>
		
		<div>
		 주문날짜: ${gDto.orderDate }
	    </div>
         
		</c:when>
         </c:choose>
         <br />
         
         <c:if test="${gDto eq null }" >
           <script>
               alert("해당정보와 일치하는 정보가 없습니다.");
               location.href="sbmr";
           </script>
         </c:if>
         
 </form>
 