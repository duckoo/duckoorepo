<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.entity {
	width: 60%;
	height: 70%;
	position: relative;
	left: 5px;
	top: -100px;
	z-index: 1;
}

.attrArea {
	border: 2px solid black;
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

.row{
	display: inline-table;
}


</style>



</head>
<body style="width: 100%; height: 100%;">

	<div style="height: 100%; width: 100%;">

		<div id="canvasDIV"
			style="width: 89.5%; height: 74%; float: left; overflow: scroll;">
			<svg id="svg" width="100%" height="100%" style="position:relative;">
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
        		//start ㅇㅇ
        		var focusEntity = undefined;
        		dom.on("click",".entity",function(e){
        			e.stopPropagation();
        			
        				var selEntity=$(this);
        				
    	    			if(focusEntity ===undefined){
	        			focusEntity =selEntity;
	        			return;
    	    			}
        			 if(focusEntity !== selEntity){
        				 switchState(focusEntity, selEntity);
        				 focusEntity=undefined;
 	        			return;
        			 }
        			
        		 });
        		 
        		 
        		 var FlagChange = function(entity){
        			 
        			 entity.focusFlag = true;
        			 count++;
        		 }
        		 var switchState = function(first,next){
        			 
        			 if(first.offset().left>next.offset().left){
        				 left = next;
        				 right = first;
        			 }else{
        				 left = first;
        				 right = next;
        			 }
        			 draw(left, right);
        		 }
        		 var draw = function(left, right){
        			 var leftPosition = {};
        			 leftPosition.x = left.offset().left + left.width();
        			 leftPosition.y = left.offset().top + (left.height()/2);
        			 
        			 
        			 var rightPosition = {};
        			 rightPosition.x = right.offset().left;
        			 rightPosition.y = right.offset().top + (right.height()/2);
        			 
        			 var svgLine = document.getElementById("svg");
        			 var path = document.createElementNS("http://www.w3.org/2000/svg","path");
        			 
        			 svgLine.appendChild(path);
        			 path.setAttribute("id","p1");
        			 
        			 document.getElementById("p1").setAttribute("d","M"+leftPosition.x+" "+leftPosition.y+" C " +(leftPosition.x+rightPosition.x)/2+" "+leftPosition.y+", "+(leftPosition.x+rightPosition.x)/2+" "+ rightPosition.y+", "+rightPosition.x+" "+rightPosition.y);
        			 document.getElementById("p1").setAttribute("fill","none");
        			  document.getElementById("p1").setAttribute("stroke-width","2");
        			document.getElementById("p1").setAttribute("stroke","#000");

        		 }
        		 
        		 //end ㅇㅇ
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
			        	"<div class='entity' id="+this.name+" >"+
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
			                var  str="#"+this.name;
			               $(str).draggable({scroll:true});
			               $(str).resizable();
			           }
        		 
        		 
        		
        		 var entity={
        			       name:undefined,
        			       attr:[],
        			       focusFlag:undefined,
        			       init:function(opt){
        			           this.name=opt.name||undefined;
        			          this.focusFlag=false;
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
        		 
        		 return {
        			 makeEntity:makeEntity,
        			 pushAttr:pushAttr
        		 } 
        	 })($("#canvasDIV"));
        	 
        	 ///////////////////
        	  var  $canvasDIV = $("#canvasDIV");
        	 
           Entitys.makeEntity({name:"1212"});
           Entitys.makeEntity({name:"121333"});

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