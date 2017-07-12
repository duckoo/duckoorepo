var codeUtils = (function(){
		
	var upperFirstLetter = function(entityName){
		var first = entityName[0].toUpperCase();
		var second = entityName.substring(1,entityName.length);
		
		return first+second;
	}

	var reverseRelationType = function(relationType){
		var reverseArr = relationType.split("To");
		
		var result = reverseArr[1]+"To"+reverseArr[0];
		return result;
	}
	function checkValue(targetClassInfo){
		
		var flag = true;
		classManager.getClassInfoArr().forEach(function(inClassInfo){
			//console.log("inClassInfo",inClassInfo);
			if(targetClassInfo.getClassName()==inClassInfo.getClassName()){
				console.log("Denied");
				flag=false;
			}
		});
		return flag;
	}
	function hasChild(targetEntity,pkProps){
		var flag = false;
		console.log("타겟 엔티티 네임.:",targetEntity.name);
		console.log("피케이배열 없뉘:",pkProps);
		for(var i=0;i<pkProps.length;i++){
			var id = attrNodeManager.get(targetEntity.search({id:Number(pkProps[i].id)})[0].id);
			console.log("그럼 아이디가 없냐 ",targetEntity.search({id:pkProps[i].id})[0]);
			for(var j =0;j<id.reId.length;j++){
				var tarRel = relationManager.get(id.reId[j]);
				console.log("타렐 소스:",tarRel.source);
				if(tarRel.source==targetEntity.name){
					flag = true;
					console.log("true됨 시발아");
				}
			}
		}
			
		return flag;
	}
	
	function effectiveEntity(entities, entity){
        var flag = true;
        
        entities.forEach(function(en){
            if(entity.name==en.name){flag = false;}
            
            
        })
        return flag;
    }
	
	return{upperFirstLetter:upperFirstLetter,
		  reverseRelationType:reverseRelationType,
		  checkValue:checkValue,
		  hasChild:hasChild,
		  effectiveEntity:effectiveEntity
	}
	
})();

