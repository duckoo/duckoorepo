
var renderManager=(function(){
	var lines={};
////////////////////////////////////////////////////////////////
	function connectDiv(opt){
		
		var $source= opt.$source ||undefined;
		var $target= opt.$target ||undefined;
		//console.log("line option :",opt.lineType);
		var paintStyle = {  
				strokeStyle: "#F14343",
				lineWidth: 5,
				dashstyle:undefined
		        };
		
		if(opt.lineType=="nidentify"){
			paintStyle.dashstyle= "3 3";
		}
		if(!($source) || !($target) ){
			alert("잘못된 이름 ");
			return;
		}
	
	/*	var urlLeft="/resources/images/dackbal_Left.png";
		var urlRight="/resources/images/dackbal_Right.png";
		var urlTop="/resources/images/dackbal_Top.png";
		var urlBottom="/resources/images/dackbal_Bottom.png";
		var urlLeft2="/resources/images/dackbal_Left.png";
		var urlRight2="/resources/images/dackbal_Right.png";
		var urlTop2="/resources/images/dackbal_Top.png";
		var urlBottom2="/resources/images/dackbal_Bottom.png";*/
		var sLabel="1";
		var tLabel="N";
		
		var sou= jsPlumb.addEndpoint($source,{
			anchor:"Continuous",
			endpoint:[ "Dot", { radius:10 } ],
			paintStyle:{strokeStyle:"#000000",fillStyle:"transparent",radius:10,lineWidth:3},                
			    
			//connectorStyle:{lineWidth:4,strokeStyle:"#567F9F",joinstyle:"round",outlineColor:"white",outlineWidth:1},
		    overlays:[
				[ "Label", { label:sLabel, id:"label_"+$source, location:[0.5, 0.5] } ]
			],
		});
		var tar= jsPlumb.addEndpoint($target,{
			anchor:"Continuous",
			endpoint:[ "Dot", { radius:10 } ],
			paintStyle:{strokeStyle:"#000000",fillStyle:"transparent",radius:10,lineWidth:3},                
		   overlays:[
				[ "Label", { label:tLabel, id:"label_"+$target,location:[0.5, 0.5] } ]
			]
		});
		var obj= jsPlumb.connect({
			 source:sou, 
			 target:tar,
			 detachable:false,
			  connector:["Flowchart", { gap:9}],
			 paintStyle:paintStyle
		});
		
	   Object.defineProperty(lines,opt.id,{
	         value:obj,
	         writable:true,
	         enumerable:true,
	         configurable:true
	    });
	   
	  jsPlumb.repaintEverything();   
	}

	
	function getConnecter(id){
		return lines[id];
	}
	
	function repaintEverything(){
		jsPlumb.repaintEverything();
	}
	return {
		connectDiv:connectDiv,
		repaintEverything:repaintEverything,
		getConnecter:getConnecter
	}
})();

