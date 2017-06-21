<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="/resources/duckoo/css/menu.css?<%=request.getAttribute("token")%>">  
    <div id="pageTab">
		<ul class="nav nav-tabs">
    		<li class="active"><a href="#"><i class="fa fa-table" aria-hidden="true"></i>&nbsp;ERD page</a></li>
    		<li><a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i>&nbsp;Q&A</a></li>
    		<li><a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i>&nbsp;Share</a></li>
    		<div id="menuBar">
			<h5 style="float:left; font-weight:bold;">&nbsp;&nbsp;저장되었습니다.&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check" aria-hidden="true"></i></h5>
			<button class="button btn btn-success" type="button" style="vertical-align:middle; float:right;" data-toggle="tooltip" data-placement="bottom" title="DB에 테이블을 생성합니다."><span>Insert DB</span></button>
			<button class="button btn btn-success" type="button" style="vertical-align:middle; float:right;" data-toggle="tooltip" data-placement="top" title="JAVA로 VO코드를 생성합니다."><span>Generate-Code</span></button>
			</div>
    	</ul>
	</div>
	

	<div id="sideBar">
	 <div id="sideBtns" style="width:100%; vertical-align:middle; height:40px; border-radius: 5px;">
	 	<button class="btn btn-success" style="margin-top:5px; margin-left:5px;" type="button" data-toggle="tooltip" data-placement="bottom" title="테이블생성">
	 		<i class="fa fa-table" aria-hidden="true"></i>
	 	</button>
	 	<button class="btn btn-success" style="margin-top:5px;" type="button" data-toggle="tooltip" data-placement="top" title="관계생성">
			<i class="fa fa-long-arrow-down" aria-hidden="true"></i>
		</button>
	 </div>
	</div>

		

	<div id="console">
		
	</div>