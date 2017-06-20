
var EntityManager=(function(){
	var entityArr={};// all of Entity;
	var focusedEntity=undefined;
	var $dom =$("#canvasDiv");	
	var entityHtml=$("#entityTemplate").html();
	var entityTemplate=Handlebars.compile(entityHtml);
	
	Handlebars.registerHelper("getAttrHeight",function(ex){
		var str="height:";
		if(ex)str+="285px";
		else str+="68px";
		return str;
	});
		
	 var counter=(function(){
		   var count=0;
		   return function(){return count++;}
	 })();
	
////////////////////////////////// inner Object protoType
	var attribute = {
			id:undefined,
			lName:undefined,
			pName:undefined,
			domainName:undefined,
			datetype:undefined,
			datelength:0,
			nullable:true,
			isPk:false,
			isFk:false,
			defaultExp:undefined,
			init : function(opt) {
			  this.setAttribute(opt);
			   this.id=counter();
			},
			setAttribute:function(attrList){
				var key=Object.keys(attrList);
				for(var i=0,len=key.length; i<len;i++){
					this[key[i]]=attrList[key[i]];
				}
			},
			compare:function(attr){
				var key=Object.keys(attr);
				var ret={};
				for( var i=0,len=key.length; i<len;i++){
					if( this[key[i]]===attr[key[i]])
						ret[key[i]]=true;
				}
				return ret;
			},
			clone:function(){
				var nin= Object.create(attribute);
				for( var attr in this){
					nin[attr]=this[attr];
				}
				return nin;
			}
		};
   var entity = {
		name : undefined,
		//attr:[],
		extend:undefined,
		init : function(opt) {
			this.name = opt.name || undefined;
			this.extend=false;
		 },
		genHtml:function(){
		  return entityTemplate(this);
		},
		getAttr:function(id){
			if(arguments.length===0){return this.attr;}
			for(var i=0,len=this.attr.length; i<len;i++){
				if(this.attr[i]["id"]===id){
					return this.attr[i];
				}
			}
			return undefined;
		},
		search:function(att){
			var ret=[];
			for( var attrVal of this.attr){
				console.log("===",attrVal.compare(att));
				var obj=attrVal.compare(att);
			   if(Object.keys(obj).length!==0){
				   ret.push(attrVal);
				}
			}
			return ret;
		},
		sortAttribute:function(){
			var deskPk=[];
	        var deskFK=[];
	        var desk=[];
			for(var i=0,len=this.attr.length;i<len;i++){
				var att= this.attr[i];
			  if(att.isPk)
				deskPk.push(att);
			  else if(att.isFk)
				deskFK.push(att);
			  else 
				desk.push(att)
			}
            this.attr=deskPk.concat(deskFK,desk);			
		},
		deleteAttr:function(id){
			var ret =undefined;
			for(var i=0,len=this.attr.length; i<len;i++){
				if(this.attr[i]["id"]===id){
					var ret =this.attr[i];
				    this.attr.splice(i,1);
				    break;
				}
			}
			return ret;
		},
		setAttr:function(opt){
			var thatAttr= this.getAttr(opt.id);
		
			if(thatAttr){
				thatAttr.setAttribute(opt);
			   return;
			}
			var newAttr=Object.create(attribute);
			  newAttr.init(opt);
			this.attr.push(newAttr);
		},
		 setAttrArray:function(arr){
			this.attr=arr; 
		 },
	    clone:function(){
	       var newEntity=Object.create(entity);
	       for( var pt in this){
	    	   newEntity[pt]=this[pt];
			}
	       var ret=[]; 
	    	for(var i=0,len=this.attr.length; i<len;i++){
	    		ret.push(this.attr[i].clone());
	    	}
	    	newEntity.setAttrArray(ret);
	    	return newEntity;
	    }
	 };
////////////////////////////////////////////////////////////////////////////////////////////////
	$dom.on("click",".entity",function(e){
		e.stopPropagation();
	    e.preventDefault();	
	     
	     var id= $(this).attr("id");
	  
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
	
	$dom.on("dblclick",".entity",function(e){
		
		e.stopPropagation();
	    e.preventDefault();	
		   
	  var name= $(this).attr("id");
	
	  var cEntity= entityArr[name].clone();
	    
		 modalAttribute.setModal(cEntity,modal);
		 $("#myModal").modal();
	});
	
	
   $dom.on("click",".scaleUpBtn",function(e){
		    e.stopPropagation();
		    e.preventDefault();
		    var entityId = $(this).attr("data-scaleBtn");
		    var $entity = $("#"+entityId);
		    entityArr[entityId].extend=true;
		    entityArr[entityId].sortAttribute();
		    $entity.html($(entityArr[entityId].genHtml()).html());
		    var $innerEntity = $("[data-innerEntity='"+entityId+"']");
		    $entity.css("width",300);
		    $entity.css("height",350);
		    $innerEntity.css("width",275);
		    $innerEntity.css("height",325);
		    $entity.find('.scaleUpBtn').attr("class","scaleDownBtn");
		  });
	
	    $dom.on("click",".scaleDownBtn",function(e){
		    e.stopPropagation();
		    e.preventDefault();
		    var entityId = $(this).attr("data-scaleBtn");
		    var $entity = $("#"+entityId);
		    var $innerEntity = $("[data-innerEntity='"+entityId+"']");
		    entityArr[entityId].extend=false;
		    entityArr[entityId].sortAttribute();
		    $entity.html($(entityArr[entityId].genHtml()).html());
		    $entity.css("width",175);
		    $entity.css("height",125);
		    $innerEntity.css("width",150);
		    $innerEntity.css("height",100);
		    $entity.find('.scaleDownBtn').attr("class","scaleUpBtn");
		  });

// function///////////////////////////////////////////////////////////////////////////////////////////////////// 
function createEntity(opt,show){
	if(!opt.name){
		alert("Entity 생성 잘못된 이름");
		return;
	}
    var newEntity=Object.create(entity);
    Object.defineProperty(newEntity,"attr",{
    	  value:[],
	      writable:true,
	       enumerable:true,
	       configurable:false
    });
      newEntity.init(opt);
       Object.defineProperty(entityArr,newEntity.name,{
	         value:newEntity,
	         writable:true,
	         enumerable:true,
	         configurable:false
	   }); 
       
       if(show){
    	   showEntity(opt.name);
       }
    return newEntity;
}	

	
function showEntity(name){
	var en=getEntityByName(name);
	if(!en){
	 console.log(en);
		return;
	}
	var str=en.genHtml();
	$dom.append(str);
	$("#"+name).draggable();
}
function hideEntity(name){
	var en=getEntityByName(name);
	if(!en)return;
	$("#"+en.name).remove();
}

function deleteEntity(name){
	var en=getEntityByName(name);
	 if(!en)return;
	 hideEntity(name);
	 delete en; //delete 쓰지말라고하던데 흠
}

function setFocusByName(name){
	focusedEntity=entityArr[name];
}
function setAttribute(entityName,opt){
	var en=getEntityByName(entityName);
	if(!en){alert("잘못된 엔티디 접근");return;}
	en.setAttr(opt);
}

function  getFocusByName(){
	var _focusedEntity= focusedEntity||{};
  return _focusedEntity.name;
}

function getEntityByName(name){
	return entityArr[name];
}
function setEntity(entity){
	if(!entity || !entity.name){return ;}
	entityArr[entity.name]=entity;
}

return {
	    createEntity:createEntity,
	    showEntity:showEntity,
	    setEntity:setEntity,
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

