var RelationShipManager = (function() {
	var relationship = {
		name : undefined,
		source : undefined,
		target : undefined,
		RelationAttrName : [ [], [] ],
		relationType:undefined,
		relationLine:undefined,
		restrictType:undefined,
		init : function(opt) {
			this.name = opt.name||undefined;
			this.source = opt.source||undefined;
			this.target = opt.target||undefined;
			this.RelationAttrName = opt.RelationAttrName||undefined;
			this.relationType=opt.relationType||undefined;
			this.relationLine = opt.relationLine||undefined;
			this.restrictType = opt.restrictType||undefined;
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
			writable : true,
			enumerable : true,
			configurable : true
		});
		newRela.init(opt);
		relationshipArr[newRela.name] = newRela;
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

	function getRelation(relationName){

	

		return relationshipArr[relationName];
	}
	function temp(pName){
		var obj = Object.keys(relationshipArr);
		console.log("루프 obj : ",pName);
		var targetElement;
		var srcElement;
		var tartarElement;
		for(var i=0;i<obj.length;i++){
			srcElement = relationshipArr[obj[i]].name.split("_")[0];
			targetElement = relationshipArr[obj[i]].name.split("_")[1];
			tartarElement = targetElement.split("/");
			for(var j=0;j<tartarElement.length;j++){
				console.log("타르타르타르타르타르타르:",tartarElement[j]);
				if(tartarElement[j] == pName){
					return relationshipArr[obj[i]];
				}
			}
		}
	}
	function getRelationBySrcId(srcid){
		for(var i = 0;relationshipArr.length;i++){
			if(relationshipArr[i].source==srcid){
				return relationshipArr[i];
				
			}
			
		}
		
	}
	
	
	return {
		createRelationship : createRelationship,
		getRelationship : getRelationship,
		getSource:getSource,
		getRelation:getRelation,
		temp:temp
	}

})();