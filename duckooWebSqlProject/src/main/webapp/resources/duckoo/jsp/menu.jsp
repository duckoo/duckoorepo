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
	
	
	
<script id="__ConsoleTemp__" type="text/x-handlebars-template">
<div id="{{id}}" class="console">
		<div class="consoleHeader">
			<div class="menuClosebtn" id="consoleCloseBtn" >&times;</div>	
		</div>
	</div>
</script>	

<script id="__sidebarTemp__" type="text/x-handlebars-template">
	<div id="{{id}}" class="sideBar">
	 	<div class='sideBarHeader'>
	 		<div class="menuClosebtn" id="sideBarCloseBtn" >&times;</div>
		</div>
		<div class="sideBarBody">
			
		</div>
	</div>
</script>
	
<script id="mainNaviBar" type="text/x-handlebars-template">
	<div id="mainNaviBar">
		<button id="makeTableBtn" class="btn btn-success" style="margin-top:5px; margin-left:5px;" type="button" data-toggle="tooltip" data-placement="bottom" title="테이블생성">
	 		<i class="fa fa-table" aria-hidden="true"></i>
	 	</button>
		<button id="makeRelationBtn" class="btn btn-success" style="margin-top:5px;" type="button" data-toggle="tooltip" data-placement="bottom" title="관계생성">
			<i class="fa fa-long-arrow-down" aria-hidden="true"></i>
		</button>
		<div class="dropdown btn btn-success" style="float:left;">
  			<button class="dropbtn">Menu</button>
  			<div class="dropdown-content" data-id='menu' style="left:0;">
    		</div>
		</div>
	</div>
</script>

 <!-- 잠시백업  <a href="#" onclick="consoleOpen()"><i class="fa fa-television" style="margin-right:10px;" aria-hidden="true"></i>Console</a>
  -->

<script id="menuItem" type="text/x-handlebars-template">
   {{#itemList}}
	<a href="#" id='item_{{id}}'><i class="fa fa-folder-open-o" style="margin-right:10px;" aria-hidden="true"></i>{{name}}</a>
   {{/itemList}}
</script>	

<script type="text/javascript" src="/resources/duckoo/js/menu/model/Menu.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/menu/view/MenuView.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/menu/controller/MenuCon.js?<%=request.getParameter("token")%>"></script>


<script type="text/javascript" src="/resources/duckoo/js/menu/item/model/Console.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/menu/item/view/ConsoleView.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/menu/item/controller/ConsoleCon.js?<%=request.getParameter("token")%>"></script>

<script type="text/javascript" src="/resources/duckoo/js/menu/item/model/Sidebar.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/menu/item/view/SidebarView.js?<%=request.getParameter("token")%>"></script>
<script type="text/javascript" src="/resources/duckoo/js/menu/item/controller/SidebarCon.js?<%=request.getParameter("token")%>"></script>

<script type="text/javascript">
 var $document=$document || $(document); 

 var menuCon=new MenuCon(new Menu());
 var consoleCon= new ConsoleCon(new Console());
 var sidebarCon= new SidebarCon(new Sidebar());
 menuCon.regItem(sidebarCon.transToMenuItem());
 menuCon.regItem(consoleCon.transToMenuItem());
 menuCon.render();  
 
 
 $('[data-toggle="tooltip"]').tooltip();
 
$document.on("click","#item_"+consoleCon.getId(),function(e){
	e.stopPropagation();
    e.preventDefault();
	consoleCon.open();
})

$document.on("click","#consoleCloseBtn",function(e){
	e.stopPropagation();
    e.preventDefault();
	consoleCon.close();
})

$document.on("click","#item_"+sidebarCon.getId(),function(e){
	e.stopPropagation();
    e.preventDefault();
	sidebarCon.open();
})

$document.on("click","#sideBarCloseBtn",function(e){
	e.stopPropagation();
    e.preventDefault();
	sidebarCon.close();
})


</script>




