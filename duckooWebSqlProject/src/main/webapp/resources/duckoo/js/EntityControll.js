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
	
	return {isEntityExist:isEntityExist,
			isPkExist:isPkExist,
			isEffectiveName:isEffectiveName};	
	
})();