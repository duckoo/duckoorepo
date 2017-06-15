function createSvgImage(attr){
    var href=attr.href||"/resources/zaku/img/TestIMage.jpg";
	var x= attr.x || 0;
	var y= attr.y || 0;
	var width = attr.width || "20px";
	var height = attr.height || "20px";
	console.log("in????????????");
	var canvas = document.getElementById("svg");
	var img = document.createElementNS("http://www.w3.org/2000/svg",
			"image");
	
	console.log(img);
	img.setAttributeNS('http://www.w3.org/1999/xlink',"xlink:href",href);
	img.setAttributeNS(null,"x",x);
	img.setAttributeNS(null,"y",y);
	img.setAttributeNS(null,"width",width);
	img.setAttributeNS(null,"height",height);
	canvas.appendChild(img);
	return img;
}




function getNewForeignObj(attr) {
	if (!attr.id || document.getElementById(attr.id)) {
		alert(" 이미 존재하거나 잘못된 ID로  ForeignObj 생성 시도 ");
		return null;
	}
	var id = attr.id;
	var width = attr.width || 200;
	var height = attr.height || 200;
	var transform = attr.transform || "matrix(1 0 0 1 0 0)";
	var selectedElement = attr.selectedElement || selectElement;
	var moveElement = attr.moveElement || moveElement;
	var deselectElement = attr.deselectElement || deselectElement;
    var innerHTML=attr.innerHTML ||"";
	var canvas = document.getElementById("svg");
	var foreign = document.createElementNS("http://www.w3.org/2000/svg",
			"foreignObject");
	foreign.setAttribute("id", id);
	foreign.setAttribute("width", width);
	foreign.setAttribute("height", height);
	foreign.setAttribute("transform", transform);
	foreign.setAttribute("onmousedown", "selectElement(evt)");
	canvas.appendChild(foreign);
	foreign.innerHTML = "<div  class='draggable' data-name='" + id + "'>"+innerHTML+"</div>";
	function selectElement(evt) {
		evt.stopPropagation();
		evt.preventDefault();
		this.currentX = evt.clientX;
		this.currentY = evt.clientY;
		this.currentMatrix = foreign.getAttributeNS(null, "transform")
				.slice(7, -1).split(' ');
		for (var i = 0; i < this.currentMatrix.length; i++) {
			this.currentMatrix[i] = parseFloat(this.currentMatrix[i]);
		}
		foreign.setAttributeNS(null, "onmousemove",
				"moveElement(evt)");
		foreign.setAttributeNS(null, "onmouseout",
				"deselectElement(evt)");
		foreign.setAttributeNS(null, "onmouseup",
				"deselectElement(evt)");
	}
	function moveElement(evt) {
		var dx = evt.clientX - this.currentX;
		var dy = evt.clientY - this.currentY;
		this.currentMatrix[4] += dx;
		this.currentMatrix[5] += dy;

		foreign.setAttributeNS(null, "transform", "matrix("
				+ this.currentMatrix.join(' ') + ")");
		this.currentX = evt.clientX;
		this.currentY = evt.clientY;
	}
	function deselectElement(evt) {
		if (foreign != 0) {
			foreign.removeAttributeNS(null, "onmousemove");
			foreign.removeAttributeNS(null, "onmouseout");
			foreign.removeAttributeNS(null, "onmouseup");
			// this.selectedElement = 0;
		}
	}
	function setHTML(str){
	    foreign.innerHTML = "<div  class='draggable' data-name='" + id + "'>"+str+"</div>";
	}
	var foreignObj = {
		id : id,
		width : width,
		height : height,
		transform : transform,
		selectElement : selectElement,
		currentX :0,
		currentY :0,
		currentMatrix :0,
		moveElement: moveElement,
		deselectElement : deselectElement,
		setHTML:setHTML
	}
	return Object.create(foreignObj);
}
//---------------------------------------------------------------------------------------------------------\\
var foreignList = (function() {
	var fObjArr = {};
	var createElement = function(attr) {
		var fobj = getNewForeignObj(attr);

		Object.defineProperty(fObjArr, fobj.id, {
			value : fobj,
			writable : false,
			enumerable : true,
			configurable : false
		})
		return fobj.id;
	}
	var get = function(name) {
		return fObjArr[name];
	}
	return {
		createElement : createElement,
		get : get
	};
})();

