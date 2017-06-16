<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="/resources/js-graph-it_1.1/js-graph-it.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/js-graph-it_1.1/js-graph-it.css">
<link rel="stylesheet" type="text/css" href="/resources/js-graph-it_1.1/sf-homepage/sf-homepage.css">

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
	height: 250px;
}
	
.block { position: absolute; }


.attrArea {
	border: 2px solid black;
	width: 100%;
	height: 100%;
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
<body style="width: 100%; height: 100%;">

	<div style="height: 100%; width: 100%;">

		<div id="canvasDIV" style="width: 3000px; height: 3000px; float: left; overflow: scroll;">

				
		</div>
	</div>


	<script>
         $(document).ready(function () {
        	 
        	 
        	 var Entitys=(function(dom){
        	
        		 dom.on("click",".addAttrBtn",function(e){
              	   e.stopPropagation();
              	   e.preventDefault();
              	   console.log(this);
              	   var $this= $(this);
              	   
              	  var type=$this.attr("data-attrType");
              	  var name= $this.attr("data-entityName");
              	  
              	  console.log(type,name,"제발");
              	   
              	  console.log($("div[name="+name+"]"));
              	  
              	var arr=$("div[name="+name+"]");
              	  var tagetObj;
              	   for(var i=0;i<arr.length;i++){
              		   var C= arr[i].className;
              		   console.log("되니?:",C);
              		   if(type===C){
              			 tagetObj=arr[i];
              			 console.log("taget: ",tagetObj);
              			   break;
              		   }
              	   }
              	   addRowToDom($(tagetObj),{name:name,attrType:type});   
                 });
        		 
        		 
   // start
         		
         		var entitys = new Array();
         		
         		dom.on("click",".entity",function(e){
         			entitys.push($(this));
         			if(entitys.length==2){
         				var first = entitys[0].attr("id");	
         				var second = entitys[1].attr("id");
      
         				
         				dom.append(
         									"<div class='connector "+first+" "+second+"'>"+
         				      		"<img class='connector-end' src='/resources/js-graph-it_1.1/sf-homepage/arrow.gif'>"+
         				      		"</div>"		
         				
         				);
         				initPageObjects();	
         				entitys = new Array();
         				
         			}
         			initPageObjects();
         			
         			
         		 });
         		 

    //end
        		 
        		 
        		 var entityArr={};
        	
        		 
        		var addRowToDom=function(attrDom,opt){
               	   var name= opt.name||undefined;
               	   var attrType= opt.attrType || undefined;
               	attrDom.append(
               			   "<div class='row' data-attrType='"+attrType+"'>"+
          					"<input  data-entityName='"+name+"' type='text' class='culName' ></input>"+
          					"<input  data-entityName='"+name+"' type='text' class='attrType' ></input>"+
          					"<div class='delUpBtns'>"+
          						"<button  data-entityName='"+name+"'><i class='fa fa-wrench' aria-hidden='true'></i></button>"+
          						"<button  data-entityName='"+name+"'><i class='fa fa-trash' aria-hidden='true'></i></button>"+
          				  	"</div>"+
          				  "</div>");   
                  }
        		 
        		 
        		 var attribute={
        			      name:undefined,
        			      type:undefined,
        			      idex:undefined,
        			      constraint:undefined,
        			      init:function(opt){
        			         this.name= opt.name||undefined;
        			         this.type=opt.type||undefined;
        			         this.constraint=opt.constraint||undefined;
        			         this.idex=opt.idex||undefined;
        			         
        			      }
        			     };
        		 
        		var addToDom= function(){// 이부분 깨끗하게하고싶은데.
        			
        			
        			dom.append(
			        	"<div class='entity block draggable' id="+this.name+">"+
			   			"	<input type='text' style='float:left;'></input>"+
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
			     
			           }
        		 
        		 
        		 var entity={
        			       name:undefined,
        			       attr:[],
        			       init:function(opt){
        			           this.name=opt.name||undefined;
        			       },
        			       addToDom:addToDom
        			    };
        		 
        		 var makeEntity=function(opt){   
        		      if(!opt.name){alert("잘못된 이름입니다. ");return;}
        		       var newEntity=Object.create(entity);
        		           newEntity.init(opt);
        		        Object.defineProperty(entityArr,newEntity.name,{
        		         value:newEntity,
        		         writable:false,
        		         enumerable:true,
        		         configurable:false
        		       })
        		      if(opt.show === undefined || opt.show===true)
        		              newEntity.addToDom(dom);   
        		   }
        		
        		   var pushAttr=function(Entityname,opt){
        			      if(!opt.name){alert("잘못된 이름입니다. ");return;}
        			      
        			        var newAttr= Object.create(attribute);
        			            newAttr.init(opt);
        			            console.log(": ",Entityname,entityArr);
        			         entityArr[Entityname].attr.push(newAttr);    
        			   }
        		 	var searchForId = function(id){
        		 		
        		 		
        		 		return entityArr[id];
        		 	}
        		 return {
        			 makeEntity:makeEntity,
        			 pushAttr:pushAttr,
        			 entityArr:entityArr,
        			 searchForId:searchForId
        		 } 
        	 })($("#canvasDIV"));
        	 
        	 ///////////////////
        	  var  $canvasDIV = $("#canvasDIV");
        	 
           Entitys.makeEntity({name:"1212"});
           Entitys.makeEntity({name:"121333"});
           
           
           genConnector("canvasDIV",Entitys);
            /* var currentZoom = 1;
            $("button[target=zoomin]").on("click", function (e) {
                e.stopPropagation();
                e.preventDefault();
                currentZoom += 0.1;
                $("#canvasDIV").css({
                    zoom: currentZoom,
                    '-moz-ransform': 'scale(' + currentZoom + ')'
                });
            });
            $("button[target=zoomout]").on("click", function (e) {
                e.stopPropagation();
                e.preventDefault();
                currentZoom -= 0.1;
                $("#canvasDIV").css({
                    zoom: currentZoom,
                    '-moz-ransform': 'scale(' + currentZoom + ')'
                });
            });
 */
        });

    </script>


</body>

</html>