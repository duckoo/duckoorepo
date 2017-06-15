<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#pageTab{
	width:100%;
	height:5%;
	

}
body{
    color: #797979;
		background: #f2f2f2;
    font-family: 'Ruda', sans-serif;
    padding: 0px !important;
    margin: 0px !important;
    height:988px;
    border-width:1px;
    border-color: "black";
    border-style: solid;
}
#pageTab ul li
{
	border-top-right-radius: 30px;

}
#menuBar{
	height:40px;
	border-bottom:medium;
	border-bottom-style: groove;
	
	
}

.button {
  display: inline-block;
  border-radius: 4px;
  background-color: #64DB99;
  border: none;
  color : #FFFFFF;
  text-align: center;
  font-size: 15px;
  width: 200px;
  transition: all 0.5s;
  cursor: pointer;
  margin: 2px;
}

.button span {
  cursor: pointer;
  display: inline-block;
  position: relative;
  transition: 0.5s;
}

.button span:after {
  content: '\00bb';
  position: absolute;
  opacity: 0;
  top: 0;
  right: -20px;
  transition: 0.5s;
}

.button:hover span {
  padding-right: 25px;
}

.button:hover span:after {
  opacity: 1;
  right: 0;
}





</style>
</head>


<body>
<div id="wrapper" style="width:100%; height:100%">


	<div id="pageTab">
		<ul class="nav nav-tabs">
    <li class="active"><a href="#"><i class="fa fa-table" aria-hidden="true"></i>&nbsp;ERD page</a></li>
    <li><a href="#"><i class="fa fa-question-circle" aria-hidden="true"></i>&nbsp;Q&A</a></li>
    <li><a href="#"><i class="fa fa-share-alt" aria-hidden="true"></i>&nbsp;Share</a></li>
  </ul>

	</div>
	<div id="menuBar">
		<h5 style="float:left; font-weight:bold;">&nbsp;&nbsp;저장되었습니다.&nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-check" aria-hidden="true"></i></h5>
		<button class="button btn btn-success" type="button" style="vertical-align:middle; float:right;" data-toggle="tooltip" data-placement="bottom" title="DB에 테이블을 생성합니다."><span>Insert DB</span></button>
		<button class="button btn btn-success" type="button" style="vertical-align:middle; float:right;" data-toggle="tooltip" data-placement="top" title="JAVA로 VO코드를 생성합니다."><span>Generate-Code</span></button>
	</div>

	<div id="mainContainer">
	<div id="sideBar" style="float:left; width:15%; height:650px; background-color:#d2d2d2; border-radius: 5px;">
	 <div id="sideBtns" style="width:100%; vertical-align:middle; height:40px; border-radius: 5px;">
	 	<button class="btn btn-success" style="margin-top:5px; margin-left:5px;" type="button" data-toggle="tooltip" data-placement="bottom" title="테이블생성">
	 		<i class="fa fa-table" aria-hidden="true"></i>
	 	</button>
	 	<button class="btn btn-success" style="margin-top:5px;" type="button" data-toggle="tooltip" data-placement="top" title="관계생성">
			<i class="fa fa-long-arrow-down" aria-hidden="true"></i>
		</button>
	 </div>
	 <div style="width:100%; height:610px; border-radius: 5px; background-color: white;border-radius: 10px; border-style: groove;">
	 
	 </div> 
	</div>

		<div id="canvasDiv" style="float:left; width:83%; height:650px; border-bottom-style: groove; overflow:scroll;">
			<div style="margin-top:100px; margin-left:100px; width:200px; height:250px; background-color: black;"></div>
			<div style="margin-top:400px; margin-left:400px; width:200px; height:250px; background-color: red;"></div>
		</div>
		
	<div id="footer">
		<div id="cosole" style="float:left; width:70%; height:250px; border-right-style: groove;">
		
		</div>
		<div id="miniMap" style="float:left; width:28%; height:250px;">
			<div id="iframe" style="width:100%;height:100%; overflow:scroll;">
					
			</div>
		</div>
		
	</div>

	</div>
</div>
<script>
	$(document).ready(function(e){
		var iframeChange = function(){
			var canvasDIV=$("#canvasDiv");
			var iframe =$("#iframe");
			
			canvasDIV.clone().width("20%").height("20%").appendTo(iframe);
			
			console.log(canvasDIV.clone().width());
			
			
			//.appendTo(iframe);
		
			
		};
		
		iframeChange();
		
	});

</script>


</body>


</html>