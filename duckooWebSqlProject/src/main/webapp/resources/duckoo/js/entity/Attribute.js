var Attribute=(function(){
	var counter=(function(){
		   var count=1;
		   return function(){return count++;}
	 })();	
////////////////////////////////////////////////////
	var attribute = {
			className:"attribute",
			id:undefined,
			lName:undefined,
			pName:undefined,
			domainName:undefined,
			datetype:undefined,
			datelength:0,
			notNull:false,
			isPk:false,
			isFk:false,
			defaultExp:undefined,
			autoIncrement:false,
			init :init,
			setAttribute:setAttribute,
			compare:compare,
			clone:clone
		};
///////////////////////////////////////////////////////
 function init(opt) {
	 var opt = opt || {};
	 this.setAttribute(opt);//
	 if(!opt.id)this.id=counter(); // 무조건 카운터주는걸 막았음 잠시만..	
  }
  function setAttribute(_attrList){
	  var attrList=_attrList||{};
	  var key=Object.keys(attrList);
		for(var i=0,len=key.length; i<len;i++){
			this[key[i]]=attrList[key[i]];
		  }
	}
  function compare(attr){
	  var key=Object.keys(attr);
			var ret={};
			for( var i=0,len=key.length; i<len;i++){
				if( this[key[i]]===attr[key[i]])
					ret[key[i]]=true;
			}
			return ret;
	}
   function clone(){
			var nin= creteInstance();
			for( var attr in this){
				nin[attr]=this[attr];
			}
			return nin;
	}
   function creteInstance(opt){
	  var newIn=Object.create(attribute);
	   newIn.init(opt);
		return newIn;
	}
 return {creteInstance:creteInstance,clone:clone};	
})();