<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>
<h3>
	<i class="fa fa-angle-right"></i> Board Register
</h3>
<div class="row mt">
<div class="col-lg-12">
<div class="form-panel">
<form id="registerPost" class="form-horizontal style-form" method="post" action="/board/register">
	<div class="form-group">
     <label class="col-sm-2 col-sm-2 control-label">제목</label>
         <div class="col-sm-10">
            <input type="text" name="title" class="form-control" readonly="readonly" value="${boardVO.title}">
         		<input type="hidden" name="bno1" value="${boardVO.bno}">
         </div>
  </div>
  <div class="form-group">
     <label class="col-sm-2 col-sm-2 control-label">작성자</label>
         <div class="col-sm-10">
            <input type="text" name="writer" class="form-control" readonly="readonly" value="${boardVO.writer}">
         </div>
  </div>
  <div class="form-group">
     <label class="col-sm-2 col-sm-2 control-label">내용</label>
  </div>
  <div class="form-group" style="width: 100%">
  	<div class="col-sm-10" style="width: 100%">
  		${boardVO.content}
  	</div>
	</div>
</form>
</div>
<div>
	<button class="button" id="toList" style="vertical-align:middle; float: right;">
		<span>돌아가기 </span>
	</button>
	<button class="button" id="deleteBtn" style="vertical-align:middle; float: right;">
		<span>삭제하기 </span>
	</button>
	<button class="button" id="updateBtn" onclick='saveContent()' style="vertical-align:middle; float: right;">
		<span>수정하기 </span>
	</button>
</div>

<%@include file="../modal/modalDelete.jsp"%>
<%@include file="../include/listGetParameter.jsp"%>
<%@include file="../include/footer.jsp"%>
<script>
	$(document).ready(function(e){
		$("#toList").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			$("#f1").submit();
		});
		$("#deleteBtn").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			$("#modalDelete").modal({backdrop: 'static', keyboard: false});
		});	
			
		$("#deleteModalBtn").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			var $bno1 = $("input[name=bno1]").val();
			var $bno= $("input[name=bno]").val($bno1);
			console.log($bno.val());
			var $f1=$("#f1");
			$f1.attr("action","/board/delete");
			$f1.attr("method","post");
			console.log($f1.attr("method"));
			$f1.submit();
		});
		
});


</script>
</body>
</html>