<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" href="/resources/duckoo/css/menu.css?<%=request.getParameter("token")%>">  
    <div id="pageTab">
		<ul class="nav nav-tabs">
    		<li class="active"><a href="#"><i class="fa fa-table" aria-hidden="true"></i>&nbsp;ERD page</a></li>
    		<li><a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i>&nbsp;Q&A</a></li>
    		<li><a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i>&nbsp;Share</a></li>
    		<div id="menuBar">
			<h5 style="float:left; font-weight:bold;">&nbsp;&nbsp;저장되었습니다.&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check" aria-hidden="true"></i></h5>
			<button class="button btn btn-success" type="button" style="vertical-align:middle; float:right;" data-toggle="tooltip" data-placement="bottom" title="DB에 테이블을 생성합니다."><span>Insert DB</span></button>
			<button class="button btn btn-success" type="button" style="vertical-align:middle; float:right;" data-toggle="tooltip" data-placement="bottom" title="JAVA VO코드를 생성합니다."><span>Generate-Code</span></button>
			</div>
    	</ul>
	</div>
	

	<div id="sideBar">
	 	<div class='sideBarHeader'>
	 		<div class="menuClosebtn" onclick="closeSideBar()">&times;</div>
		</div>
	</div>


	<div id="mainNaviBar">
		<button id="makeTableBtn" class="btn btn-success" style="margin-top:5px; margin-left:5px;" type="button" data-toggle="tooltip" data-placement="bottom" title="테이블생성">
	 		<i class="fa fa-table" aria-hidden="true"></i>
	 	</button>
		<button id="makeRelationBtn" class="btn btn-success" style="margin-top:5px;" type="button" data-toggle="tooltip" data-placement="bottom" title="관계생성">
			<i class="fa fa-long-arrow-down" aria-hidden="true"></i>
		</button>
		<div class="dropdown btn btn-success" style="float:left;">
  			<button class="dropbtn">Menu</button>
  			<div class="dropdown-content" style="left:0;">
    			<a href="#" onclick="sideBarOpen()"><i class="fa fa-folder-open-o" style="margin-right:10px;" aria-hidden="true"></i>Explorer</a>
    			<a href="#" onclick="consoleOpen()"><i class="fa fa-television" style="margin-right:10px;" aria-hidden="true"></i>Console</a>
  			</div>
		</div>
	</div>


	<div id="console">
		<div class="consoleHeader">
			<div class="menuClosebtn" onclick="closeConsole()">&times;</div>	
		</div>
	</div>
	
	
<script type="text/javascript" src="/resources/duckoo/js/menu.js?<%=request.getParameter("token")%>"></script>