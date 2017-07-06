var SaveAndLoad=(function(){
	
	function SaveAndLoad(o){
		var o= o ||{};
		this.entitys= o.entitys || {};
		this.relations=o.relations || {};
		this.nodes= o.nodes || {};
	}
	
	function loadEntity(jobj){
	   EntityManager.setJObj(jobj);
	 var date_entitys= EntityManager.getEntityByName();
	 var key = Object.keys(date_entitys);  
	 
	   for(var i=0,len = key.length;i<len ;i++){
		   v(date_entitys[key[i]]).show();//이걸 매니저로 빼기도 애매하고..
	    }
	}
	function loadRelation(jobj){
	    relationManager.setJObj(jobj);
	    var date_relation=relationManager.get();
	    var key= Object.keys(date_relation);
	    for(var i=0,len = key.length;i<len ;i++){
	    	renderManager.connectEntity(date_relation[key[i]]);
	    }
	}
	
	function loadNode(jobj){
		attrNodeManager.setJObj(jobj);
	}
	
	SaveAndLoad.prototype.load=function(json){
		var jobj= JSON.parse(json);
		console.log("jobj",jobj);
		jobj=jobj.json;
		loadEntity.call(this,jobj.entitys);
		loadRelation.call(this,jobj.relations);
		loadNode.call(this,jobj.nodes);
	}
	
	SaveAndLoad.prototype.saveToJson=function(){
		 var enArr=EntityManager.getEntityByName();
		 var noArr=attrNodeManager.prepareJSON();
		  var reArr=relationManager.get();
		 this.entitys=enArr;
		 this.nodes=noArr;
		 this.relations=reArr;
		 var ret= JSON.stringify(this);
		 console.log("json: ",ret);
		 
		 
		 $.ajax({
				  url : '/rest/setErdPageJSON'
		        , method : "post"
				, dataType : 'json'
				, data : ret
				, processData : true 
				, contentType : "application/json; charset=UTF-8"
				, success : function(data, stat, xhr) {
					alert("success");
				}
			    , error : function(xhr, stat, err) {
			    	alert("error");
			    	console.log(err);
			    }
			});
		 return ret;
	}
	return new SaveAndLoad();
})();