//---------------------------------------------------------------------------------------------------------\\

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
		foreignObjectId:undefined,
		setFobj:function(id){
			this.foreignObjectId=id;
		},
		attr : [],
		init : function(opt) {
			this.name = opt.name || undefined;
			this.foreignObjectId=opt.foreignObjectId || undefined;
		 },
		genHtml:function(){
		var str="<div class='entity' id="+this.name+" onmousedown='entityClick(event)'>"+
   			"	<input type='text' style='float:left;'></input>"+
   			"	<div style='float:left; width:35%;'>"+
   			"		<button><i class='fa fa-wrench' aria-hidden='true'></i></button>"+
   			"		<button><i class='fa fa-trash' aria-hidden='true'></i></button>"+
   			"	</div>"+
   		 	" <div class='attrArea'>"+
   			"	<div name="+this.name+" class='pk'>"+
   			"	</div>"+
   			"   <div>"+
   			"		<button class='addAttrBtn' data-entityName='"+this.name+"'  data-attrType='pk' name='attrPlusBtn' onmousedown='addAttrBtn(event)'>"+
   			"			<i class='fa fa-plus' aria-hidden='true'></i>"+
   			"		</button>	"+
   			"	</div>"+
   			"	<hr style='border-width:1px; border-color:red;'>"+
   			"	<div name="+this.name+" class='std'>"+
   			"	</div>	"+
   			"	<div>"+
   			"		<button class='addAttrBtn' data-entityName='"+this.name+"' onmousedown='addAttrBtn(event)' data-attrType='std' name='attrPlusBtn'>"+
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
	
// private function///////////////////////////////////////////////////////////////////////////////////////////////////// 

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
}	
function showEntity(opt){
	if(!opt.name){
		alert("잘못된 이름");
		return;
	}
	var str= entityArr[opt.name].genHtml();
	entityArr[opt.name].setFobj(opt.id);
	opt.innerHTML=str;
	//console.log("fl: ",foreignList);
	foreignList.createElement(opt);
}

function setFocusById(name){
	focusedEntity=entityArr[name];
}


function  getFocusById(){
	var _focusedEntity= focusedEntity||{};
  return _focusedEntity.name;
}

function getEntityById(name){
	return entityArr[name];
}
return {
	   createEntity:createEntity,
	    showEntity:showEntity,
	    setFocusById:setFocusById,
	    getFocusById: getFocusById,
	    getEntityById:getEntityById
      };

})();



function addAttrBtn(e){
	e.stopPropagation();
    e.preventDefault();	
    console.log(e.target);
}


function selectElement(evt) {
	evt.stopPropagation();
	//evt.preventDefault();*/
	console.log(evt.target);
	var id = evt.target.getAttribute("data-name");
	if (id) {
		foreignList.get(id).selectElement(evt);
	}else{ //쓰레기코드인데 잠시만..
		var className=evt.target.getAttribute("class");
		console.log("cn: ",className);
	}
	
}

function moveElement(evt) {
	var id = evt.target.getAttribute("data-name");
	if (id) {
		foreignList.get(id).moveElement(evt);
	}
}

function deselectElement(evt) {
	var id = evt.target.getAttribute("data-name");
	if (id) {
		foreignList.get(id).deselectElement(evt);
	}
	
}
function entityClick(e){
	e.stopPropagation();
    e.preventDefault();	
	var id=e.target.getAttribute("id");
	console.log("id:",id);
	if(EntityManager.getFocusById()===undefined){
		EntityManager.setFocusById(id);
		return;
	}
	
	if( EntityManager.getFocusById()!==id){
		 var pEntity=EntityManager.getEntityById(EntityManager.getFocusById());
		 var nEntity=EntityManager.getEntityById(id);
		 console.log("--",pEntity,nEntity);
		  var p1= get$DivToRect($("#"+pEntity.foreignObjectId));
          var p2= get$DivToRect($("#"+nEntity.foreignObjectId));
		 
          var fxObj=genLinefx(p1,p2);
          
          var pArr1=getRectContactLinerFxPoint(fxObj,p1);
          var pArr2=getRectContactLinerFxPoint(fxObj,p2);
        
          console.log("why:",p1,p2)
          var s1= getNearPoint(p2,pArr1);
          var s2= getNearPoint(p1,pArr2);
          console.log("preS",s1,s2);
          
          s1=projectPointInRect(p1,s1);
          s2=projectPointInRect(p2,s2); 
          console.log("NS",s1,s2);
          s1= s1.getMiniRectCenter(20,20);
          s2= s2.getMiniRectCenter(20,20);
          
          createSvgImage({x:s1.x-10,y:s1.y-10});
          createSvgImage({x:s2.x-10,y:s2.y-10});
          //document.getElementById("svg");
          drawLine("tt12312",{x:s1.rpX,y:s1.rpY},{x:s2.rpX,y:s2.rpY});
	}
}

/*
 *  
<image xlink:href="/resources/zaku/img/TestIMage.jpg" height="20" width="20"/>    
			  
 * function createSvgImage(attr){
    var href=attr.href||"/resources/zaku/img/TestIMage.jpg";
	var x= attr.x || 0;
	var y= attr.y || 0;
	var width = attr.width || 20;
	var height = attr.height || 20;
	
	var canvas = document.getElementById("svg");
	var img = document.createElementNS("http://www.w3.org/2000/svg",
			"image");
	
	img.setAttribute("x",x);
	img.setAttribute("y",y);
	img.setAttribute("xlink:href",href);
	img.setAttribute("width",width);
	img.setAttribute("height",height);
	canvas.appendChild(img);
	return img;
}
*/


