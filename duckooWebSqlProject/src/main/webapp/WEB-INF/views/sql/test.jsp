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
    

    
<script>
var contact = function(firstElement,nextElement){
	
		jsPlumb.addEndpoint(firstElement,{
			
		});
	
    jsPlumb.connect({
        source:$("#canvasDiv #"+firstElement),
        target:$("#canvasDiv #"+nextElement),
      	
        
        anchor:["Continuous", { faces:[ "bottom", "left" ,"right","top"] } ]
    });
                   
}
function repaint(){
    jsPlumb.repaintEverything();
}


jsPlumb.ready(function() {
	 
	 $("#canvasDiv").append(
	        "<div class='entity' id='1212' onmousemove ='repaint()'>"+
	        "<div>"+
	   			"	<input type='text' style='float:left; width:100px;'></input>"+
	   			"</div>"+
	   			"	<div style='float:left; width:35%;'>"+
	   			"		<button><i class='fa fa-wrench' aria-hidden='true'></i></button>"+
	   			"		<button><i class='fa fa-trash' aria-hidden='true'></i></button>"+
	   			"	</div>"+
	   		 	" <div class='attrArea'>"+
	   			"	<div name="+this.name+" class='pk'>"+
	   			"	</div>"+
	   			"   <div>"+
	   			"		<button class='addAttrBtn' data-entityName='"+this.name+"'  data-attrType='pk' name='attrPlusBtn' >"+
	   			"			<i class='fa fa-plus' aria-hidden='true'></i>"+
	   			"		</button>	"+
	   			"	</div>"+
	   			"	<hr style='border-width:1px; border-color:red;'>"+
	   			"	<div name="+this.name+" class='std'>"+
	   			"	</div>	"+
	   			"	<div>"+
	   			"		<button class='addAttrBtn' data-entityName='"+this.name+"' data-attrType='std' name='attrPlusBtn'>"+
	   			"			<i class='fa fa-plus' aria-hidden='true'></i>"+
	   			"		</button>"+		
	   			"	</div>"+
	   		    " </div>"+
	            "</div>");
	 
	 $("#canvasDiv").append(
	        	"<div class='entity' id='121333' onmousemove ='repaint()' style='margin-top:500px; margin-left:500px;'>"+
	   			"	<input type='text' style='float:left; width:100px;'></input>"+
	   			"	<div style='float:left; width:35%;'>"+
	   			"		<button><i class='fa fa-wrench' aria-hidden='true'></i></button>"+
	   			"		<button><i class='fa fa-trash' aria-hidden='true'></i></button>"+
	   			"	</div>"+
	   		 	" <div class='attrArea'>"+
	   			"	<div name="+this.name+" class='pk'>"+
	   			"	</div>"+
	   			"   <div>"+
	   			"		<button class='addAttrBtn' data-entityName='"+this.name+"'  data-attrType='pk' name='attrPlusBtn' >"+
	   			"			<i class='fa fa-plus' aria-hidden='true'></i>"+
	   			"		</button>	"+
	   			"	</div>"+
	   			"	<hr style='border-width:1px; border-color:red;'>"+
	   			"	<div name="+this.name+" class='std'>"+
	   			"	</div>	"+
	   			"	<div>"+
	   			"		<button class='addAttrBtn' data-entityName='"+this.name+"' data-attrType='std' name='attrPlusBtn'>"+
	   			"			<i class='fa fa-plus' aria-hidden='true'></i>"+
	   			"		</button>"+		
	   			"	</div>"+
	   		    " </div>"+
	            "</div>");
	     
	     
	 var entitys = new Array();
	 
	 $("#canvasDiv").on("click",".entity",function(e){
		
		      var clickedDiv = $(this);
		      
		      
		     
		      entitys.push(clickedDiv);  
		      
		      
		      if(entitys.length==2){
		    	  entitys[0].draggable();
		    	  entitys[1].draggable();
		    	  
		    	  contact(entitys[0].attr("id"),entitys[1].attr("id"));
		    		
		    	 
		      }
		      
		      var lines = document.getElementsByClassName("jtk-endpoint");
		      console.log(lines.length);
		      for(var i=0; i<lines.length; i++){
		    	  lines[i].innerHTML="<img src='/resources/images/dackbal.png'/>";
		    	  
		      }
	     
	 });
	 
	 
	 
	 
	 
	
	

		
 });
	
</script>
   
  </body>
</html>