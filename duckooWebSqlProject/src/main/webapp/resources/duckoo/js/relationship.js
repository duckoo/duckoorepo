var RelationShipManager = (function() {
	var relationship = {
		name : undefined,
		source : undefined,
		target : undefined,
		RelationAttrName : [ {}, {} ],
		init : function(opt) {
			this.name = opt.name;
			this.source = opt.source;
			this.target = opt.target;
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
	}
	function getRelationship(rName) {
		return relationshipArr[rName];
	}
	return {
		createRelationship : createRelationship,
		getRelationship : getRelationship
	}

})();