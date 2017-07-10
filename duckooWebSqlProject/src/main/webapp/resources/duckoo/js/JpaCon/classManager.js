var classManager = (function(){
	
	var ClassInfoArr = [];
	
	var addClassInfo = function(classInfo){
		if(ClassInfoArr.length==0){ClassInfoArr.push(classInfo)}
		
		
		else if(check(classInfo)){ClassInfoArr.push(classInfo)};
	}
	
	var check = function(targetClassInfo){
		ClassInfoArr.forEach(function(inClassInfo){
			if(targetClassInfo==inClassInfo){
				return false;
			}
		});
		return true;
	}
	
	
	var getClassInfoArr = function(){
		return ClassInfoArr;
	}
	return{addClassInfo:addClassInfo,
		getClassInfoArr:getClassInfoArr}
	
	
	
})();

