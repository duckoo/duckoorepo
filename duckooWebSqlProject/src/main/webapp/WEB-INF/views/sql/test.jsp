<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 		<script type="text/javascript" src="/resources/jsplumb.min.js"></script>
 		
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/duckoo/js/duckooPlumb.js"></script>
<script type="text/javascript" src="/resources/duckoo/js/relationship.js"></script>


<style>
.entity {
	width: 200px;
	height: 280px;
}
	


.attrArea {
	border: 2px solid black;
	width: 100%;
	height: 250px;
	overflow:auto;
}
button[name=attrPlusBtn]{
	border-radius:50px;

}
       	   
.culName{
width:40%; 
float:left;
}
.attrType{
width:30%; 
float:left;
}
.delUpBtns{
float:left; 
width:20%;

}

.row{
	display: inline-block;
}
.pk{
	width:100%;
}
.std{
	width:100%;
}


</style>

</head>
 <body>
    <div class="canvas" id="canvasDiv"
      style="width: 1000px; height: 1000px; border: 1px solid black;">
    </div>
  
  
 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.js"></script>
 <script id="entityTemplate" type="text/x-handlebars-template">
<div class='entity' id='{{name}}' onmousemove ='repaint(event)'>
   <input type='text' style='float:left;'></input>
   				<div style='float:left; width:35%;'>
   					<button><i class='fa fa-wrench' aria-hidden='true'></i></button>
   					<button><i class='fa fa-trash' aria-hidden='true'></i></button>
   				</div>
   		 	 <div class='attrArea'>
   				<div name='{{name}}' class='pk'>
   				</div>
   			   <div>
   					<button class='addAttrBtn' data-entityName='{{name}}'  data-attrType='pk' name='attrPlusBtn'>
   						<i class='fa fa-plus' aria-hidden='true'></i>
   					</button>
   				</div>
   				<hr style='border-width:1px; border-color:red;'>
   				<div name="+this.name+" class='std'>
   				</div>	
   				<div>
   					<button class='addAttrBtn' data-entityName='{{name}}' data-attrType='std' name='attrPlusBtn'>
   						<i class='fa fa-plus' aria-hidden='true'></i>
   					</button>		
   				</div>
   		</div>
 </div>
</script> 
  
 <script type="text/javascript" src="/resources/duckoo/js/entity.js"></script>   
<script>
jsPlumb.ready(function() {
	EntityManager.createEntity({name:"e1",show:true});
	EntityManager.createEntity({name:"e2",show:true});
	EntityManager.createEntity({name:"e3",show:true});

	/* var en=EntityManager.getEntityByName("e1");
	console.log("entity: ",en.attr[0]); */
	
 });
	
</script>
   
  </body>
</html>