var RelationShipManager = (function() {
	var relationship = {
		name : undefined,
		source : undefined,
		target : undefined,
		RelationAttrName : [ {}, {} ],
		relationType:undefined,
		relationLine:undefined,
		init : function(opt) {
			this.name = opt.temp.name||undefined;
			this.source = opt.temp.source||undefined;
			this.target = opt.temp.target||undefined;
			this.RelationAttrName = opt.temp.RelationType;
			this.relationType=opt.temp.relationType;
			this.relationLine = opt.temp.relationLine;
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
	return {
		createRelationship : createRelationship,
		getRelationship : getRelationship
	}

})();