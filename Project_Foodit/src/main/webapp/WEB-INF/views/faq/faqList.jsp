<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" >
    <jsp:param value="고객행복센터" name="title"/>
</jsp:include>



<script type="text/javascript">
var isFaqModify = "${isFaqModify}";
if(isFaqModify == "yes"){
    var faqModifyRes = "${faqModifyRes}";
    if(faqModifyRes == 0){
        alert("게시글 수정이 실패하였습니다.");
    } else {
        alert("게시글 수정이 성공하였습니다.");
    }
} 
var isFaqWrite = "${isFaqWrite}";
if(isFaqWrite == "yes"){
    var faqWriteRes = "${faqWriteRes}";
    if(faqWriteRes == 0){
        alert("게시글 등록이 실패하였습니다.");
    } else {
        alert("게시글 등록이 성공하였습니다.");
    }
} 
var isFaqDelete = "${isFaqDelete}";
if(isFaqDelete == "yes"){
    var faqDeleteRes ="${faqDeleteRes}";
    if(faqDeleteRes == 0 ){
        alert("게시글 삭제가 실패하였습니다.");
    } else {
        alert("게시글 삭제가 성공하였습니다.");   
    }
}  
function fn_faqSearch(f) {
	if(f.content.value==""){
		alert("검색어를 입력해 주세요.");
		return;
	}				
	f.action = "faqSearchResult"; 
	f.submit();
}


</script>
<div id="faqWrap">
	<h1>고객행복센터</h1>
		<div class="tabWrap">
			<ul class="tabs">
				<li class="on">
					<a href="faqList"><span>FAQ</span></a>
				</li>
				<li>
					<a href="noticeList"><span>공지사항</span></a>
				</li>
			</ul> 
		</div>  
	<div class="faqConts">
		<div class="faqSearch">	
			<h2 class="tit">FAQ 검색</h2>
			<div class="boxSearch">
				<div class="schWrap">
					<div class="formInputWrap">
						<form method="post">
							<input type="text" class="txt" name="content" value="${ content }" placeholder="검색어를 입력해주세요."/>
							<button type="button" class="ico">
								<span class="hide">입력 삭제</span>
							</button>
							<button type="button" class="srchBtn" value="검색" onclick="fn_faqSearch(this.form)">
								<span class="hide">검색</span>
							</button>
						</form>  
					</div>
				</div>
			</div>
		</div>
		<div class="faqType">
			<h2 class="tit">문의유형</h2>
			<div class="fTWrap">
		        <ul>
		          <li class="tabItem">
		          	<p class="tab" id="faqList">
		          		<span>전체</span>
		          	</p>
		          </li>
		          <li class="tabItem">
		          	<p class="tab" id="delievery">
		          		<span>배송</span>
		          	</p>
		          </li>
		          <li class="tabItem">
		          	<p class="tab" id="payment"> 
		          		<span>결제/영수증</span>
		          	</p>
		          </li>
		          <li class="tabItem">
		          	<p class="tab" id="order">
		          		<span>주문</span>
		          	</p>
		          </li>
		          <li class="tabItem">
		          	<p class="tab" id="ret"> 
		          		<span>취소/반품</span>
		          	</p>
		          </li>
		          <li class="tabItem">
		          	<p class="tab" id="member">
		          		<span>회원</span>
		          	</p>
		          </li>
		          <li class="tabItem">
		          	<p class="tab" id="etc">  
		          		<span>기타</span>
		          	</p>
		          </li>
		        </ul>
	        </div>
	 	</div>
	 	<div class="faqTabView">
		 	<div class="faqView">
			 	<p class="faqResultTxt">
					<span class="faqQuery">${ content }</span>
					검색결과 총 ${ faqListCount }개
				</p>
			 	<div class="faqViewList">
			 		<ul class="faqViewArea">
			 		<c:if test="${ faqListCount ne 0 }">
			 			<c:forEach var="faqDto" items="${ faqList }" >	
			 			<li>
			 				<div class="fqHead">
			 					<a href="#" onclick="return false;">
			 						<div class="qTit">
			 							<strong>Q</strong>
			 							${ faqDto.faq_title }
			 							<span class="cate">${ faqDto.faq_category }</span>

			 						</div>
			 					</a>
			 				</div>
			 				<div class="fqBottom" style="display:none">
								<strong>A</strong>
								<p class="fqCont">${ faqDto.faq_content }</p>			 				
			 				</div>
			 			</li>
			 			</c:forEach> 
					</c:if>
			 		</ul>
		 		</div>
	 		</div>
	 	</div>
	</div>    
	<%-- 관리자 권한에 따른 글 수정 권한 --%>
	<%-- 관리자 페이지로 빼세요! --%>
	<c:if test="${mDto.role == 'admin' }">
		<button type="button" onclick="location.href='faqWritePage'">
			FAQ등록
		</button>
	</c:if>	
	<%-- 페이징 처리 예정--%>
	<div class="pageNavi">
		<%-- 여기에 작업 --%>	
	</div>
</div>

<script type="text/javascript" src="resources/js/faq.js"></script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
                       
