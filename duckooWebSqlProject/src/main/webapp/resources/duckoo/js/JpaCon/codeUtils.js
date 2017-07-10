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
			console.log("inClassInfo",inClassInfo);
			if(targetClassInfo.getClassName()==inClassInfo.getClassName()){
				console.log("Denied");
				flag=false;
			}
		});
		return flag;
	}

	return{upperFirstLetter:upperFirstLetter,
		  reverseRelationType:reverseRelationType,
		  checkValue:checkValue
	}
	
})();

