var verifyControll = (function(){
	
	function isEntityExist(name){
		var temp = EntityManager.getEntityByName(name);
		if(temp)return true;
		return false;
	}
	
	
	return {isEntityExist:isEntityExist};	
})();