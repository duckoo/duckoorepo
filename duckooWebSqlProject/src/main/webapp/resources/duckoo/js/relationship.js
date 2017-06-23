var RelationShipManager = (function() {
	var relationship = {
		name : undefined,
		source : undefined,
		target : undefined,
		RelationAttrName : [ [], [] ],
		relationType:undefined,
		relationLine:undefined,
		init : function(opt) {
			this.name = opt.name||undefined;
			this.source = opt.source||undefined;
			this.target = opt.target||undefined;
			this.RelationAttrName = opt.RelationAttrName||undefined;
			this.relationType=opt.relationType||undefined;
			this.relationLine = opt.relationLine||undefined;
		}
	// database 공부합시다.
	}
//////////////////////////////////////////////////////////////////////
	var relationshipArr = {};
/////////////////////////////////////////////////////////////////////////
	function createRelationship(opt) {
		var newRela = Object.create(relationship);
		Object.defineProperty(relationshipArr, newRela.name, {
			value : newRela,
			writable : false,
			enumerable : true,
			configurable : false
		});
		newRela.init(opt);
		
	}
	function getRelationship(rName) {
		return relationshipArr[rName];
	}
	
	function getSource(target){
		var key= Object.keys(relationshipArr);
		 var source=[];
		for(var i=0;i<key.length;i++){
			
			
			var temp= relationshipArr[key[i]];
			console.log("temp: ",temp);
			if(temp.target===target)
				source.push(temp);
		}
		return source;
	}
	return {
		createRelationship : createRelationship,
		getRelationship : getRelationship,
		getSource:getSource
	}

})();