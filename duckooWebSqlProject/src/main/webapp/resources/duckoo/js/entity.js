
var EntityManager=(function(){
	var entityArr={};// all of Entity;
	var focusedEntity=undefined;
	var $dom =$("#canvasDiv");	
	var entityHtml=$("#entityTemplate").html();
	var entityTemplate=Handlebars.compile(entityHtml);
	
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
		 },
		genHtml:function(){
		  return entityTemplate(this);
		}
	 };
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
    	   showEntity(opt.name);
       }
    return newEntity;
}	

function showEntity(name){
	var en= entityArr[name];
	if(!en){
	 console.log(en);
		return;
	}
	var str=en.genHtml();
	$dom.append(str);
	$("#"+name).draggable().resizable();
}
function hideEntity(name){
	var en= entityArr[name];
	if(!en)return;
	$("#"+en.name).remove();
}

function deleteEntity(name){
	var en= entityArr[name];
	 if(!en)return;
	 hideEntity(name);
	 delete en; //delete 쓰지말라고하던데 흠
}


function setFocusByName(name){
	focusedEntity=entityArr[name];
}

function setAttribute(entityName,opt){
	var en=entityArr[entityName];
	if(!en){alert("잘못된 엔티디 접근");return;}
	
	var newAttr=Object.create(attribute);
	  newAttr.init(opt);
	en.attr.push(newAttr);
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
	    getEntityByName:getEntityByName,
	    setAttribute:setAttribute,
	    hideEntity:hideEntity,
	    deleteEntity:deleteEntity
      };

})();

function repaint(){
    jsPlumb.repaintEverything();
}


