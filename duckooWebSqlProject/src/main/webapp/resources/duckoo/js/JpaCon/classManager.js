var classManager = (function(){
	
	var ClassInfoArr = [];
	

	
	
	var addClassInfo = function(classInfo){
		console.log("targeted hmm classInfo",classInfo);
		if(ClassInfoArr.length==0){
			ClassInfoArr.push(classInfo);
		}
		if(codeUtils.checkValue(classInfo)){
			console.log("Accepted : ",classInfo);
			ClassInfoArr.push(classInfo);
		};
	}
	
	
	
	var getClassInfoArr = function(){
		return ClassInfoArr;
	}
	
	var getClassInfoByClassName = function(className){
		ClassInfoArr.forEach(function(classes){
			if(classes.className==className){
				return className;
			}
		})
		return {};
	}
	return{addClassInfo:addClassInfo,
		getClassInfoArr:getClassInfoArr}
	
	
	
})();

