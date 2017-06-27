/*
  그냥  네이티브  프로퍼티(string, nubmer, undefined , boolean (null은 쓰면 안된다.)
    의 경우 프로퍼티() 에서 인자가 하나 있으면 셋이되고, 없으면 겟이 된다.
  
  프로퍼티가 배열이라면 프로퍼티()의 인자가 0개라면 배열자체를 반환
  1개라면 그 인자가 인덱스(정수)라면 요소값 반환
  2개라면  2번쨰인자로 첫번쨰인덱스 위치로 값 할당한다. 
  
  프로퍼티가 객체라면 거의 배열과같지만 , 첫번째인자로 정수(인덱스)대신 정수를 받는다.
 */
var spyContainer=(function(){
	function getClassType(obj){
		return Object.prototype.toString.call(obj).slice(8,-1);
    }
	
	function __get__(){return this.val;}
	function __set__(){
		if(arguments[0]){
		 this.val=arguments[0];
		 this.callFn.forEach(function(fn){fn(this.val);})
		}
	}
	function __getArray__(){
	 if(arguments.length===0)return this.val;
	   if(typeof arguments[0] ==="number")
		return this.val[arguments[0]];
	}
	function __setArray__(){
		var idx= arguments[0];
		var val= arguments[1];
		if( typeof  idx  ==="number" ){
			if(val){
				this.val[idx]=val;
			   this.callFn.forEach(function(fn){fn(this.val);});
		   }
		}
		return this.val[idx];
	}	
	function __getObj__(){
		if(arguments.length===0)return this.val;
		return this.val[arguments[0]];
	}
	function __setObj__(){
		var key =arguments[0];
		var val =arguments[1];
		if(val){
			this.val[key]=val;
			this.callFn.forEach(function(fn){fn(this.val);})
		}
		return this.val[key];
	}
	//////////////////////////////////////////////////
	function __getSet__(){
		var get= __get__;
		var set=__set__;
		if(getClassType(this.val)==="Object"){
			get=__getObj__;
			set=__setObj__;
			console.log("obj");
		}
		else if(getClassType(this.val)==="Array"){
			get=__getArray__;
			set=__setArray__;
			console.log("arr");
		}
		set.apply(this,arguments);
        return get.apply(this,arguments);
    }
	function __Obserable__(fn){
		if(!fn)return;
		this.callFn.push(fn);
	}
	function mapping(obj){
	   if(obj.mapped)return;
		var key=Object.keys(obj);
       for(var i=0,len=key.length;i<len;i++){
    	   var newObj={
             callFn:[],
        	 val:obj[key[i]]
           }
          obj[key[i]]= (function(ctx,fun){
        	  return function(){
        		  return fun.apply(ctx,arguments);
        	  }
          })(newObj,__getSet__);
          
          obj[key[i]]["observe"]=(function(ctx,fun){// callFn배열 등록
        	  return function(){
        		return  fun.apply(ctx,arguments);
        	  }
           })(newObj,__Obserable__);
          
          obj[key[i]]["change"]=(function(ctx){ // 프로퍼티에 등록된 콜백 강제 호출
        	  return function(){
        		  ctx.callFn.forEach(function(fn){fn(ctx.val);})
        	  }
          })(newObj);
          obj[key[i]]["excute"]=(function(ctx){// 등록한 함수 , this를 newObj바인딩한다. 
        	  return function(){
        		  return arguments[0].call(ctx);
        	  }
          })(newObj);
	   }
        obj.mapped=true;
		return obj;
	};

	
	
	function unMapping(obj){
		if(!obj.mapped)return obj;
		var ret={};
		var key=Object.keys(obj);
	       for(var i=0,len=key.length;i<len;i++){
	    	  if(typeof obj[key[i]] ==="function"){
	    	      (function(i){
	    		     var  val= obj[key[i]]();
	    		     ret[key[i]]=val;
	    	       })(i);
	    	  }
	       }
		return ret;
	}
	
	return {
		 mapping:mapping,
		 unMapping:unMapping
	}
})();