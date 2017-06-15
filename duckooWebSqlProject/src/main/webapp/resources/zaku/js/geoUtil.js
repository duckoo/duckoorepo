var genLinefx = function(p1, p2) {
	var x = (p1.x - p2.x);
	var y = (p1.y - p2.y);
	var a = (y / x);
	var b = p1.y - a * (p1.x);
	return ({
		a : a,
		b : b,
		fx : function(x) {// 정함수
			return a * x + b;
		},
		rfx : function(x) {// 역함수
			return (x - b) / a;
		}
	});
}

var getNearPoint = function(desk, pArr) {
	var ret = Infinity;
	var idx = 0;
	for (var i = 0; i < pArr.length; i++) {
		var dis = getDistance2D(desk, pArr[i]);
		if (ret > dis) {
			ret = dis;
			idx = i;
		}
	}
	return pArr[idx];
}

var getDistance2D = function(p1, p2) {
	var x = p1.x - p2.x;
	var y = p1.y - p2.y;
	x = x * x;
	y = y * y;
	return Math.sqrt(x + y);
}


////////RECT
function inRectPoint(Rect, p1) {
	if (Rect.left <= p1.x && p1.x <= Rect.right)
		if (Rect.top <= p1.y && p1.y <= Rect.bottom)
			return true;
	return false;
}

function getRectContactLinerFxPoint(linerFx,Rect){
	var p1= linerFx.fx(Rect.right); // 이함수는 저의 수치 이니까 
	var p2= linerFx.fx(Rect.left);  // 해석할려고 하지마시오..
	var p3= linerFx.rfx(Rect.top);
	var p4= linerFx.rfx(Rect.bottom);
	/////////////////////////////////// 
	  var arr=[];//우엑
	   arr.push({x:Rect.right,y:linerFx.fx(Rect.right)});
	   arr.push({x:Rect.left, y:linerFx.fx(Rect.left)});
	   arr.push({x:linerFx.rfx(Rect.top),y:Rect.top});
	   arr.push({x:linerFx.rfx(Rect.bottom),y:Rect.bottom});
	   var ret=[];
	   for(var i=0;i<arr.length;i++){
		  if( inRectPoint( Rect,arr[i]))
			  ret.push(arr[i]);
	   }
	   return ret;
 }

function get$DivToRect($div){
	 var left= $div.offset().left || 0;
	 var top = $div.offset().top || 0;
	 var x= left+($div.width()/2);
	 var y= top +($div.height()/2);
	 var bottom=top +($div.height());
	 var right=left+$div.width();
	 return {x:x,y:y,left:left,top:top,bottom:bottom,right:right};
}

function genRect2Pos(p1,p2){
	var left =p1.x <p2.x?p1.x:p2.x;
	var right=p1.x >p2.x?p1.x:p2.x;
	var top=p1.y<p1.y?p1.y:p2.y;
	var bottom=p1.y>p1.y?p1.y:p2.y;
	return {left:left,right:right,top:top,bottom:bottom};
}

function getCenterPos(rect){
	var cx=(rect.left+rect.right)/2;   
	var cy=(rect.top+rect.bottom)/2;
	return {x:cx,y:cy};
}

function genRectCenterStraightLine(rect){ //이 함수는 조끔
//	var cx=(rect.left+rect.right)/2;    // 꺼림칙하다.
//	var cy=(rect.top+rect.bottom)/2;
//	
	var cen=getCenterPos(rect);
	console.log("cen",cen);
	return {
		fx : function(x) {
			return cen.y;
		},
		rfx : function(x) {
			return cen.x;
		}
	}
}

