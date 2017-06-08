<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../include/header.jsp"%>

<h3>
	<i class="fa fa-angle-right"></i> Board List
</h3>
<div class="row">
<div class="col-md-12">
<div class="content-panel">
<div style="">
<table class="table table-striped table-advance table-hover">
		<div>
			<div style="float: left;">
				<h4><i class="fa fa-angle-right"></i> Board </h4>
			</div>
			<div style="float: right;">
				<button class="button" id="registerBoardBtn" style="vertical-align:middle"><span>글쓰기 </span></button>
			</div>
				<hr style="width: 100%;">
		</div>
  <thead>
   <tr>
     <th><i class="fa fa-bullhorn"></i> 글번호</th>
     <th class="hidden-phone"><i class="fa fa-question-circle"></i> 제목</th>
     <th><i class="fa fa-bookmark"></i> 작성자</th>
     <th><i class=" fa fa-edit"></i> 등록날짜</th>
     <th>조회수</th>
     <th>댓글수</th>
   </tr>
  </thead>
  <tbody id="tbody">
   <c:forEach items="${boardList}" var="boardVO">
   <tr>
   	 <td>${boardVO.bno}</td>
   	 <td id="boardVOBno"><a href="${boardVO.bno}">${boardVO.title}</a></td>
     <td>${boardVO.writer}</td>
     <td>${boardVO.updatedate}</td>
     <td>0</td>
     <td>0</td>
		</tr>
		</c:forEach>
 </tbody>
</table>
</div>
</div><!-- /content-panel -->
<div id="pageCriValue" style="margin-top:30px;">
<div id="criValue" style="width: 150px; float:left;">
	<select class="form-control" id="gategorys">
							
						  <option value="all" <c:if test="${cri.gategory==null}">selected</c:if>>----</option>
						  <option value="all" <c:if test="${cri.gategory=='all'}">selected</c:if>>ALL</option>
						  <option value="t" <c:if test="${cri.gategory=='t'}">selected</c:if>>제목</option>
						  <option value="w" <c:if test="${cri.gategory=='w'}">selected</c:if>>작성자</option>
						  <option value="c" <c:if test="${cri.gategory=='c'}">selected</c:if>>내용</option>
						  <option value="tw" <c:if test="${cri.gategory=='tw'}">selected</c:if>>제목+작성자</option>
						  <option value="tc" <c:if test="${cri.gategory=='tc'}">selected</c:if>>제목+내용</option>
						  <option value="cw" <c:if test="${cri.gategory=='cw'}">selected</c:if>>내용+작성자</option>
	</select>
</div>

<div id="keywordDIV" style="float: left;">
	<div style="float: left;">
			<input type="text" name="keyword" class="form-control" value="${cri.keyword}"></div>
	<div style="float: left;">
		<button type="button" id="searchBtn" class="btn btn-theme" style="height: 34px;">
			<i class="fa fa-search" aria-hidden="true"></i>
		</button>
	</div>
</div>
<%@include file="../include/listGetParameter.jsp"%>
<div id="pagination" style="float:right;">
	<c:if test="${page.prev}">
		<a href="${page.startPage-1}">&laquo;</a>
	</c:if>

	<c:forEach begin="${page.startPage }" end="${page.endPage }" var="idx">
			<a href="${idx}" class="${page.cri.page == idx?'active':''}">${idx}</a>
	</c:forEach>

	<c:if test="${page.next && page.endPage > 0}">
		<a href="${page.endPage +1}">&raquo;</a>
	</c:if>
	
</div>
</div>
<%@include file="../include/footer.jsp"%>

<script>
	$(document).ready(function(e){
		$(document).on("click", "#pagination a", function(e){
			e.stopPropagation();
			e.preventDefault();
			$("input[name=page]").val($(this).attr("href"));
			//$("inpu[name=gategory]").val($("#gategorys option:selected").val());
			//$("input[name=keyword]").val();
			$("#f1").submit();
			
		})
		$("#searchBtn").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			console.log("asd",$("input[name=gategory]").val($("#gategorys option:selected").val()));
			$("input[name=keyword]").val($("input[name=keyword]").val());
			$("#f1").submit();
		});
		
		$("#registerBoardBtn").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			var $f1 = $("#f1");
			$f1.attr("action", "/board/register");
			$f1.submit();
		});
		
		$("#boardVOBno a").on("click",function(e){
			e.stopPropagation();
			e.preventDefault();
			$("input[name=bno]").val($(this).attr("href"));
			console.log($("input[name=bno]").val());
			var $f1 = $("#f1");
			$f1.attr("action","/board/read");
			$f1.submit();
		});
	});

</script>

	</body>
</html>