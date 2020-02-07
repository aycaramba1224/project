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
   table {
    border-collapse: collapse;
    margin:auto;
    border-top: 1px solid #444444;
    width:500px;
    text-align:center;
    border-radius:50px;
    font-size: 20px;
    text-decoration: none;
   }
   .td1 {
  background-color:lightgray;
  color:black;
   
   }
   td {
   border-bottom: 1px solid #444444;
    padding: 10px;
   font-size:12px;
   border-bottom: 1px solid #444444;
 }
     .click-td1  a{
      text-decoration: none;
      }
    .click-td1:hover{
     background: darkgray;
		color: white;
    }
    a:hover {
		color: white;
	   }

</style>
</head>
<body>
		<form method="post"  name="f">
	       <h1>주문자 정보</h1>
       <p>주무번호을 클릭하세요.자세한정보 확인이 가능합니다.</p>
       <hr />
			<table border="1">
			<c:if test="${ guest_noListSize ne 0 }">
			<c:if test="${ guestListSize ne 0 }">
			<c:forEach var="OrderBaseDto" items="${guestList}">
			<c:forEach var="OrderBaseDto" items="${guest_noList}">
			<tr>
			<td class="td1">
			비회원 주문번호
			</td>
			<td class="click-td1">
	  <a href="guestOderListview?order_no=${OrderBaseDto.order_no}">${OrderBaseDto.order_no}</a>
			</td>
			</tr>
			
			<tr>
			<td class="td1">
			비회원 비밀번호
			</td>
			<td>
			   ${OrderBaseDto.guest_pw}
			</td>
			</tr>
					</tbody>
			</c:forEach>
			</c:forEach>
			</c:if>
			</c:if>
			
			<c:if test="${ guest_noListSize eq 0 }">
			<c:if test="${guestListSize eq 0 }">
		
			<tr>
				<td colspan="5">저장된 주문정보가 없습니다.</td>
			</tr>
		
				</c:if>
		</c:if>	
		
 </table>
 </form>
 
      <form>
            
			<c:forEach var="OrderBaseDto" items="${guestOrderList}">
             <h1>주문시 이름</h1>
     			<p>이름을 클릭하세요.자세한정보 확인이 가능합니다.</p>
			   <div> <a href="guestnameview?order_name=${OrderBaseDto.order_name}">
			    {OrderBaseDto.order_name }</a></div>
			</c:forEach>
			
			
 	     <c:if test="${ guestOrderListSize eq 0 }">
 	                    정보없음
			</c:if>
	</form>
          
          
         
   
     