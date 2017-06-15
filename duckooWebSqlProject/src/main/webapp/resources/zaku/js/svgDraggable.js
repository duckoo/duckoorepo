/*
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
	// ///////////////////////////////////////////////////////////////

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
	
	
   //////////////////////////////////////////////////////var selectedElement =
   // 0; // 잠시만.

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
	// 싱글턴.

	return Object.create(foreignObj);

}
// ///////////////////////////////////////////////////
var foreignList = (function() {
	var fObjArr = {};
	var create = function(attr) {
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
		createElement : create,
		get : get
	};
})();

function selectElement(evt) {
	evt.stopPropagation();
	evt.preventDefault();
	
	console.log(evt.target);
	var id = evt.target.getAttribute("data-name");
	if (id) {
		foreignList.get(id).selectElement(evt);
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



*/