<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="/resources/zaku/js/kybSvgDraw.js"></script>
<script type="text/javascript" src="/resources/zaku/js/geoUtil.js"></script>
<script type="text/javascript" src="/resources/zaku/js/entity.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

 .block { position: absolute; }

/* .entity {
	width: 60%;
	height: 70%;
	position: relative;
	z-index: 1;
} */

.attrArea {
	border: 1px solid black;
	width: 100%;
	height: 100%;
	overflow: auto;
}
button[name=attrPlusBtn]{
	border-radius:50px;

}
       	   
.culName{
width:33%; 
float:left;
}
.attrType{
width:25%; 
float:left;
}
.delUpBtns{
float:left; 
width:35%;
}

 .draggable {
     cursor: move;
     width:100%;
     height:100%;
     border-style:groove;
     border-width:1px;
     border-color:rgb(255,255,255);
  }
 .test{
 cursor:pointer;
 }

.row{
	display: inline-table;
}
</style>

</head>
<body style="width: 100%; height: 100%;">

	<div style="height: 100%; width: 100%;">

		<div id="canvasDIV" style="width: 89.5%; height: 74%; float: left; overflow: scroll;">
			  <svg id="svg" width=3000px height=3000px style="position:relative;">
<!-- 			   <image xlink:href="/resources/zaku/img/TestIMage.jpg" height="20px" width="20px"/>     -->
			  </svg>
		</div>
	</div>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/svg.js/2.6.2/svg.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/svg.js/2.6.2/svg.min.js"></script>

	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
	<script>
         $(document).ready(function () {
        	//foreignList.createElement({id:"sss1211121234"});
        	EntityManager.createEntity({name:"s1"});
        	EntityManager.showEntity({name:"s1",id:"sss"});
        	EntityManager.createEntity({name:"s2"});
        	EntityManager.showEntity({name:"s2",id:"sss2"});
        	
        });
    </script>
</body>

</html>