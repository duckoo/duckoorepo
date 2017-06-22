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
	
	return {isEntityExist:isEntityExist,
			isPkExist:isPkExist};	
	
})();