var classInfoMaker = (function(){
	
	var targetNode;
	
	var makeClassInfo = function(targetNode){
	
		var targetEntity = EntityManager.getEntityByName(targetNode.entity);
		
		var tempClassInfo = new classInfo();
		
		console.log("prototype?:",tempClassInfo);
		
		
		tempClassInfo.className = codeUtils.upperFirstLetter(targetNode.entity);
		var annotations = [];
		annotations.push("entity");
		
		
		//상속용으로 만들어봄. 나중에 쓸데 있으면씀.
		/*if(targetNode.reId.length>0){
			annotations.push("Dtype");
		}*/
		
		//property make(superClass);
		tempClassInfo.setProp(propMaker.makeProp(targetEntity,tempClassInfo));
		
		tempClassInfo.annotations = annotations;
		
		console.log("matched TempClassInfo",tempClassInfo);
		classManager.addClassInfo(tempClassInfo);
		
		return tempClassInfo;
	}
	
	var makeEmClassInfo = function(targetNode){
		
		
		
	}
	
	return{makeClassInfo:makeClassInfo,
		makeEmClassInfo:makeEmClassInfo}
	
})();
