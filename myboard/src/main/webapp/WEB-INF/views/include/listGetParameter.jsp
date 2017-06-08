<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="display: none;">
	<form id="f1" action="/board/boardList" method="get">
	<input type="hidden" name="keyword" value="${cri.keyword}">
	<input type="hidden" name="gategory" value="${cri.gategory}">
	<input type="hidden" name="page" value="${cri.page}">
	<input type="hidden" name="bno" value="">
	</form>
</div>