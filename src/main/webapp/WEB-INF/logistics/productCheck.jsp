<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>productList.jsp</title>
  <jsp:include page="/include/bs4.jsp"></jsp:include>
  <script>
	  'use strict';
	  function searchCheck() {
	  	let searchString = $("#searchString").val();
	  	
	  	if(searchString.trim() == "") {
	  		alert("찾고자 하는 검색어를 입력하세요!");
	  		searchForm.searchString.focus();
	  	}
	  	else {
	  		searchForm.submit();
	  	}
	  }
	  
	  function sendCheck(idx,name,price,weight,width,length,hight) {
	  	opener.window.document.myform.product_idx.value = idx;
	  	opener.window.document.myform.product_idx.readOnly = true;
	  	opener.window.document.myform.product_name.value = name;
	  	opener.window.document.myform.product_name.readOnly = true;
	  	opener.window.document.myform.product_price.value = price;
	  	opener.window.document.myform.product_price.readOnly = true;
	  	opener.window.document.myform.product_weight.value = weight;
	  	opener.window.document.myform.product_weight.readOnly = true;
	   	opener.window.document.myform.product_size.value = width+" x "+length+" x "+hight;
	  	opener.window.document.myform.product_size.readOnly = true;
	  	window.close();
	  }
	  
  </script>
</head>
<body>
	<p><br/><p>
  <div class="container">
    <form name="searchForm" method="post" action="${ctp}/productSearch.log">
	  	<b>검색 : </b>
	    <input type="text" name="searchString" id="searchString"/>
	    <input type="button" value="검색" onclick="searchCheck()" class="btn btn-primary btn-sm"/>
	    <input type="button" value="전체검색" onclick="location.href='${ctp}/productCheck.log';" class="btn btn-primary btn-sm"/>
	    <input type="hidden" name="pag" value="${pag}"/>
	    <input type="hidden" name="pageSize" value="${pageSize}"/>
	  </form>
	  <table class="table table-hover text-center">
	    <tr class="table-info">
	      <th>제품번호</th>
	      <th>제품명</th>
	      <th>제품가격</th>
	      <th>무게</th>
	    </tr>
	    <c:set var="curScrStartNo" value="${curScrStartNo}"/>
	    <c:forEach var="vo" items="${vos}" varStatus="st">
	      <tr>
	        <td>${vo.idx}</td>
	        <td><a onclick="sendCheck(${vo.idx},'${vo.name}',${vo.price},${vo.weight},${vo.width},${vo.length},${vo.hight})">${vo.name}</a></td>
	        <td>${vo.price}</td>
	        <td>${vo.weight}</td>
	      </tr>
	      <c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
	    </c:forEach>
	    <tr><td colspan="7" class="m-0 p-0"></td></tr>
	  </table>
  </div>
  
  <br/>
<!-- 블록 페이지 시작 -->
<div class="text-center">
  <ul class="pagination justify-content-center">
    <c:if test="${pag > 1}">
      <li class="page-item"><a class="page-link text-info" href="${ctp}/productCheck.log?pag=1">첫페이지</a></li>
    </c:if>
    <c:if test="${curBlock > 0}">
      <li class="page-item"><a class="page-link text-info" href="${ctp}/productCheck.log?pag=${(curBlock-1)*blockSize + 1}">이전블록</a></li>
    </c:if>
    <c:forEach var="i" begin="${(curBlock)*blockSize + 1}" end="${(curBlock)*blockSize + blockSize}" varStatus="st">
      <c:if test="${i <= totPage && i == pag}">
    		<li class="page-item active"><a class="page-link bg-info border-info" href="${ctp}/productCheck.log?pag=${i}">${i}</a></li>
    	</c:if>
      <c:if test="${i <= totPage && i != pag}">
    		<li class="page-item"><a class="page-link text-info" href="${ctp}/productCheck.log?pag=${i}">${i}</a></li>
    	</c:if>
    </c:forEach>
    <c:if test="${curBlock < lastBlock}">
      <li class="page-item"><a class="page-link text-info" href="${ctp}/productCheck.log?pag=${(curBlock+1)*blockSize + 1}">다음블록</a></li>
    </c:if>
    <c:if test="${pag < totPage}">
      <li class="page-item"><a class="page-link text-info" href="${ctp}/productCheck.log?pag=${totPage}">마지막페이지</a></li>
    </c:if>
  </ul>
</div>
<!-- 블록 페이지 끝 -->
  <p><br/></p>
</body>
</html>