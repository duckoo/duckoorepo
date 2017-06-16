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
    width:175px; height:125px; margin-top:50px; margin-left:50px;
    -webkit-transition: width 0.5s, height 0.5s; /* For Safari 3.1 to 6.0 */
    transition: width 0.5s, height 0.5s;
    
}
.deleteTbl{
    width:100%; height:10px; font-size: 15px; font-weight: bold; color:red; text-align: right;
}
.innerEntity{
    border-radius: 10px; width:150px; height:100px; border-style: solid; border-color: gray; margin-left:10px;
    -webkit-transition: width 0.5s, height 0.5s; /* For Safari 3.1 to 6.0 */
    transition: width 0.5s, height 0.5s;
    background-color:white;
}
.table_name{
  width:100%; height:25px; border-bottom-style:solid; border-bottom-color: gray;
}
.deleteTbl:hover{
    cursor:pointer;
}
  .select-editable { position:relative; background-color:white; border:solid grey 1px;  width:120px; height:18px; }
  .select-editable select { position:absolute; top:0px; left:0px; font-size:14px; border:none; width:120px; margin:0; }
  .select-editable input { position:absolute; top:0px; left:0px; width:100px; padding:1px; font-size:12px; border:none; }
  .select-editable select:focus, .select-editable input:focus { outline:none; }


.modal
{
    overflow: hidden;
}
.modal-dialog{
    margin-right: 0;
    margin-left: 0;
}
#canvasDiv{
	background-image: url(http://freedevelopertutorials.azurewebsites.net/wp-content/uploads/2015/06/grid.png);

}

</style>

</head>
 <body>
    <div class="canvas" id="canvasDiv"
      style="width: 1000px; height: 1000px; border: 1px solid black;">
    </div>
  
  
 <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.8/handlebars.js"></script>
 <script id="entityTemplate" type="text/x-handlebars-template">

<div class='entity' id='{{name}}'>
        <div class='deleteTbl' data-deleteBtn='{{name}}'>x</div>
        <div class='innerEntity' data-innerEntity='{{name}}'>
          <div class='table_name'>
              <div style='width:65%; margin-left:5px; float:left;'>{{name}}</div>
              <button class='scaleUpBtn' data-scaleBtn='{{name}}'><i class='fa fa-chevron-down' aria-hidden='true' ></i></button>
          </div>
            <div class='attrArea' data-attrArea='{{name}}' data-attrAreaSmall={{name}} style='width:100%;'>
              <div style='width:100%; border-bottom-style:solid; border-bottom-color: gray; background-color: rgba(255, 0, 0, 0.5);'>  
                <div class='' id='pk_'+{{name}} style='width:100;'>
                </div>
              </div>
                     {{isExtend extend}}
              <div>  
                <div class='' id='std_'+{{name}} style='width:100;'>
                </div>
              </div>
          </div>    
  </div>

</script> 


 <script id="sqlCreate" type="text/x-handlebars-template">

 create table {{name}} (  
{{#attr}}
	  {{name}},
      {{gen name type}}

 {{/attr}}
);

</script> 

 <script type="text/javascript" src="/resources/duckoo/js/entity.js"></script>   
   <script type="text/javascript" src="/resources/conjs/sqlgen.js"></script>
<script>


jsPlumb.ready(function() {
	 setInterval(function(){
		repaint();
	},100/3);

	
	EntityManager.createEntity({name:"e1",show:false});
	EntityManager.createEntity({name:"e2",show:true});
	 var en=EntityManager.getEntityByName("e1");
	en.setAttr({name:"sibal",type:"tt",constraint:"pk"});
	en.setAttr({name:"sibal2",type:"tt2",constraint:"not null"});
	
	EntityManager.showEntity("e1");
/* 	getDivToRect("e1");
	getDivToRect("e2");
	getDivToRect("e3"); */
	/*  var en=EntityManager.getEntityByName("e1");
	 
	en.setAttr({name:"sibal",type:"tt",constraint:"pk"});
	en.setAttr({name:"sibal2",type:"tt2",constraint:"pk"});
	
	//console.log("get",en.getAttr()); */
	
	//sqlGenerator.generate(en);
	
	/* var en=EntityManager.getEntityByName("e1");
	console.log("entity: ",en.attr[0]); */
	
 });
	
</script>
   
  </body>
</html>