var classInfoMaker = (function(){
	
	var targetNode;
	
	var makeClassInfo = function(targetNode){
	
		var targetEntity = EntityManager.getEntityByName(targetNode.entity);
		
		var tempClassInfo = new classInfo();
		
		console.log("prototype?:",tempClassInfo);
		
		
		tempClassInfo.className = codeUtils.upperFirstLetter(targetNode.entity);
		tempClassInfo.tableName = targetNode.entity;
		var annotations = [];
		annotations.push("Entity");
		
		
		//상속용으로 만들어봄. 나중에 쓸데 있으면씀.
		/*if(targetNode.reId.length>0){
			annotations.push("Dtype");
		}*/
		
		//property make(superClass);
		tempClassInfo.setProp(propMaker.makeProp(targetEntity,tempClassInfo));
		
		tempClassInfo.annotations = annotations;
		
		
		classManager.addClassInfo(tempClassInfo);
		
		return tempClassInfo;
	}
	
	var mkClassInfo = function(targetEntity){
        var tempClassInfo = new classInfo();
        
        console.log("prototype?:",tempClassInfo);
        
        
        tempClassInfo.className = codeUtils.upperFirstLetter(targetEntity.name);
        tempClassInfo.tableName = targetEntity.name;
        var annotations = [];
        annotations.push("Entity");
        
        
        //상속용으로 만들어봄. 나중에 쓸데 있으면씀.
        /*if(targetNode.reId.length>0){
            annotations.push("Dtype");
        }*/
        
        //property make(superClass);
        tempClassInfo.setProp(propMaker.makeProp(targetEntity,tempClassInfo));
        
        tempClassInfo.annotations = annotations;
        
        
        classManager.addClassInfo(tempClassInfo);
        
        return tempClassInfo;
        
        
    }
	
	return{makeClassInfo:makeClassInfo,
		mkClassInfo:mkClassInfo}
	
})();
