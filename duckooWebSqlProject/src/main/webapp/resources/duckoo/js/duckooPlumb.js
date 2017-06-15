
var renderManager=(function(){
	var lines={};
	
	function connectDiv(opt){
		
		var $source= opt.$source || undefined;
		var $target= opt.$target ||undefined;
		
		if(!($source) || !($target) ){
			alert("잘못된 이름 ");
			return;
		}
		var obj= jsPlumb.connect({
		       source:$source, 
		       target:$target,
		       detachable:false,
		       anchor:["Continuous", { faces:[ "bottom", "left" ,"right","top"] } ]
		  });
		
	   Object.defineProperty(lines,opt.id,{
	         value:obj,
	         writable:false,
	         enumerable:true,
	         configurable:false
	    });
	   
	    //나중에 써먹어야된다.
	   console.log("js: ",obj.getAttachedElements()[1].elementId);
	    console.log("js: ",obj.getAttachedElements()[1].endpoint.y);
	    console.log("js: ",obj.getAttachedElements()[1].endpoint.x); 
	    console.log("js: ",obj.getAttachedElements()[1].endpoint);
	   
	}
	
	function repaintEverything(){
		jsPlumb.repaintEverything();
	}
	return {
		connectDiv:connectDiv,
		repaintEverything:repaintEverything
	}
	
})();