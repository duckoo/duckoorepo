var EntityControll = (function(){
	
	function isEntityExist(name){
		var temp = EntityManager.getEntityByName(name);
		if(temp)return true;
		return false;
	}
	function isPkExist(srcPK,tarPK){
		if(srcPK.length!=0&&tarPK.length!=0){return true;}
		
		return false;
	}
	function isEffectiveName(collectedArr){
		for(var i=0;i<collectedArr.length;i++){
			
			for(var j=0;j<collectedArr.length;j++){
				if(i==j){continue;}
				if(collectedArr[i]==collectedArr[j]){return false;}
			}
		}
		return true;
	}
	
	//not use
	function isAlreadyConnected(tempRelation){
		
		
		console.log("connection founded",RelationShipManager.getRelation(tempRelation.name));
		if(RelationShipManager.getRelation(tempRelation.name)){
			return true;
		}else{
			return false;
		}
		
	}
	
	function isChangeable(src_table_id,attr){
		RelationShipManager.getRelationBySrcId();
		
		
	}
	//end
	function isDualKey(attr_id,sourceId){
		var obj = relationshipManager;
		
		
	};
	
	function isNameExist(cloneArr,tempRelation){
		
		for(var i=0;i<cloneArr.length;i++){
			var obj = EntityManager.getEntityByName(tempRelation.target).search({pName:cloneArr[i].pName});
			
			if(obj.length!=0){
				return true;
			}
			else{
				return false;
			}

		}
	}
	return {isEntityExist:isEntityExist,
			isPkExist:isPkExist,
			isEffectiveName:isEffectiveName,
			isAlreadyConnected:isAlreadyConnected,
			isNameExist:isNameExist};	
	
})();