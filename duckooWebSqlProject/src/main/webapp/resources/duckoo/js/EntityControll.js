var EntityControll = (function(){
	
	function isEntityExist(name){
		var temp = EntityManager.getEntityByName(name);
		if(temp)return true;
		return false;
	}
	function isPkExist(){
		
	}
	
	return {isEntityExist:isEntityExist};	
})();