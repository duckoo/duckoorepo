var drawBezier2C = function(id, s1, e1) {//deprecate Method
	var svgLine = document.getElementById("svg");
	var path = document.createElementNS("http://www.w3.org/2000/svg", "path");

	svgLine.appendChild(path);
	if (!document.getElementById(id))
		path.setAttribute("id", id);

	var cx = ((s1.x + e1.x) / 2);
	document.getElementById(id).setAttribute(
			"d",
			"M" + s1.x + " " + s1.y + " C " + cx + " " + s1.y + ", " + cx + " "
					+ e1.y + ", " + e1.x + " " + e1.y);
	document.getElementById(id).setAttribute("fill", "none");
	document.getElementById(id).setAttribute("stroke-width", "2");
	document.getElementById(id).setAttribute("stroke", "#000");

}

var drawLine=function(id,s1,e1,opt){
	// <line x1="0" y1="0" x2="200" y2="200" style="stroke:rgb(255,0,0);stroke-width:2" />
    var opt= opt || {};
	var svgLine = document.getElementById("svg");
	var line = document.createElementNS("http://www.w3.org/2000/svg","line");
	var style=opt.style || "stroke:rgb(255,0,0);stroke-width:2";
	
	 
	 svgLine.appendChild(line);
	 if(!document.getElementById(id))
		 line.setAttribute("id",id);
	 document.getElementById(id).setAttribute("x1",Math.round(s1.x));
	 document.getElementById(id).setAttribute("y1",Math.round(s1.y));
	 document.getElementById(id).setAttribute("x2",Math.round(e1.x));
	 document.getElementById(id).setAttribute("y2",Math.round(e1.y));
	 document.getElementById(id).setAttribute("style",style);
 }

function polyLineDraw(id,pt,opt){
	
	 var opt= opt || {};
		var svgLine = document.getElementById("svg");
		var line = document.createElementNS("http://www.w3.org/2000/svg","polyline");
		var style=opt.style || "stroke:rgb(255,0,0);fill:none;stroke-width:2";
		
		 svgLine.appendChild(line);
		 if(!document.getElementById(id))
			 line.setAttribute("id",id);
		 document.getElementById(id).setAttribute("points",pt);
		 document.getElementById(id).setAttribute("style",style);
	
}

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
	pt.x=Math.round(pt.x);
	pt.y=Math.round(pt.y);
	
	var left= rect.left;
	var right=rect.right;
	var top=rect.top;
	var bottom=rect.bottom;
	var arr=[];
	arr.push(function(p){
		p.y=top-7;
		p.getMiniRectCenter=function(width,heigth){
			width=width/2;
			heigth=heigth/2;
			return {x:this.x,y:(this.y-heigth),rpX:this.x,rpY:this.y-heigth*2};
		}
		return p;
	});
	arr.push(function(p){
		p.y=bottom-7;
		 p.getMiniRectCenter=function(width,heigth){
			width=width/2;
			heigth=heigth/2;
			return {x:this.x,y:(this.y+heigth),rpX:this.x,rpY:this.y+heigth*2};
		}
		return p;
	});
	
	arr.push(function(p){
		p.x=left-8;
		 p.getMiniRectCenter=function(width,heigth){
				width=width/2;
				heigth=heigth/2;
				return {x:this.x-width,y:this.y,rpX:this.x-width*2,rpY:this.y};
		}
		return p;
	});
	arr.push(function(p){
		p.x=right-8;
		 p.getMiniRectCenter=function(width,heigth){
				width=width/2;
				heigth=heigth/2;
				return {x:this.x+width,y:this.y,rpX:this.x+width*2,rpY:this.y};
		}
		return p;
	});
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
	console.log("td:",tempD);
	console.log("idx",idx);
	
	return arr[idx](pt);
}
