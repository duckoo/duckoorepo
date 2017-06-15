
var EntityManager=(function(){
////////////////////////////////// inner Object protoType
	var attribute = {
			name : undefined,
			type : undefined,
			idex : undefined,
			constraint : undefined,
			init : function(opt) {
				this.name = opt.name || undefined;
				this.type = opt.type || undefined;
				this.constraint = opt.constraint || undefined;
				this.idex = opt.idex || undefined;
			}
		};
	
	var entity = {
		name : undefined,
		attr:[],
		init : function(opt) {
			this.name = opt.name || undefined;
			this.foreignObjectId=opt.foreignObjectId || undefined;
		 },
		genHtml:function(){ // onmousemove ='repaint(event) we will fix.........
		var str="<div class='entity' id="+this.name+" onmousemove ='repaint(event)'>"+
   			"	<input type='text' style='float:left;'></input>"+
   			"	<div style='float:left; width:35%;'>"+
   			"		<button><i class='fa fa-wrench' aria-hidden='true'></i></button>"+
   			"		<button><i class='fa fa-trash' aria-hidden='true'></i></button>"+
   			"	</div>"+
   		 	" <div class='attrArea'>"+
   			"	<div name="+this.name+" class='pk'>"+
   			"	</div>"+
   			"   <div>"+
   			"		<button class='addAttrBtn' data-entityName='"+this.name+"'  data-attrType='pk' name='attrPlusBtn'>"+
   			"			<i class='fa fa-plus' aria-hidden='true'></i>"+
   			"		</button>	"+
   			"	</div>"+
   			"	<hr style='border-width:1px; border-color:red;'>"+
   			"	<div name="+this.name+" class='std'>"+
   			"	</div>	"+
   			"	<div>"+
   			"		<button class='addAttrBtn' data-entityName='"+this.name+" data-attrType='std' name='attrPlusBtn'>"+
   			"			<i class='fa fa-plus' aria-hidden='true'></i>"+
   			"		</button>"+		
   			"	</div>"+
   		    " </div>"+
            "</div>";
		  return str;
		}
	 };
// private Object /////////////////////////////////////////////////////////////////////////////////////////////////////

	var entityArr={};// all of Entity;
	var focusedEntity=undefined;

	var $dom =$("#canvasDiv");
////////////////////////////////////////////////////////////////////////////////////////////////
	
	$dom.on("click",".entity",function(e){
		e.stopPropagation();
	    e.preventDefault();	
	     
	     var id= $(this).attr("id");
	     console.log(id);
	     if(focusedEntity===undefined){
	    	 focusedEntity=entityArr[id]; 
	    	 return ;
	     }
	    	 
	     if(focusedEntity.name!==id){
	    	var fid= focusedEntity.name;
	    	renderManager.connectDiv({$source:$("#"+fid) ,$target:$("#"+id),id:id+""+fid});
	    	focusedEntity=undefined;
	     }
	})
	
	$dom.on("click",".addAttrBtn",function(e){
		e.stopPropagation();
	    e.preventDefault();
	   
	})
	
	
	
	
// function///////////////////////////////////////////////////////////////////////////////////////////////////// 

function createEntity(opt){
	if(!opt.name){
		alert("Entity 생성 잘못된 이름");
		return;
	}
    var newEntity=Object.create(entity);
      newEntity.init(opt);
       Object.defineProperty(entityArr,newEntity.name,{
	         value:newEntity,
	         writable:false,
	         enumerable:true,
	         configurable:false
	   }); 
       
       if(opt.show){
    	   showEntity(opt);
       }
       
       
    return newEntity;
}	

function showEntity(opt){
	if(!opt.name){
		alert("잘못된 이름");
		return;
	}
	var name=opt.name;
	var str= entityArr[name].genHtml();
	$dom.append(str);
	$("#"+name).draggable();
	$("#"+name).resizable();
}

function setFocusByName(name){
	focusedEntity=entityArr[name];
}


function  getFocusByName(){
	var _focusedEntity= focusedEntity||{};
  return _focusedEntity.name;
}

function getEntityByName(name){
	return entityArr[name];
}
return {
	    createEntity:createEntity,
	    showEntity:showEntity,
	    setFocusByName:setFocusByName,
	    getFocusByName:getFocusByName,
	    getEntityByName:getEntityByName
      };

})();

function repaint(){
    jsPlumb.repaintEverything();
}


