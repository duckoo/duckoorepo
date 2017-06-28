
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
		
		
		var obj= jsPlumb.connect({
		       source:$source, 
		       target:$target,
		       detachable:false,
		       anchor:["Continuous", { faces:[ "bottom", "left" ,"right","top"] } ],
		       connector:['Flowchart'],
		       paintStyle:paintStyle,
		       
		      
		  });
		
	   Object.defineProperty(lines,opt.id,{
	         value:obj,
	         writable:true,
	         enumerable:true,
	         configurable:true
	    });
	   
	    //나중에 써먹어야된다.
        // 0: source, 1: target
	  var rectSor = getDivToRect($target.attr("id"));
	   var x=obj.getAttachedElements()[1].endpoint.x;
	   var y=obj.getAttachedElements()[1].endpoint.y;
	   
	   /*console.log("rect: ",rectSor );
	   console.log("pt On rect: ",projectPointInRect(rectSor,{x:x,y:y}));
	   
	   console.log("js: ",obj.getAttachedElements()[1].elementId);
	    console.log("js: ",obj.getAttachedElements()[1].endpoint.y);
	    console.log("js: ",obj.getAttachedElements()[1].endpoint.x); 
	    console.log("js: ",obj.getAttachedElements()[1].endpoint);
	    console.log("ep:",obj.getAttachedElements()[1].canvas.innerHTML);*/
	    
	    obj.getAttachedElements()[1].canvas.innerHTML="<img src='/resources/zaku/img/TestIMage.jpg'></img>";
	    jsPlumb.repaintEverything();
	   
	  //  projectPointInRect()
	    
	}
	//function setE
	
	
	function getConnecter(id){
		return lines[id];
	}
	
	function repaintEverything(){
		jsPlumb.repaintEverything();
	}
	return {
		connectDiv:connectDiv,
		repaintEverything:repaintEverything
	}
})();

function getDistance1FxOfPt(fx,pt){
	   var a=fx.a;
	   var b=fx.b;
	   var c=fx.c;
	   var x=pt.x;
	   var y=pt.y;
	   var d= (Math.abs(a*x+b*y+c))/Math.sqrt((a*a+b*b));
	   return d;
}
function projectPointInRect(rect,pt){ // 어느정도  근사된 점에서 사용해야된다.
	var left= rect.left;
	var right=rect.right;
	var top=rect.top;
	var bottom=rect.bottom;
	var arr=[];
	arr.push("top");
	arr.push("bottom");
	arr.push("left");
	arr.push("right");
	var tempD=Infinity;
	var idx=0;
	var arrD=[];
	arrD.push(getDistance1FxOfPt({a:0,b:1,c:-top},pt));
	arrD.push(getDistance1FxOfPt({a:0,b:1,c:-bottom},pt));
	arrD.push(getDistance1FxOfPt({a:1,b:0,c:-left},pt));
	arrD.push(getDistance1FxOfPt({a:1,b:0,c:-right},pt));
	
	for(var i=0;i<4; i++){
		if(tempD>arrD[i]){
			tempD=arrD[i];
			idx=i;
		}
	}
	//console.log("td:",tempD);
	//console.log("idx",idx);
	return arr[idx];
}

function getDivToRect(name){
	// jquery 안썻음.
	// 충돌 검사할때 모든 엔티티 검사해야하는데
	// 찾을때 jqurey로 찾으면 객체가 너무 비대해져서 느려질거같다.
	 var div= document.getElementById(name);
	 //console.log(div);
	 var left = div.offsetLeft;
	 var top= div.offsetTop;
	 var width=div.offsetWidth;
	 var height=div.offsetHeight;
	 var  right= left+width;
	 var bottom= top+height;
	 
	 var x=Math.round(left+width/2);
	 var y=Math.round(top+height/2);
	 var pt= {
			 x:x,y:y,width:width,height:height,
			 left:left,	top:top,right:right,bottom:bottom
	 };
	 //console.log("center",pt);
	 return pt;
}
